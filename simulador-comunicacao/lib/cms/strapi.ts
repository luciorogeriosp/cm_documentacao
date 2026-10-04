import type {
  CmsActivity,
  CmsEdition,
  CmsEditionSummary,
  CmsLembrete,
  CmsModule,
  CmsPreInscricao,
  CmsTemplateVar,
  CmsWaTemplate,
  TipoAtividade,
} from "./types";

const DEFAULT_TEMPLATES: Record<string, string> = {
  inscription_incomplete: "pre_inscricao_lembrete_v2",
  inscricao_pos_inbound: "inscricao_confirmacao_recebida",
  selecao_nao_aprovada: "selecao_nao_selecionada_v2",
  selecao_aprovacao: "mensagem_aprovacao",
  jornada_boas_vindas: "mensagem_inicial",
  jornada_pedir_ok: "mensagem_liberacao",
  videoaula: "mensagem_aula_video",
  atividade: "mensagem_realizar_atividade",
  download: "mensagem_realizar_atividade",
  tarefa: "mensagem_realizar_atividade",
  faturamento: "mensagem_realizar_atividade",
  plano: "mensagem_realizar_atividade",
  quest_inicial: "mensagem_realizar_atividade",
  quest_final: "mensagem_realizar_atividade",
  nps: "mensagem_realizar_atividade",
  aula_presencial: "mensagem_realizar_atividade",
  aula_ao_vivo: "mensagem_realizar_atividade",
  visita: "mensagem_realizar_atividade",
  comunidade: "mensagem_convide_comunidade",
};

const SKIP_COMPONENTS = new Set<string>();

type StrapiMedia = { name?: string; url?: string };

type StrapiWaMessage = {
  elementName?: string;
  data?: string;
} | null;

type StrapiActivity = {
  id: number;
  activity_key?: string;
  titulo?: string | null;
  descricao?: string | null;
  pergunta?: string | null;
  URL?: string | null;
  url?: string | null;
  __component: string;
  envio_whatsapp?: boolean;
  envio_email?: boolean;
  whatsapp?: boolean;
  email?: boolean;
  tempo?: number;
  medida?: string;
  requer_ok?: boolean;
  modalidade?: "presencial" | "ao_vivo";
  tipo_questionario?: string | null;
  material?: StrapiMedia[] | null;
  mensagem_whatsapp?: StrapiWaMessage;
  mensagem?: StrapiWaMessage;
  mensagem_teaser?: StrapiWaMessage;
};

type StrapiModulo = {
  id: number;
  documentId: string;
  nome: string;
  slug?: string;
  metodo_aplicacao?: string;
  atividades?: StrapiActivity[];
};

export type StrapiEdicao = {
  id: number;
  documentId: string;
  ano_referencia?: number;
  edicao: string;
  slug: string;
  Ativo?: boolean;
  permite_envio_whatsapp?: boolean;
  abertura_inscricao?: string;
  encerramento_inscricao?: string;
  inicio_selecao?: string;
  termino_selecao?: string;
  inicio_programa?: string;
  termino_programa?: string;
  mensagem_inscricao?: {
    elementName?: string;
    data?: string;
  } | null;
  gestores?: { grupo_whatsapp?: string | null; rotulo?: string }[];
  programa?: { nome?: string; slug?: string; tipo?: string; duracao?: string } | null;
  modulos?: StrapiModulo[];
  mensagens_whatsapp?: StrapiCatalogo | null;
};

type StrapiTemplateVar = {
  key?: string;
  variavelNome?: string;
  token?: string;
  manualValue?: string;
};

type StrapiWaTemplate = {
  elementName?: string;
  data?: string;
  variables?: StrapiTemplateVar[];
};

type StrapiCatalogo = {
  id?: number;
  documentId?: string;
  nome?: string;
  slug?: string;
  pre_inscricao?: {
    sequencia_lembretes?: string;
    canal?: string;
    template?: StrapiWaTemplate | null;
  } | null;
};

