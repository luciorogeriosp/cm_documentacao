"use client";

import { EmailFrame, ViewSwitch, WhatsAppFrame } from "@/components/ChannelViews";
import { compileEdition } from "@/lib/cms/compile";
import { auditEdition, auditSummary } from "@/lib/cms/coverage";
import { EDITION_EMPREENDE_ZAP } from "@/lib/cms/edition";
import { pickDefault } from "@/lib/cms/strapi";
import { TemplatePick, templateOf } from "@/components/v2/TemplatePick";
import { FLOWS, type CmsEdition, type CompiledEvent, type FlowId, type TipoAtividade } from "@/lib/cms/types";
import { asMap, type CatalogItem } from "@/lib/gupshup";
import { EXEMPLO, fill } from "@/lib/placeholders";
import type { ChannelView, Journey, ThreadItem } from "@/lib/types";
import { useEffect, useMemo, useRef, useState } from "react";

const TYPE_CHIP: Record<TipoAtividade, string> = {
  videoaula: "vídeo",
  atividade: "atividade",
  download: "download",
  tarefa: "tarefa",
  faturamento: "faturamento",
  plano: "plano",
  quest_inicial: "chegada",
  quest_final: "feedback",
  nps: "nps",
  aula: "aula",
  visita: "visita",
  mensagem: "mensagem",
  gatilho: "relógio",
};

function eventIdOf(stepId: string): string {
  const cut = stepId.indexOf(":");
  return cut === -1 ? stepId : stepId.slice(0, cut);
}

function toThread(event: CompiledEvent, messageId: string, body: string): ThreadItem {
  const message = event.messages.find((row) => row.id === messageId);
  const outgoing = message?.outgoing || event.kind === "ok" || event.kind === "dela";
  return {
    stepId: `${event.id}:${messageId}`,
    title: message?.title || event.label,
    trigger: outgoing ? (event.kind === "ok" ? "ok" : "dela") : "sistema",
    channels: message?.channels?.length
      ? message.channels
      : ["whatsapp", "email"],
    body,
    templateKey: message?.templateKey || "",
    source: message?.templateKey ? "gupshup" : "mock",
    kind: message?.kind,
  };
}

