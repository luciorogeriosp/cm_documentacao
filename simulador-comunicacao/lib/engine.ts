import { STEPS } from "./scripts";
import type { ChannelView, Setup, Step, ThreadItem } from "./types";

export function getStep(id: string): Step | undefined {
  return STEPS.find((step) => step.id === id);
}

export function filterSteps(setup: Setup): Step[] {
  const filtered = STEPS.filter((step) => {
    if (!step.journeys.includes(setup.journey)) return false;
    if (step.outcomes !== "*" && !step.outcomes.includes(setup.outcome)) {
      return false;
    }
    if (step.requireEntrouNoGrupo && !setup.entrouNoGrupo) return false;
    if (step.requireNaoEntrouNoGrupo && setup.entrouNoGrupo) return false;
    if (step.requireDoacao && !setup.doacaoAprovada) return false;
    if (step.requireSemDoacao && setup.doacaoAprovada) return false;
    return true;
  });
  const end = filtered.findIndex((step) => step.endsJourney);
  return end >= 0 ? filtered.slice(0, end + 1) : filtered;
}

export function courseSteps(setup: Setup): Step[] {
  return filterSteps({ ...setup, outcome: "aprovada" }).filter(
    (step) =>
      step.phase === "curso" ||
      step.phase === "encerramento" ||
      step.id === "entrou_grupo" ||
      step.id === "nao_entrou_grupo",
  );
}

export function resolveBody(
  step: Step,
  remote: Record<string, string> | null,
): { body: string; source: "mock" | "gupshup" } {
  const raw =
    (step.templateKey && remote?.[step.templateKey]) || step.body;
  const source: "mock" | "gupshup" =
    step.templateKey && remote?.[step.templateKey] ? "gupshup" : "mock";
  return { body: raw, source };
}

export function isMessage(step: Step): boolean {
  return !step.silent && step.channels.some((c) => c !== "nenhum");
}

export const PHASES = [
  { id: "inscricao", label: "Inscrição" },
  { id: "selecao", label: "Seleção" },
  { id: "curso", label: "Curso" },
  { id: "encerramento", label: "Encerramento" },
] as const;

export function isOutgoing(item: ThreadItem): boolean {
  return item.trigger === "dela" || item.trigger === "ok";
}

export function visibleInView(item: ThreadItem, view: ChannelView): boolean {
  const system =
    item.silent === true ||
    item.channels.includes("nota") ||
    item.channels.includes("nenhum");
  if (view === "whatsapp") {
    return (
      system ||
      item.channels.includes("whatsapp") ||
      item.channels.includes("grupo") ||
      isOutgoing(item)
    );
  }
  return system || item.channels.includes("email");
}

export function clockFor(index: number): string {
  const minutes = 8 + (index % 10);
  return `14:${minutes.toString().padStart(2, "0")}`;
}