export function cmsBase(): string {
  return (
    process.env.CMS_API_URL || "https://cmshomolog.menduca.com.br"
  ).replace(/\/$/, "");
}

async function cmsJson<T>(path: string): Promise<T> {
  const res = await fetch(`${cmsBase()}${path}`, { cache: "no-store" });
  if (!res.ok) throw new Error(`CMS respondeu ${res.status} em ${path}`);
  return (await res.json()) as T;
}

const LIST_FIELDS =
  "fields[0]=ano_referencia&fields[1]=edicao&fields[2]=slug&fields[3]=Ativo&fields[4]=abertura_inscricao&fields[5]=encerramento_inscricao&fields[6]=inicio_selecao&fields[7]=termino_selecao&fields[8]=inicio_programa&fields[9]=termino_programa&fields[10]=permite_envio_whatsapp";

const DETAIL_POPULATE =
  "populate[modulos][populate][atividades][populate]=*&populate[programa]=true&populate[gestores]=true&populate[mensagens_whatsapp]=true";

export async function fetchStrapiEdicoesList(): Promise<StrapiEdicao[]> {
  const json = await cmsJson<{ data?: StrapiEdicao[] }>(
    `/api/edicaos?pagination[pageSize]=100&${LIST_FIELDS}&populate[programa][fields][0]=nome&populate[programa][fields][1]=tipo&populate[programa][fields][2]=duracao`,
  );
  return json.data || [];
}

async function fetchStrapiCatalogo(id: string): Promise<StrapiCatalogo | null> {
  const json = await cmsJson<{ data?: StrapiCatalogo }>(
    `/api/mensagens-whatsapps/${encodeURIComponent(id)}?populate=*`,
  );
  return json.data ?? null;
}

async function attachCatalog(raw: StrapiEdicao): Promise<StrapiEdicao> {
  const id = raw.mensagens_whatsapp?.documentId;
  if (!id) return raw;
  const catalog = await fetchStrapiCatalogo(id);
  return catalog ? { ...raw, mensagens_whatsapp: catalog } : raw;
}

export async function fetchStrapiEdicao(id: string): Promise<StrapiEdicao | null> {
  try {
    const json = await cmsJson<{ data?: StrapiEdicao }>(
      `/api/edicaos/${encodeURIComponent(id)}?${DETAIL_POPULATE}`,
    );
    if (json.data) return attachCatalog(json.data);
  } catch {
    /* tenta filtro por documentId / slug */
  }
  const json = await cmsJson<{ data?: StrapiEdicao[] }>(
    `/api/edicaos?filters[$or][0][documentId][$eq]=${encodeURIComponent(id)}&filters[$or][1][slug][$eq]=${encodeURIComponent(id)}&${DETAIL_POPULATE}`,
  );
  const found = json.data?.[0];
  return found ? attachCatalog(found) : null;
}

export async function fetchStrapiEdicoes(): Promise<StrapiEdicao[]> {
  const [base, deep] = await Promise.all([
    cmsJson<{ data?: StrapiEdicao[] }>("/api/edicaos?pagination[pageSize]=100&populate=*"),
    cmsJson<{ data?: StrapiEdicao[] }>(
      `/api/edicaos?pagination[pageSize]=100&${DETAIL_POPULATE}`,
    ),
  ]);
  const extras = new Map((deep.data || []).map((item) => [item.documentId, item]));
  return (base.data || []).map((item) => {
    const extra = extras.get(item.documentId);
    return {
      ...item,
      programa: extra?.programa ?? item.programa,
      modulos: extra?.modulos ?? item.modulos ?? [],
    };
  });
}

export function inferJourney(edicao: StrapiEdicao): "online" | "ph" {
  const tipo = (edicao.programa?.tipo || "").toLowerCase();
  if (tipo === "online") return "online";
  if (tipo === "presencial" || tipo === "hibrido" || tipo === "híbrido") {
    return "ph";
  }
  const text = `${edicao.slug} ${edicao.edicao}`.toLowerCase();
  if (
    text.includes("online") ||
    text.includes("zap") ||
    text.includes("internet")
  ) {
    return "online";
  }
  return "ph";
}

