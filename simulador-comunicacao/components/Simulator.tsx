"use client";

import { CatalogViewer } from "@/components/CatalogViewer";
import { EmailFrame, ViewSwitch, WhatsAppFrame } from "@/components/ChannelViews";
import { SettingsDialog } from "@/components/SettingsDialog";
import { asMap, type CatalogItem } from "@/lib/gupshup";
import {
  courseSteps,
  getStep,
  isMessage,
  PHASES,
  resolveBody,
  visibleInView,
} from "@/lib/engine";
import { loteAula, loteBemVinda } from "@/lib/lote";
import { defaultPrograma, EXEMPLO, fill } from "@/lib/placeholders";
import type {
  ChannelView,
  Chapter,
  Journey,
  Outcome,
  Setup,
  Step,
  ThreadItem,
} from "@/lib/types";
import { useEffect, useMemo, useRef, useState } from "react";

const DEFAULT: Setup = {
  journey: "online",
  outcome: "aprovada",
  entrouNoGrupo: true,
  doacaoAprovada: true,
  nome: EXEMPLO.nome,
  programa: EXEMPLO.programa,
};

type Snapshot = {
  thread: ThreadItem[];
  chapter: Chapter;
  index: number;
  sentD1: boolean;
  sentD3: boolean;
  outcome: Outcome;
};