export function SimulatorV2() {
  const [editions, setEditions] = useState<CmsEdition[]>([]);
  const [edition, setEdition] = useState<CmsEdition>(EDITION_EMPREENDE_ZAP);
  const [journey, setJourney] = useState<Journey>(EDITION_EMPREENDE_ZAP.journey);
  const live = useMemo(
    () => ({ ...edition, journey }),
    [edition, journey],
  );
  const events = useMemo(() => compileEdition(live), [live]);
  const [flow, setFlow] = useState<FlowId>("nao_inscrita");
  const [on, setOn] = useState<Record<string, boolean>>({});
  const [thread, setThread] = useState<ThreadItem[]>([]);
  const [remote, setRemote] = useState<Record<string, string>>({});
  const [catalog, setCatalog] = useState<CatalogItem[]>([]);
  const [view, setView] = useState<ChannelView>("whatsapp");
  const [nome, setNome] = useState(EXEMPLO.nome);
  const [programa, setPrograma] = useState(edition.name);
  const [settings, setSettings] = useState(false);
  const [overrides, setOverrides] = useState<Record<string, string>>({});
  const [busy, setBusy] = useState(false);
  const queue = useRef<ThreadItem[]>([]);
  const timer = useRef<number | null>(null);
  const running = useRef(false);

  useEffect(() => {
    fetch("/api/edition")
      .then((r) => r.json())
      .then((data) => {
        const list = (data.editions || []) as CmsEdition[];
        if (list.length) setEditions(list);
        if (data.edition) {
          setEdition(data.edition);
          setJourney(data.edition.journey);
          setPrograma(data.edition.programaNome || data.edition.name);
        }
      })
      .catch(() => undefined);
    fetch("/api/templates")
      .then((r) => r.json())
      .then((data) => {
        const items = (data.templates || []) as CatalogItem[];
        setCatalog(items);
        setRemote(asMap(items));
      })
      .catch(() => setRemote({}));
  }, []);

  function chooseEdition(id: string) {
    const next = editions.find((item) => item.id === id);
    if (!next) return;
    cancelQueue();
    setEdition(next);
    setPrograma(next.programaNome || next.name);
    setOn({});
    setThread([]);
    setOverrides({});
    setFlow("nao_inscrita");
  }

  useEffect(
    () => () => {
      if (timer.current) window.clearTimeout(timer.current);
    },
    [],
  );

  const filteredEditions = useMemo(() => {
    const pool = editions.filter((item) => item.journey === journey);
    return pool.length ? pool : edition ? [edition] : [];
  }, [editions, journey, edition]);

  const visibleEvents = events.filter((event) => event.flow === flow);
  const audit = useMemo(
    () => auditEdition(live, events, catalog),
    [live, events, catalog],
  );
  const summary = useMemo(() => auditSummary(audit), [audit]);
  const gaps = audit.filter((row) => row.status !== "ok");

  function readyAt(index: number): boolean {
    if (index <= 0) return true;
    return visibleEvents.slice(0, index).every((event) => on[event.id]);
  }

  function keyOf(event: CompiledEvent): string {
    return overrides[event.id] ?? templateOf(event.messages);
  }

  function bodyOf(event: CompiledEvent, messageId: string): string {
    const message = event.messages.find((row) => row.id === messageId);
    if (!message) return "";
    const override = overrides[event.id];
    const key =
      message.kind === "pdf" || message.outgoing
        ? message.templateKey
        : override ?? message.templateKey;
    const raw = (key && remote[key]) || message.fallback;
    return fill(raw, { journey, nome, programa });
  }

  function assignTemplate(event: CompiledEvent, key: string) {
    setOverrides((prev) => ({ ...prev, [event.id]: key }));
    if (!on[event.id]) return;
    setThread((prev) =>
      prev.map((item) => {
        if (eventIdOf(item.stepId) !== event.id) return item;
        const messageId = item.stepId.slice(event.id.length + 1);
        const message = event.messages.find((row) => row.id === messageId);
        if (!message || message.kind === "pdf" || message.outgoing) return item;
        const raw = (key && remote[key]) || message.fallback;
        return {
          ...item,
          templateKey: key,
          source: key ? "gupshup" : "mock",
          body: fill(raw, { journey, nome, programa }),
        };
      }),
    );
  }

  function cancelQueue() {
    if (timer.current) window.clearTimeout(timer.current);
    timer.current = null;
    queue.current = [];
    running.current = false;
    setBusy(false);
  }

  function flush() {
    const next = queue.current.shift();
    if (!next) {
      running.current = false;
      setBusy(false);
      timer.current = null;
      return;
    }
    setOn((prev) => {
      const eid = eventIdOf(next.stepId);
      return prev[eid] ? prev : { ...prev, [eid]: true };
    });
    setThread((prev) => [...prev, next]);
    if (queue.current.length) {
      timer.current = window.setTimeout(flush, 2000 + Math.floor(Math.random() * 1000));
    } else {
      running.current = false;
      setBusy(false);
    }
  }

  function enqueue(items: ThreadItem[]) {
    if (!items.length) return;
    queue.current.push(...items);
    if (!running.current) {
      running.current = true;
      setBusy(true);
      flush();
    }
  }

  function chooseJourney(next: Journey) {
    if (next === journey) return;
    cancelQueue();
    setJourney(next);
    const pool = editions.filter((item) => item.journey === next);
    const keep =
      edition.journey === next
        ? edition
        : pickDefault(pool) || pool[0];
    if (keep) {
      setEdition(keep);
      setPrograma(keep.programaNome || keep.name);
    }
    setOn({});
    setThread([]);
    setOverrides({});
    setFlow("nao_inscrita");
  }

  function sendConfirmacao() {
    if (on["ela-escreve"]) return;
    const dela = events.find((event) => event.id === "ela-escreve");
    const reply = events.find((event) => event.id === "recebemos");
    if (!dela) return;
    setView("whatsapp");
    setFlow("inscrita");
    const outbound = dela.messages.map((message) =>
      toThread(dela, message.id, bodyOf(dela, message.id)),
    );
    const inbound = reply
      ? reply.messages.map((message) =>
          toThread(reply, message.id, bodyOf(reply, message.id)),
        )
      : [];
    setOn((prev) => ({
      ...prev,
      [dela.id]: true,
      ...(reply ? { [reply.id]: true } : {}),
    }));
    setThread((prev) => [...prev, ...outbound]);
    enqueue(inbound);
  }

  function switchFlow(next: FlowId) {
    cancelQueue();
    setFlow(next);
    setOn({});
    setThread([]);
    setOverrides({});
  }

  function toggle(event: CompiledEvent) {
    const index = visibleEvents.findIndex((row) => row.id === event.id);
    if (index < 0) return;
    if (on[event.id]) {
      const drop = new Set(visibleEvents.slice(index).map((row) => row.id));
      setOn((prev) => {
        const next = { ...prev };
        drop.forEach((id) => {
          delete next[id];
        });
        return next;
      });
      setThread((prev) => prev.filter((item) => !drop.has(eventIdOf(item.stepId))));
      return;
    }
    if (!readyAt(index)) return;
    if (event.id === "ela-escreve") {
      sendConfirmacao();
      return;
    }
    const items = event.messages.map((message) =>
      toThread(event, message.id, bodyOf(event, message.id)),
    );
    if ((event.kind === "lote" || event.kind === "atividade") && items.length > 1) {
      enqueue(items);
    } else {
      setOn((prev) => ({ ...prev, [event.id]: true }));
      setThread((prev) => [...prev, ...items]);
    }
  }

  function playFlow() {
    cancelQueue();
    setOn({});
    setThread([]);
    const items: ThreadItem[] = [];
    for (const event of visibleEvents) {
      for (const message of event.messages) {
        items.push(toThread(event, message.id, bodyOf(event, message.id)));
      }
    }
    enqueue(items);
  }

  const presented = thread.map((item) => ({
    ...item,
    body: fill(item.body, { journey, nome, programa }),
  }));

  return (
    <>
      <div className="topbar">
        <p className="topbar-meta">
          {edition.name} · {nome} · v2
        </p>
        <div className="topbar-actions">
          <a className="ghost tiny" href="/">
            v1
          </a>
          <button
            className="icon-btn"
            type="button"
            aria-label="Configurações"
            onClick={() => setSettings(true)}
          >
            ⚙
          </button>
        </div>
      </div>

      {settings ? (
        <div className="modal-backdrop" onClick={() => setSettings(false)}>
          <div className="modal" onClick={(e) => e.stopPropagation()}>
            <div className="modal-head">
              <h2>Configurações</h2>
              <button className="icon-btn" type="button" onClick={() => setSettings(false)}>
                ✕
              </button>
            </div>
            <div className="row">
              <fieldset className="radios">
                <label>
                  <input
                    type="radio"
                    name="cfg-journey"
                    checked={journey === "online"}
                    onChange={() => chooseJourney("online")}
                  />
                  Online
                </label>
                <label>
                  <input
                    type="radio"
                    name="cfg-journey"
                    checked={journey === "ph"}
                    onChange={() => chooseJourney("ph")}
                  />
                  Presencial / híbrido
                </label>
              </fieldset>
              <label className="field">
                Edição
                <select
                  value={edition.id}
                  onChange={(e) => chooseEdition(e.target.value)}
                >
                  {filteredEditions.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.name}
                      {item.modules.length ? ` · ${item.modules.length} mód.` : ""}
                    </option>
                  ))}
                </select>
              </label>
              <label className="field">
                Nome
                <input value={nome} onChange={(e) => setNome(e.target.value)} />
              </label>
              <label className="field">
                Programa
                <input value={programa} onChange={(e) => setPrograma(e.target.value)} />
              </label>
            </div>
          </div>
        </div>
      ) : null}

      <div className="layout">
        <section className="stage">
          <ViewSwitch view={view} onChange={setView} />
          {view === "whatsapp" ? (
            <WhatsAppFrame
              journey={journey}
              programa={programa}
              items={presented}
              composer={
                !on["ela-escreve"]
                  ? {
                      hint: "Oi! Me inscrevi",
                      onSend: sendConfirmacao,
                    }
                  : undefined
              }
            />
          ) : (
            <EmailFrame
              journey={journey}
              programa={programa}
              nome={nome}
              items={presented}
            />
          )}
        </section>

        <aside className="card side">
          <fieldset className="radios">
            <label>
              <input
                type="radio"
                name="journey"
                checked={journey === "online"}
                onChange={() => chooseJourney("online")}
              />
              Online
            </label>
            <label>
              <input
                type="radio"
                name="journey"
                checked={journey === "ph"}
                onChange={() => chooseJourney("ph")}
              />
              Presencial / híbrido
            </label>
          </fieldset>
          <label className="field">
            Edição
            <select
              value={edition.id}
              onChange={(e) => chooseEdition(e.target.value)}
            >
              {filteredEditions.map((item) => (
                <option key={item.id} value={item.id}>
                  {item.name}
                  {item.modules.length ? ` · ${item.modules.length} mód.` : ""}
                </option>
              ))}
            </select>
          </label>
          <fieldset className="radios">
            {FLOWS.map((item) => (
              <label key={item.id}>
                <input
                  type="radio"
                  name="flow"
                  checked={flow === item.id}
                  onChange={() => switchFlow(item.id)}
                />
                {item.label}
              </label>
            ))}
          </fieldset>

          <ol className="timeline">
            {visibleEvents.map((event, index) => {
              const open = Boolean(on[event.id]);
              const locked = !open && !readyAt(index);
              const isNext = !open && !locked;
              const gap = event.auditId
                ? audit.find((row) => row.id === event.auditId)
                : undefined;
              const missing = gap && (gap.status === "falta" || gap.status === "reprovado");
              const meta = [
                event.moduleTitle && event.kind === "atividade" ? event.moduleTitle : "",
                event.canais,
                event.requerOk ? "pede OK" : "",
                missing ? gap?.detail : gap?.status === "generico" ? gap.detail : "",
                isNext ? "próximo passo" : "",
              ]
                .filter(Boolean)
                .join(" · ");
              const chip = missing
                ? "falta"
                : event.activityType
                  ? TYPE_CHIP[event.activityType]
                  : event.kind;
              const showTpl = event.kind !== "ok" && event.kind !== "dela";
              return (
                <li
                  key={event.id}
                  className={`${open ? "on" : ""} ${locked ? "locked" : ""} ${isNext ? "next" : ""} ${missing ? "gap" : ""}`}
                >
                  <div className="tl-row">
                    <button
                      type="button"
                      onClick={() => toggle(event)}
                      disabled={busy || locked}
                    >
                      <span className="chip">{chip}</span>
                      <span className="tl-copy">
                        {event.label}
                        {meta ? <small>{meta}</small> : null}
                      </span>
                    </button>
                    {showTpl ? (
                      <TemplatePick
                        value={keyOf(event)}
                        items={catalog}
                        onChange={(key) => assignTemplate(event, key)}
                      />
                    ) : null}
                  </div>
                </li>
              );
            })}
          </ol>

          <div className={`audit ${summary.falta || summary.reprovado ? "bad" : summary.generico ? "warn" : "ok"}`}>
            <strong>
              {summary.falta || summary.reprovado
                ? `${summary.falta + summary.reprovado} sem cobertura`
                : summary.generico
                  ? `${summary.generico} com template genérico`
                  : "Cobertura ok"}
            </strong>
            {gaps.length ? (
              <ul>
                {gaps.map((row) => (
                  <li key={row.id}>
                    {row.label} — {row.detail}
                  </li>
                ))}
              </ul>
            ) : (
              <p>Toda atividade tem template e as variações desta jornada estão no fluxo.</p>
            )}
          </div>

          <div className="actions">
            <button className="primary" type="button" onClick={playFlow} disabled={busy}>
              Ligar fluxo
            </button>
            <button
              className="ghost"
              type="button"
              onClick={() => {
                cancelQueue();
                setOn({});
                setThread([]);
              }}
            >
              Limpar
            </button>
          </div>
        </aside>
      </div>
    </>
  );
}
