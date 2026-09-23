import type { CatalogItem } from "@/lib/gupshup";
import type { CmsActivity, CmsEdition, CompiledEvent, FlowId } from "./types";

export type AuditStatus = "ok" | "generico" | "falta" | "reprovado";

export type AuditRow = {
  id: string;
  kind: "atividade" | "jornada" | "relogio";
  label: string;
  status: AuditStatus;
  detail: string;
};

const GENERIC = new Set(["mensagem_realizar_atividade"]);

const SLOT: Record<string, string> = {
  videoaula: "videoaula",
  atividade: "atividade",
  download: "download",
  tarefa: "tarefa",
  faturamento: "faturamento",
  plano: "plano",
  quest_inicial: "quest_inicial",
  quest_final: "quest_final",
  nps: "nps",
  visita: "visita",
};

function catalogOf(items: CatalogItem[]) {
  const map = new Map<string, CatalogItem>();
  for (const item of items) map.set(item.elementName, item);
  return map;
}

function slotKey(activity: CmsActivity): string {
  if (activity.type === "aula") {
    return activity.modalidade === "ao_vivo" ? "aula_ao_vivo" : "aula_presencial";
  }
  return SLOT[activity.type] || activity.type;
}

function judgeKey(
  key: string,
  catalog: Map<string, CatalogItem>,
  genericOk: boolean,
): { status: AuditStatus; detail: string } {
  if (!key) return { status: "falta", detail: "sem template" };
  const hit = catalog.get(key);
  if (!hit) return { status: "falta", detail: `${key} ausente no Gupshup` };
  if (/fail/i.test(hit.status)) {
    return { status: "reprovado", detail: `${key} reprovado` };
  }
  if (!genericOk && GENERIC.has(key)) {
    return { status: "generico", detail: `${key} (genérico)` };
  }
  return { status: "ok", detail: key };
}

function delayLabel(activity: CmsActivity): string {
  if (!activity.delay) return "";
  return `${activity.delay.tempo} ${activity.delay.medida}`;
}

export function auditEdition(
  edition: CmsEdition,
  events: CompiledEvent[],
  catalogItems: CatalogItem[],
): AuditRow[] {
  const catalog = catalogOf(catalogItems);
  const rows: AuditRow[] = [];

  for (const mod of edition.modules) {
    for (const activity of mod.activities) {
      if (activity.type === "gatilho") {
        const key =
          activity.teaser?.elementName || activity.mensagem?.elementName || "";
        const via = [
          activity.envioWhatsapp !== false ? "WhatsApp" : null,
          activity.envioEmail ? "e-mail" : null,
        ]
          .filter(Boolean)
          .join(" + ");
        const judged = key
          ? judgeKey(key, catalog, true)
          : activity.envioWhatsapp === false && !activity.envioEmail
            ? { status: "ok" as const, detail: "sem canal" }
            : {
                status: "falta" as const,
                detail: `gatilho ${delayLabel(activity)} sem template`,
              };
        rows.push({
          id: `clk-${activity.id}`,
          kind: "relogio",
          label: `${mod.title} · Relógio ${delayLabel(activity)}`,
          status: judged.status,
          detail: `${via || "—"} · ${judged.detail}`,
        });
        continue;
      }
      if (activity.type === "mensagem") {
        const key = activity.mensagem?.elementName || "";
        const judged = judgeKey(key, catalog, true);
        rows.push({
          id: `msg-${activity.id}`,
          kind: "atividade",
          label: `${mod.title} · ${activity.title}`,
          status: judged.status,
          detail: judged.detail,
        });
        continue;
      }
      const key = edition.package.templates[slotKey(activity)] || "";
      const judged = judgeKey(key, catalog, activity.type === "atividade");
      rows.push({
        id: `act-${activity.id}`,
        kind: "atividade",
        label: `${mod.title} · ${activity.title}`,
        status: judged.status,
        detail: judged.detail,
      });
    }
  }

  const byFlow = new Map<FlowId, CompiledEvent[]>();
  for (const event of events) {
    const list = byFlow.get(event.flow) || [];
    list.push(event);
    byFlow.set(event.flow, list);
  }

  const moments: { id: string; label: string; ok: boolean; detail: string }[] = [
    {
      id: "j-nao_inscrita",
      label: "Não se inscreveu",
      ok: (byFlow.get("nao_inscrita") || []).some((e) => e.kind === "relogio"),
      detail: "relógios de ficha",
    },
    {
      id: "j-inscrita",
      label: "Se inscreveu",
      ok: (byFlow.get("inscrita") || []).some((e) => e.id === "recebemos"),
      detail: "confirmação",
    },
    {
      id: "j-inbound",
      label: "Ela escreve",
      ok:
        edition.permiteWhatsapp === false ||
        (byFlow.get("inscrita") || []).some((e) => e.kind === "dela"),
      detail: edition.permiteWhatsapp === false ? "edição sem WhatsApp" : "inbound",
    },
    {
      id: "j-nao_segue",
      label: "Não segue",
      ok: (byFlow.get("nao_segue") || []).length > 0,
      detail: "comunicação de seleção",
    },
    {
      id: "j-aprovada",
      label: "Aprovada",
      ok: (byFlow.get("aprovada") || []).length > 0,
      detail: edition.journey === "online" ? "OK / lote" : "grupo da turma",
    },
    {
      id: "j-ok",
      label: "OK / lote",
      ok:
        edition.journey !== "online" ||
        (byFlow.get("aprovada") || []).some((e) => e.kind === "ok"),
      detail: edition.journey === "online" ? "primeiro OK" : "P/H não usa OK",
    },
  ];

  for (const moment of moments) {
    rows.push({
      id: moment.id,
      kind: "jornada",
      label: moment.label,
      status: moment.ok ? "ok" : "falta",
      detail: moment.detail,
    });
  }

  return rows;
}

export function auditSummary(rows: AuditRow[]) {
  const falta = rows.filter((row) => row.status === "falta").length;
  const generico = rows.filter((row) => row.status === "generico").length;
  const reprovado = rows.filter((row) => row.status === "reprovado").length;
  return { falta, generico, reprovado, ok: rows.length - falta - generico - reprovado };
}