export function Simulator() {
  const [setup, setSetup] = useState<Setup>(DEFAULT);
  const [chapter, setChapter] = useState<Chapter>("apos_pre");
  const [thread, setThread] = useState<ThreadItem[]>([]);
  const [sentD1, setSentD1] = useState(false);
  const [sentD3, setSentD3] = useState(false);
  const [index, setIndex] = useState(0);
  const [remote, setRemote] = useState<Record<string, string> | null>(null);
  const [view, setView] = useState<ChannelView>("whatsapp");
  const [catalog, setCatalog] = useState<CatalogItem[]>([]);
  const [catalogSource, setCatalogSource] = useState<"gupshup" | "mock">("mock");
  const [catalogError, setCatalogError] = useState<string | null>(null);
  const [picked, setPicked] = useState("");
  const [settingsOpen, setSettingsOpen] = useState(false);
  const [undoStack, setUndoStack] = useState<Snapshot[]>([]);
  const [redoStack, setRedoStack] = useState<Snapshot[]>([]);
  const [loteBusy, setLoteBusy] = useState(false);
  const loteQueue = useRef<ThreadItem[]>([]);
  const loteTimer = useRef<number | null>(null);

  useEffect(() => {
    fetch("/api/templates")
      .then((r) => r.json())
      .then((data) => {
        const items = (data.templates || []) as CatalogItem[];
        setCatalog(items);
        setRemote(asMap(items));
        setCatalogSource(data.source === "gupshup" ? "gupshup" : "mock");
        setCatalogError(data.error ?? null);
      })
      .catch(() => {
        setRemote({});
        setCatalogError("Falha ao consultar /api/templates");
      });
  }, []);

  function cancelLote() {
    if (loteTimer.current) {
      window.clearTimeout(loteTimer.current);
      loteTimer.current = null;
    }
    loteQueue.current = [];
    setLoteBusy(false);
  }

  useEffect(
    () => () => {
      if (loteTimer.current) window.clearTimeout(loteTimer.current);
    },
    [],
  );

  function loteDelay() {
    return 2000 + Math.floor(Math.random() * 1000);
  }

  function flushLote() {
    const next = loteQueue.current.shift();
    if (!next) {
      setLoteBusy(false);
      loteTimer.current = null;
      return;
    }
    const stamp = Date.now();
    setThread((prev) => [...prev, { ...next, stepId: `${next.stepId}-${stamp}` }]);
    if (loteQueue.current.length) {
      loteTimer.current = window.setTimeout(flushLote, loteDelay());
    } else {
      setLoteBusy(false);
      loteTimer.current = null;
    }
  }

  const later = useMemo(() => courseSteps(setup), [setup]);
  const current = later[index];

  function currentSnap(): Snapshot {
    return {
      thread,
      chapter,
      index,
      sentD1,
      sentD3,
      outcome: setup.outcome,
    };
  }

  function applySnap(snap: Snapshot) {
    setThread(snap.thread);
    setChapter(snap.chapter);
    setIndex(snap.index);
    setSentD1(snap.sentD1);
    setSentD3(snap.sentD3);
    setSetup((prev) => ({ ...prev, outcome: snap.outcome }));
  }

  function snapshot() {
    setUndoStack((prev) => [...prev, currentSnap()]);
    setRedoStack([]);
  }

  function undo() {
    cancelLote();
    const last = undoStack[undoStack.length - 1];
    if (!last) return;
    setRedoStack((prev) => [...prev, currentSnap()]);
    setUndoStack((prev) => prev.slice(0, -1));
    applySnap(last);
  }

  function redo() {
    const next = redoStack[redoStack.length - 1];
    if (!next) return;
    setUndoStack((prev) => [...prev, currentSnap()]);
    setRedoStack((prev) => prev.slice(0, -1));
    applySnap(next);
  }

  function itemsFrom(ids: string[]): ThreadItem[] {
    const rows: ThreadItem[] = [];
    for (const id of ids) {
      const step = getStep(id);
      if (!step) continue;
      const resolved = resolveBody(step, remote);
      rows.push({
        stepId: step.id,
        title: step.title,
        trigger: step.trigger,
        channels: step.channels,
        body: resolved.body,
        silent: step.silent || !isMessage(step),
        templateKey: step.templateKey,
        source: resolved.source,
      });
    }
    return rows;
  }

  function pushSteps(ids: string[]) {
    const rows = itemsFrom(ids);
    if (!rows.length) return;
    setThread((prev) => {
      const next = [...prev];
      for (const item of rows) {
        if (!next.some((row) => row.stepId === item.stepId)) next.push(item);
      }
      return next;
    });
  }

  function pushStep(id: string) {
    pushSteps([id]);
  }

  function append(items: ThreadItem[]) {
    const stamp = Date.now();
    setThread((prev) => [
      ...prev,
      ...items.map((item, i) => ({ ...item, stepId: `${item.stepId}-${stamp}-${i}` })),
    ]);
  }

  function resetPlay() {
    cancelLote();
    snapshot();
    setChapter("apos_pre");
    setThread([]);
    setSentD1(false);
    setSentD3(false);
    setIndex(0);
    setSetup((prev) => ({ ...prev, outcome: "aprovada" }));
  }

  function finalizarInscricao() {
    setSentD1(true);
    setSentD3(true);
    if (setup.journey === "online") {
      setChapter("confirmar_wa");
      return;
    }
    pushStep("inscricao_recebida");
    setChapter("selecao");
  }

  function elaEscreve() {
    setView("whatsapp");
    pushSteps(["ela_escreve_wa", "inscricao_recebida"]);
    setChapter("selecao");
  }

  function naoSegue() {
    setSetup((prev) => ({ ...prev, outcome: "nao_qualificada" }));
    pushStep("nao_seguiu");
    setChapter("fim");
  }

  function aprovada() {
    setSetup((prev) => ({ ...prev, outcome: "aprovada" }));
    pushStep(setup.journey === "online" ? "aprovada_online" : "aprovada_ph");
    setIndex(0);
    setChapter("curso");
  }

  function advanceCurso() {
    const step = later[index];
    if (!step) {
      setChapter("fim");
      return;
    }
    const resolved = resolveBody(step, remote);
    setThread((prev) => {
      if (prev.some((item) => item.stepId === step.id)) return prev;
      return [
        ...prev,
        {
          stepId: step.id,
          title: step.title,
          trigger: step.trigger,
          channels: step.channels,
          body: resolved.body,
          silent: step.silent || !isMessage(step),
          templateKey: step.templateKey,
          source: resolved.source,
        },
      ];
    });
    if (step.endsJourney || index >= later.length - 1) {
      setChapter("fim");
      setIndex(later.length);
      return;
    }
    setIndex(index + 1);
  }

  function sendOk() {
    snapshot();
    setView("whatsapp");
    append([
      {
        stepId: "ela-ok",
        title: "OK",
        trigger: "ok",
        channels: ["whatsapp"],
        body: "OK",
        templateKey: "",
        source: "mock",
      },
    ]);
    setChapter("curso");
  }

  function sendLote() {
    if (loteBusy) return;
    snapshot();
    setView("whatsapp");
    const first = !thread.some((item) => item.stepId.includes("lote-bv"));
    loteQueue.current = first ? loteBemVinda(setup.programa) : loteAula();
    setLoteBusy(true);
    setChapter("curso");
    flushLote();
  }

  function addMessage() {
    const item = catalog.find((row) => row.elementName === picked);
    if (!item) return;
    snapshot();
    append([
      {
        stepId: `add-${item.elementName}`,
        title: item.elementName,
        trigger: "sistema",
        channels: ["whatsapp", "email"],
        body: item.body,
        templateKey: item.elementName,
        source: "gupshup",
      },
    ]);
  }

  function removeMessage() {
    if (!thread.length) return;
    snapshot();
    setThread((prev) => prev.slice(0, -1));
  }

  function goForward() {
    if (redoStack.length) {
      redo();
      return;
    }
    snapshot();
    if (chapter === "apos_pre") finalizarInscricao();
    else if (chapter === "confirmar_wa") elaEscreve();
    else if (chapter === "selecao") aprovada();
    else if (chapter === "curso") advanceCurso();
  }

  function patch<K extends keyof Setup>(key: K, value: Setup[K]) {
    setSetup((prev) => ({ ...prev, [key]: value }));
  }

  function setJourney(journey: Journey) {
    setSetup((prev) => {
      const oldDefault = defaultPrograma(prev.journey);
      const nextDefault = defaultPrograma(journey);
      return {
        ...prev,
        journey,
        outcome: "aprovada",
        programa: prev.programa === oldDefault ? nextDefault : prev.programa,
      };
    });
    setThread([]);
    setChapter("apos_pre");
    setSentD1(false);
    setSentD3(false);
    setIndex(0);
    setUndoStack([]);
    setRedoStack([]);
    cancelLote();
  }

  const sample = {
    journey: setup.journey,
    nome: setup.nome,
    programa: setup.programa,
  };

  const visible = thread
    .filter((item) => visibleInView(item, view))
    .map((item) => ({ ...item, body: fill(item.body, sample) }));

  const phaseNow =
    chapter === "curso" || chapter === "fim"
      ? current?.phase ?? "encerramento"
      : chapter === "selecao"
        ? "selecao"
        : "inscricao";

  const composer =
    chapter === "confirmar_wa"
      ? {
          hint: `Oi! Me inscrevi no ${setup.programa}.`,
          onSend: () => {
            snapshot();
            elaEscreve();
          },
        }
      : chapter === "curso" || chapter === "selecao"
        ? { hint: "OK", onSend: sendOk }
        : undefined;

  return (
    <>
      <div className="topbar">
        <p className="topbar-meta">
          {setup.nome} · {setup.programa} ·{" "}
          {setup.journey === "ph" ? "Presencial / híbrido" : "Online"}
        </p>
        <div className="topbar-actions">
          <a className="ghost tiny" href="/v2">
            v2
          </a>
          <button
            className="icon-btn"
            type="button"
            aria-label="Abrir configurações"
            onClick={() => setSettingsOpen(true)}
          >
            ⚙
          </button>
        </div>
      </div>

      <SettingsDialog
        open={settingsOpen}
        onClose={() => setSettingsOpen(false)}
        setup={setup}
        view={view}
        onJourney={setJourney}
        onPatch={patch}
        onView={setView}
      />

      <div className="layout">
        <section className="stage">
          <ViewSwitch view={view} onChange={setView} />
          {view === "whatsapp" ? (
            <WhatsAppFrame
              journey={setup.journey}
              programa={setup.programa}
              items={visible}
              composer={composer}
            />
          ) : (
            <EmailFrame
              journey={setup.journey}
              programa={setup.programa}
              nome={setup.nome}
              items={visible}
            />
          )}
        </section>

        <aside className="card side">
          <div className="phases">
            {PHASES.map((p) => (
              <span
                key={p.id}
                className={`phase ${p.id === phaseNow ? "on" : ""}`}
              >
                {p.label}
              </span>
            ))}
          </div>

          <div className="nav-row">
            <button
              className="ghost"
              type="button"
              onClick={undo}
              disabled={!undoStack.length}
              aria-label="Passo anterior"
            >
              ←
            </button>
            <button
              className="primary"
              type="button"
              onClick={goForward}
              disabled={chapter === "fim" && !redoStack.length}
              aria-label="Próximo passo"
            >
              →
            </button>
          </div>
          <div className="nav-row">
            <button
              className="ghost"
              type="button"
              onClick={addMessage}
              disabled={!picked}
            >
              + Mensagem
            </button>
            <button
              className="ghost"
              type="button"
              onClick={removeMessage}
              disabled={!thread.length}
            >
              − Mensagem
            </button>
          </div>
          <CatalogViewer
            items={catalog}
            source={catalogSource}
            error={catalogError}
            selected={picked}
            onSelect={setPicked}
          />

          <Panel
            chapter={chapter}
            sentD1={sentD1}
            sentD3={sentD3}
            current={current}
            onD1={() => {
              snapshot();
              pushStep("relogio_1_dia");
              setSentD1(true);
            }}
            onD3={() => {
              snapshot();
              pushStep("relogio_3_dias");
              setSentD3(true);
            }}
            onFinalizar={() => {
              snapshot();
              finalizarInscricao();
            }}
            onEscrever={() => {
              snapshot();
              elaEscreve();
            }}
            onAprovada={() => {
              snapshot();
              aprovada();
            }}
            onNaoSegue={() => {
              snapshot();
              naoSegue();
            }}
            onAvancar={() => {
              snapshot();
              advanceCurso();
            }}
          />

          <div className="actions">
            <button className="primary" type="button" onClick={sendOk}>
              Ela envia OK
            </button>
            <button
              className="ghost"
              type="button"
              onClick={sendLote}
              disabled={loteBusy}
            >
              Liberar lote
            </button>
            <button className="ghost" type="button" onClick={resetPlay}>
              Recomeçar
            </button>
          </div>
        </aside>
      </div>
    </>
  );
}

