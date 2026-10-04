import type { CatalogItem } from "@/lib/gupshup";
import { fill } from "@/lib/placeholders";
import type { CmsActivity, CmsEdition, CompiledEvent, FlowId } from "./types";

export type AuditStatus = "ok" | "generico" | "falta" | "reprovado" | "aviso";

export type AuditRow = {
  id: string;
  kind: "atividade" | "jornada" | "relogio" | "edicao" | "envio";
  label: string;
  status: AuditStatus;
  detail: string;
  flow?: FlowId;
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

const HAPPY: FlowId[] = ["nao_inscrita", "inscrita", "aprovada"];

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
  if (!catalog.size) return { status: "ok", detail: key };
  const hit = catalog.get(key);
  if (!hit) return { status: "falta", detail: `${key} ausente no Gupshup` };
  if (/fail|reject|disable/i.test(hit.status)) {
    return { status: "reprovado", detail: `${key} reprovado (${hit.status})` };
  }
  if (!hit.body.trim()) {
    return { status: "falta", detail: `${key} sem corpo` };
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

function leftovers(body: string): string[] {
  return [...body.matchAll(/\{\{\d+\}\}/g)].map((match) => match[0]);
}

function dateMs(raw?: string): number | null {
  if (!raw) return null;
  const t = Date.parse(raw);
  return Number.isNaN(t) ? null : t;
}

function auditConfig(edition: CmsEdition): AuditRow[] {
  const rows: AuditRow[] = [];
  if (!edition.modules.length) {
    rows.push({
      id: "cfg-modulos",
      kind: "edicao",
      label: "Módulos",
      status: "falta",
      detail: "edição sem módulos no CMS",
    });
  }
  if (!edition.catalogoNome && !edition.preInscricao) {
    rows.push({
      id: "cfg-catalogo",
      kind: "edicao",
      label: "Catálogo de comunicação",
      status: "aviso",
      detail: "sem Mensagens para WhatsApp vinculadas",
    });
  }
  if (edition.preInscricao?.lembretes.length) {
    for (const clock of edition.preInscricao.lembretes) {
      const key = edition.preInscricao.template?.elementName || "";
      rows.push({
        id: `pre-${clock.codigo}`,
        kind: "relogio",
        flow: "nao_inscrita",
        label: `Pré-inscrição · ${clock.codigo}`,
        status: key ? "ok" : "falta",
        detail: key
          ? `${clock.dias} dias após iniciar · ${key}`
          : `${clock.dias} dias após iniciar · sem template`,
      });
    }
  }
  if (edition.preInscricao && !edition.preInscricao.lembretes.length) {
    rows.push({
      id: "cfg-lembretes",
      kind: "edicao",
      label: "Pré-inscrição",
      status: "falta",
      detail: "campo Lembrete — dias após iniciar vazio",
    });
  }
  if (edition.preInscricao?.template && !edition.preInscricao.template.elementName) {
    rows.push({
      id: "cfg-pre-tpl",
      kind: "edicao",
      label: "Pré-inscrição",
      status: "falta",
      detail: "bloco sem template",
    });
  }
  const vars = edition.preInscricao?.template?.variables || [];
  const holes = [...(edition.preInscricao?.template?.data || "").matchAll(/\{\{(\d+)\}\}/g)].map(
    (m) => m[1],
  );
  for (const hole of holes) {
    if (!vars.some((item) => item.key === hole)) {
      rows.push({
        id: `cfg-var-${hole}`,
        kind: "edicao",
        label: "Pré-inscrição · variável",
        status: "falta",
        detail: `{{${hole}}} no texto sem variável cadastrada`,
      });
    }
  }
  if (edition.journey === "ph" && !edition.grupoLink) {
    rows.push({
      id: "cfg-grupo",
      kind: "edicao",
      label: "Grupo da turma",
      status: "aviso",
      detail: "P/H sem link de grupo cadastrado",
    });
  }
  const start = dateMs(edition.datas?.aberturaInscricao);
  const end = dateMs(edition.datas?.encerramentoInscricao);
  if (start && end && start > end) {
    rows.push({
      id: "cfg-datas-insc",
      kind: "edicao",
      label: "Datas",
      status: "falta",
      detail: "abertura da inscrição depois do encerramento",
    });
  }
  const progStart = dateMs(edition.datas?.inicioPrograma);
  const progEnd = dateMs(edition.datas?.terminoPrograma);
  if (progStart && progEnd && progStart > progEnd) {
    rows.push({
      id: "cfg-datas-prog",
      kind: "edicao",
      label: "Datas",
      status: "falta",
      detail: "início do programa depois do término",
    });
  }
  return rows;
}

function auditActivities(
  edition: CmsEdition,
  catalog: Map<string, CatalogItem>,
): AuditRow[] {
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
  return rows;
}

function auditJornada(edition: CmsEdition, events: CompiledEvent[]): AuditRow[] {
  const byFlow = new Map<FlowId, CompiledEvent[]>();
  for (const event of events) {
    const list = byFlow.get(event.flow) || [];
    list.push(event);
    byFlow.set(event.flow, list);
  }
  const moments: AuditRow[] = [
    {
      id: "j-nao_inscrita",
      kind: "jornada",
      label: "Não se inscreveu",
      status: (byFlow.get("nao_inscrita") || []).some((e) => e.kind === "relogio")
        ? "ok"
        : "falta",
      detail: edition.preInscricao?.sequencia
        ? `relógios ${edition.preInscricao.sequencia}`
        : "relógios de ficha",
      flow: "nao_inscrita",
    },
    {
      id: "j-inscrita",
      kind: "jornada",
      label: "Se inscreveu",
      status: (byFlow.get("inscrita") || []).some((e) => e.id === "recebemos")
        ? "ok"
        : "falta",
      detail: "confirmação",
      flow: "inscrita",
    },
    {
      id: "j-nao_segue",
      kind: "jornada",
      label: "Não segue",
      status: (byFlow.get("nao_segue") || []).length ? "ok" : "falta",
      detail: "comunicação de seleção",
      flow: "nao_segue",
    },
    {
      id: "j-aprovada",
      kind: "jornada",
      label: "Aprovada",
      status: (byFlow.get("aprovada") || []).length ? "ok" : "falta",
      detail: edition.journey === "online" ? "OK / lote" : "grupo da turma",
      flow: "aprovada",
    },
  ];
  return moments;
}

export function walkSequence(
  edition: CmsEdition,
  events: CompiledEvent[],
  catalogItems: CatalogItem[],
  vars: { nome: string; programa: string },
): { findings: AuditRow[]; sent: number } {
  const catalog = catalogOf(catalogItems);
  const findings: AuditRow[] = [];
  let sent = 0;

  for (const event of events) {
    for (const message of event.messages) {
      if (message.outgoing || event.kind === "ok" || event.kind === "dela") continue;
      if (message.kind === "pdf") continue;
      sent += 1;
      const key = message.templateKey;
      if (key && catalog.size) {
        const judged = judgeKey(key, catalog, true);
        if (judged.status !== "ok") {
          findings.push({
            id: `env-${event.id}-${message.id}`,
            kind: "envio",
            flow: event.flow,
            label: `${event.label} · ${message.title}`,
            status: judged.status,
            detail: judged.detail,
          });
        }
      }
      const raw = (key && catalog.get(key)?.body) || message.fallback;
      if (!raw.trim()) {
        findings.push({
          id: `env-vazio-${event.id}-${message.id}`,
          kind: "envio",
          flow: event.flow,
          label: `${event.label} · ${message.title}`,
          status: "falta",
          detail: "corpo vazio — envio não sairia",
        });
        continue;
      }
      const body = fill(raw, {
        journey: edition.journey,
        nome: vars.nome,
        programa: vars.programa,
      });
      const holes = leftovers(body);
      if (holes.length) {
        findings.push({
          id: `env-var-${event.id}-${message.id}`,
          kind: "envio",
          flow: event.flow,
          label: `${event.label} · ${message.title}`,
          status: "falta",
          detail: `variável sem valor: ${holes.join(", ")}`,
        });
      }
    }
  }

  return { findings, sent };
}

export function auditEdition(
  edition: CmsEdition,
  events: CompiledEvent[],
  catalogItems: CatalogItem[],
  vars?: { nome: string; programa: string },
): AuditRow[] {
  const catalog = catalogOf(catalogItems);
  const walked = walkSequence(
    edition,
    events,
    catalogItems,
    vars || { nome: "Maria Silva", programa: edition.programaNome || edition.name },
  );
  const gupshup: AuditRow[] = catalogItems.length
    ? []
    : [
        {
          id: "cfg-gupshup",
          kind: "edicao",
          label: "Gupshup",
          status: "aviso",
          detail: "catálogo Meta não consultado — templates oficiais não conferidos",
        },
      ];
  return [
    ...gupshup,
    ...auditConfig(edition),
    ...auditActivities(edition, catalog),
    ...auditJornada(edition, events),
    ...walked.findings,
  ];
}

export function auditSummary(rows: AuditRow[]) {
  const falta = rows.filter((row) => row.status === "falta").length;
  const generico = rows.filter((row) => row.status === "generico").length;
  const reprovado = rows.filter((row) => row.status === "reprovado").length;
  const aviso = rows.filter((row) => row.status === "aviso").length;
  return {
    falta,
    generico,
    reprovado,
    aviso,
    ok: rows.filter((row) => row.status === "ok").length,
    problemas: falta + reprovado,
    limpa: falta + reprovado === 0,
  };
}

export function happyPath(events: CompiledEvent[]): CompiledEvent[] {
  return HAPPY.flatMap((flow) => events.filter((event) => event.flow === flow));
}