function stripHtml(html?: string | null): string {
  return (html || "")
    .replace(/<[^>]+>/g, " ")
    .replace(/&nbsp;/gi, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function mapTipo(raw: StrapiActivity): TipoAtividade | null {
  switch (raw.__component) {
    case "atividades.video":
      return "videoaula";
    case "atividades.download-de-conteudo":
      return "download";
    case "atividades.tarefa-de-casa":
      return "tarefa";
    case "atividades.aula":
      return "aula";
    case "atividades.registro-faturamento":
      return "faturamento";
    case "atividades.plano-acao":
      return "plano";
    case "atividades.visita-tecnica":
      return "visita";
    case "atividades.certificado":
      return "atividade";
    case "atividades.mensagem":
      return "mensagem";
    case "atividades.gatilho-de-comunicacao":
      return "gatilho";
    case "atividades.questionario": {
      const kind = raw.tipo_questionario || "";
      if (/nps/i.test(kind)) return "nps";
      if (/chegada|inicial/i.test(kind)) return "quest_inicial";
      if (/final|feedback/i.test(kind)) return "quest_final";
      return "atividade";
    }
    case "atividades.teste-de-conhecimento":
    case "atividades.link-externo":
    case "atividades.resposta-aberta":
    case "atividades.prova2":
      return "atividade";
    default:
      return null;
  }
}

function mapActivity(raw: StrapiActivity): CmsActivity | null {
  if (SKIP_COMPONENTS.has(raw.__component)) return null;
  const type = mapTipo(raw);
  if (!type) return null;
  const title =
    raw.titulo?.trim() ||
    raw.tipo_questionario?.trim() ||
    stripHtml(raw.pergunta) ||
    stripHtml(raw.descricao) ||
    type;
  const files = (raw.material || [])
    .map((file) => file.name)
    .filter((name): name is string => Boolean(name));
  const wa = raw.mensagem_whatsapp || raw.mensagem;
  const envioWhatsapp =
    raw.__component === "atividades.gatilho-de-comunicacao"
      ? raw.whatsapp !== false
      : raw.envio_whatsapp !== false;
  const envioEmail =
    raw.__component === "atividades.gatilho-de-comunicacao"
      ? raw.email === true
      : raw.envio_email === true;
  return {
    id: raw.activity_key || `${raw.__component}-${raw.id}`,
    type,
    title:
      type === "gatilho"
        ? `Relógio ${raw.tempo ?? ""} ${raw.medida || "horas"}`.trim()
        : type === "mensagem"
          ? title === type
            ? "Mensagem WhatsApp"
            : title
          : title,
    files: files.length ? files : undefined,
    url: raw.URL || raw.url || undefined,
    modalidade: raw.modalidade,
    envioWhatsapp,
    envioEmail,
    delay:
      raw.tempo != null
        ? { tempo: raw.tempo, medida: raw.medida || "horas" }
        : undefined,
    requerOk: raw.requer_ok === true,
    mensagem: wa?.data || wa?.elementName
      ? { elementName: wa.elementName, data: wa.data }
      : undefined,
    teaser:
      raw.mensagem_teaser?.data || raw.mensagem_teaser?.elementName
        ? {
            elementName: raw.mensagem_teaser.elementName,
            data: raw.mensagem_teaser.data,
          }
        : undefined,
  };
}

function mapModule(raw: StrapiModulo): CmsModule {
  return {
    id: raw.documentId || String(raw.id),
    title: raw.nome,
    activities: (raw.atividades || [])
      .map(mapActivity)
      .filter((item): item is CmsActivity => Boolean(item)),
  };
}

function yearOf(raw: StrapiEdicao): number {
  if (raw.ano_referencia) return raw.ano_referencia;
  const fromDate = (raw.inicio_programa || raw.abertura_inscricao || "").slice(0, 4);
  const parsed = Number(fromDate);
  if (parsed) return parsed;
  return new Date().getFullYear();
}

function datasOf(raw: StrapiEdicao) {
  return {
    aberturaInscricao: raw.abertura_inscricao,
    encerramentoInscricao: raw.encerramento_inscricao,
    inicioSelecao: raw.inicio_selecao,
    terminoSelecao: raw.termino_selecao,
    inicioPrograma: raw.inicio_programa,
    terminoPrograma: raw.termino_programa,
  };
}

export function mapStrapiEditionSummary(raw: StrapiEdicao): CmsEditionSummary {
  return {
    id: raw.documentId,
    name: raw.edicao,
    slug: raw.slug,
    anoReferencia: yearOf(raw),
    journey: inferJourney(raw),
    tipo: raw.programa?.tipo,
    duracao: raw.programa?.duracao,
    ativo: raw.Ativo !== false,
    programaNome: raw.programa?.nome,
    permiteWhatsapp: raw.permite_envio_whatsapp !== false,
    datas: datasOf(raw),
  };
}

export function parseSequenciaLembretes(raw?: string): CmsLembrete[] {
  if (!raw?.trim()) return [];
  return [...raw.matchAll(/(\d+)\s*([DdHh])/g)].map((match) => ({
    dias: Number(match[1]),
    codigo: `${match[1]}${match[2].toUpperCase()}`,
  }));
}

function mapTemplate(raw?: StrapiWaTemplate | null): CmsWaTemplate | undefined {
  if (!raw?.elementName && !raw?.data) return undefined;
  const variables: CmsTemplateVar[] = (raw.variables || [])
    .filter((item) => item.key)
    .map((item) => ({
      key: String(item.key),
      nome: item.variavelNome || `{{${item.key}}}`,
      token: item.token,
      manualValue: item.manualValue || undefined,
    }));
  return {
    elementName: raw.elementName || "",
    data: raw.data || "",
    variables,
  };
}

function mapPreInscricao(raw?: StrapiCatalogo | null): CmsPreInscricao | undefined {
  const block = raw?.pre_inscricao;
  if (!block) return undefined;
  const sequencia = block.sequencia_lembretes?.trim() || "";
  return {
    sequencia,
    lembretes: parseSequenciaLembretes(sequencia),
    template: mapTemplate(block.template),
    canal: block.canal,
  };
}

export function mapStrapiEdition(raw: StrapiEdicao): CmsEdition {
  const templates = { ...DEFAULT_TEMPLATES };
  const element = raw.mensagem_inscricao?.elementName;
  if (element) {
    templates.jornada_boas_vindas = element;
  }
  const preInscricao = mapPreInscricao(raw.mensagens_whatsapp);
  if (preInscricao?.template?.elementName) {
    templates.inscription_incomplete = preInscricao.template.elementName;
  }
  const grupo =
    raw.gestores?.find((g) => g.grupo_whatsapp)?.grupo_whatsapp || undefined;
  return {
    ...mapStrapiEditionSummary(raw),
    grupoLink: grupo,
    catalogoNome: raw.mensagens_whatsapp?.nome,
    preInscricao,
    mensagemInscricao: raw.mensagem_inscricao?.data
      ? {
          elementName: element || "",
          data: raw.mensagem_inscricao.data,
        }
      : undefined,
    package: {
      id: raw.mensagens_whatsapp?.documentId || `cms-${raw.documentId}`,
      name: raw.mensagens_whatsapp?.nome || raw.edicao,
      templates,
    },
    modules: (raw.modulos || []).map(mapModule),
  };
}

export function pickDefault<T extends CmsEditionSummary>(list: T[]): T | undefined {
  return (
    list.find((e) => e.slug === "empreende-no-zap-janeiro-2027") ||
    list.find((e) => e.anoReferencia === new Date().getFullYear() && e.ativo !== false) ||
    list.find((e) => e.ativo !== false) ||
    list[0]
  );
}