function Panel({
  chapter,
  sentD1,
  sentD3,
  current,
  onD1,
  onD3,
  onFinalizar,
  onEscrever,
  onAprovada,
  onNaoSegue,
  onAvancar,
}: {
  chapter: Chapter;
  sentD1: boolean;
  sentD3: boolean;
  current?: Step;
  onD1: () => void;
  onD3: () => void;
  onFinalizar: () => void;
  onEscrever: () => void;
  onAprovada: () => void;
  onNaoSegue: () => void;
  onAvancar: () => void;
}) {
  if (chapter === "apos_pre") {
    return (
      <div className="actions">
        {!sentD1 ? (
          <button className="ghost" type="button" onClick={onD1}>
            1 dia
          </button>
        ) : null}
        {!sentD3 ? (
          <button className="ghost" type="button" onClick={onD3}>
            3 dias
          </button>
        ) : null}
        <button className="primary" type="button" onClick={onFinalizar}>
          Finalizou
        </button>
      </div>
    );
  }

  if (chapter === "confirmar_wa") {
    return (
      <div className="actions">
        <button className="primary" type="button" onClick={onEscrever}>
          Ela escreve
        </button>
      </div>
    );
  }

  if (chapter === "selecao") {
    return (
      <div className="actions">
        <button className="ghost" type="button" onClick={onNaoSegue}>
          Não segue
        </button>
        <button className="primary" type="button" onClick={onAprovada}>
          Aprovada
        </button>
      </div>
    );
  }

  if (chapter === "curso") {
    return (
      <div className="actions">
        <button className="ghost" type="button" onClick={onAvancar} disabled={!current}>
          Avançar
        </button>
      </div>
    );
  }

  return null;
}
