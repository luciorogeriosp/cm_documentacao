export type Journey = "online" | "ph";

export type Outcome =
  | "aprovada"
  | "nao_qualificada"
  | "nao_aprovada"
  | "ausente";

export type Phase = "inscricao" | "selecao" | "curso" | "encerramento";

export type Channel = "whatsapp" | "email" | "grupo" | "nenhum" | "nota";

export type ChannelView = "whatsapp" | "email";

export type Trigger = "relogio" | "ok" | "gestora" | "dela" | "sistema";

export type Chapter =
  | "setup"
  | "apos_pre"
  | "confirmar_wa"
  | "selecao"
  | "curso"
  | "fim";

export type Setup = {
  journey: Journey;
  outcome: Outcome;
  entrouNoGrupo: boolean;
  doacaoAprovada: boolean;
  nome: string;
  programa: string;
};

export type Step = {
  id: string;
  phase: Phase;
  title: string;
  when: string;
  trigger: Trigger;
  channels: Channel[];
  templateKey: string;
  body: string;
  naoFaz: string;
  silent?: boolean;
  journeys: Journey[];
  outcomes: Outcome[] | "*";
  requireEntrouNoGrupo?: boolean;
  requireNaoEntrouNoGrupo?: boolean;
  requireDoacao?: boolean;
  requireSemDoacao?: boolean;
  endsJourney?: boolean;
};

export type MediaKind = "text" | "video" | "pdf";

export type ThreadItem = {
  stepId: string;
  title: string;
  trigger: Trigger;
  channels: Channel[];
  body: string;
  silent?: boolean;
  templateKey: string;
  source: "mock" | "gupshup";
  kind?: MediaKind;
};
