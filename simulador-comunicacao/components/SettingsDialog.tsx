"use client";

import { ViewSwitch } from "@/components/ChannelViews";
import type { ChannelView, Journey, Setup } from "@/lib/types";
import { useEffect } from "react";

export function SettingsDialog({
  open,
  onClose,
  setup,
  view,
  onJourney,
  onPatch,
  onView,
}: {
  open: boolean;
  onClose: () => void;
  setup: Setup;
  view: ChannelView;
  onJourney: (journey: Journey) => void;
  onPatch: <K extends keyof Setup>(key: K, value: Setup[K]) => void;
  onView: (view: ChannelView) => void;
}) {
  useEffect(() => {
    if (!open) return;
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open, onClose]);

  if (!open) return null;

  return (
    <div className="modal-backdrop" onClick={onClose} role="presentation">
      <div
        className="modal"
        role="dialog"
        aria-labelledby="settings-title"
        onClick={(e) => e.stopPropagation()}
      >
        <div className="modal-head">
          <h2 id="settings-title">Configurações</h2>
          <button className="icon-btn" type="button" onClick={onClose} aria-label="Fechar">
            ✕
          </button>
        </div>
        <div className="row">
          <label className="field">
            Jornada
            <select
              value={setup.journey}
              onChange={(e) => onJourney(e.target.value as Journey)}
            >
              <option value="online">Pela internet (online)</option>
              <option value="ph">Presencial / híbrido</option>
            </select>
          </label>
        </div>
        <div className="row">
          <label className="field">
            Nome
            <input
              value={setup.nome}
              onChange={(e) => onPatch("nome", e.target.value)}
              placeholder="{{1}}"
            />
          </label>
          <label className="field">
            Programa
            <input
              value={setup.programa}
              onChange={(e) => onPatch("programa", e.target.value)}
              placeholder="{{2}}"
            />
          </label>
        </div>
        <ViewSwitch view={view} onChange={onView} />
        <div className="checks">
          {setup.journey === "ph" ? (
            <label>
              <input
                type="checkbox"
                checked={setup.entrouNoGrupo}
                onChange={(e) => onPatch("entrouNoGrupo", e.target.checked)}
              />{" "}
              Entrou no grupo da turma
            </label>
          ) : null}
          <label>
            <input
              type="checkbox"
              checked={setup.doacaoAprovada}
              onChange={(e) => onPatch("doacaoAprovada", e.target.checked)}
            />{" "}
            Doação aprovada
          </label>
        </div>
      </div>
    </div>
  );
}
