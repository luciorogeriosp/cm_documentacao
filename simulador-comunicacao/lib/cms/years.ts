import type { CmsEditionSummary } from "./types";

export function yearsOf(list: CmsEditionSummary[]): number[] {
  return [...new Set(list.map((item) => item.anoReferencia).filter(Boolean))].sort(
    (a, b) => b - a,
  );
}

export function editionsInYear(list: CmsEditionSummary[], year: number): CmsEditionSummary[] {
  return list
    .filter((item) => item.anoReferencia === year)
    .sort((a, b) => a.name.localeCompare(b.name, "pt-BR"));
}

export function defaultYear(list: CmsEditionSummary[], preferredId?: string): number {
  const preferred = list.find((item) => item.id === preferredId || item.slug === preferredId);
  if (preferred) return preferred.anoReferencia;
  const now = new Date().getFullYear();
  if (list.some((item) => item.anoReferencia === now && item.ativo !== false)) {
    return now;
  }
  return yearsOf(list)[0] ?? now;
}

export function formatDate(raw?: string): string {
  if (!raw) return "";
  const day = raw.slice(0, 10);
  const [year, month, date] = day.split("-");
  if (!year || !month || !date) return raw;
  return `${date}/${month}/${year}`;
}

export function formatRange(start?: string, end?: string): string {
  const a = formatDate(start);
  const b = formatDate(end);
  if (a && b) return `${a} – ${b}`;
  return a || b;
}

export function journeyLabel(edition: Pick<CmsEditionSummary, "journey" | "tipo">): string {
  const tipo = (edition.tipo || "").toLowerCase();
  if (tipo === "hibrido" || tipo === "híbrido") return "Híbrido";
  if (tipo === "presencial") return "Presencial";
  if (tipo === "online" || edition.journey === "online") return "Pela internet";
  return edition.journey === "ph" ? "Presencial / híbrido" : "Pela internet";
}

export function catalogKeys(edition: {
  mensagemInscricao?: { elementName?: string };
  preInscricao?: { template?: { elementName?: string } };
  package: { templates: Record<string, string> };
  modules?: { activities: { mensagem?: { elementName?: string }; teaser?: { elementName?: string } }[] }[];
}): string[] {
  const keys = new Set<string>();
  if (edition.mensagemInscricao?.elementName) {
    keys.add(edition.mensagemInscricao.elementName);
  }
  if (edition.preInscricao?.template?.elementName) {
    keys.add(edition.preInscricao.template.elementName);
  }
  for (const value of Object.values(edition.package.templates)) {
    if (value) keys.add(value);
  }
  for (const mod of edition.modules || []) {
    for (const activity of mod.activities) {
      if (activity.mensagem?.elementName) keys.add(activity.mensagem.elementName);
      if (activity.teaser?.elementName) keys.add(activity.teaser.elementName);
    }
  }
  return [...keys];
}
