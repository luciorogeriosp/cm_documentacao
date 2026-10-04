export type TipoAtividade =
  | "videoaula"
  | "atividade"
  | "download"
  | "tarefa"
  | "faturamento"
  | "plano"
  | "quest_inicial"
  | "quest_final"
  | "nps"
  | "aula"
  | "visita"
  | "mensagem"
  | "gatilho";

export type FlowId = "nao_inscrita" | "inscrita" | "nao_segue" | "aprovada";

export type CmsWaMessage = {
  elementName?: string;
  data?: string;
};

export type CmsTemplateVar = {
  key: string;
  nome: string;
  token?: string;
  manualValue?: string;
};

export type CmsWaTemplate = {
  elementName: string;
  data: string;
  variables: CmsTemplateVar[];
};

export type CmsLembrete = {
  dias: number;
  codigo: string;
};

export type CmsPreInscricao = {
  sequencia: string;
  lembretes: CmsLembrete[];
  template?: CmsWaTemplate;
  canal?: string;
};

export type CmsActivity = {
  id: string;
  type: TipoAtividade;
  title: string;
  files?: string[];
  url?: string;
  modalidade?: "presencial" | "ao_vivo";
  envioWhatsapp?: boolean;
  envioEmail?: boolean;
  delay?: { tempo: number; medida: string };
  requerOk?: boolean;
  mensagem?: CmsWaMessage;
  teaser?: CmsWaMessage;
};

export type CmsModule = {
  id: string;
  title: string;
  activities: CmsActivity[];
};

export type CmsPackage = {
  id: string;
  name: string;
  templates: Record<string, string>;
};

export type CmsDatas = {
  aberturaInscricao?: string;
  encerramentoInscricao?: string;
  inicioSelecao?: string;
  terminoSelecao?: string;
  inicioPrograma?: string;
  terminoPrograma?: string;
};

export type CmsEditionSummary = {
  id: string;
  name: string;
  slug?: string;
  anoReferencia: number;
  journey: "online" | "ph";
  tipo?: string;
  duracao?: string;
  ativo?: boolean;
  programaNome?: string;
  permiteWhatsapp?: boolean;
  datas?: CmsDatas;
};

export type CmsEdition = CmsEditionSummary & {
  package: CmsPackage;
  modules: CmsModule[];
  grupoLink?: string;
  catalogoNome?: string;
  preInscricao?: CmsPreInscricao;
  mensagemInscricao?: {
    elementName: string;
    data: string;
  };
};

export type CompiledMessage = {
  id: string;
  templateKey: string;
  fallback: string;
  title: string;
  kind: "text" | "video" | "pdf";
  outgoing?: boolean;
  channels?: ("whatsapp" | "email")[];
};

export type CompiledEvent = {
  id: string;
  flow: FlowId;
  label: string;
  kind: "relogio" | "dela" | "ok" | "lote" | "gestora" | "atividade";
  moduleTitle?: string;
  messages: CompiledMessage[];
  delay?: { tempo: number; medida: string };
  canais?: string;
  requerOk?: boolean;
  activityId?: string;
  activityType?: TipoAtividade;
  auditId?: string;
};

export const FLOWS: { id: FlowId; label: string }[] = [
  { id: "nao_inscrita", label: "Não se inscreveu" },
  { id: "inscrita", label: "Se inscreveu" },
  { id: "nao_segue", label: "Não segue" },
  { id: "aprovada", label: "Aprovada" },
];
