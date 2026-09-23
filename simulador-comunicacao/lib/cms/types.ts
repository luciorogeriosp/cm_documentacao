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

export type CmsEdition = {
  id: string;
  name: string;
  journey: "online" | "ph";
  package: CmsPackage;
  modules: CmsModule[];
  slug?: string;
  ativo?: boolean;
  permiteWhatsapp?: boolean;
  programaNome?: string;
  grupoLink?: string;
  mensagemInscricao?: {
    elementName: string;
    data: string;
  };
  datas?: {
    aberturaInscricao?: string;
    encerramentoInscricao?: string;
    inicioSelecao?: string;
    terminoSelecao?: string;
    inicioPrograma?: string;
    terminoPrograma?: string;
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
