import type { CmsEdition } from "./types";

export const EDITION_EMPREENDE_ZAP: CmsEdition = {
  id: "empreende-zap-2026",
  name: "Empreende no Zap 2026",
  journey: "online",
  package: {
    id: "pkg-zap-2026",
    name: "Empreende no Zap 2026",
    templates: {
      inscription_incomplete: "pre_inscricao_lembrete_v2",
      inscricao_pos_inbound: "inscricao_confirmacao_recebida",
      ela_escreve: "",
      selecao_nao_aprovada: "selecao_nao_selecionada_v2",
      selecao_aprovacao: "mensagem_aprovacao",
      jornada_boas_vindas: "mensagem_inicial",
      jornada_pedir_ok: "mensagem_liberacao",
      videoaula: "mensagem_aula_video",
      atividade: "mensagem_realizar_atividade",
      download: "mensagem_realizar_atividade",
      comunidade: "mensagem_convide_comunidade",
    },
  },
  modules: [
    {
      id: "m-abertura",
      title: "Abertura",
      activities: [
        {
          id: "a-apresentacao",
          type: "videoaula",
          title: "Apresentação",
        },
        {
          id: "a-aula1",
          type: "videoaula",
          title: "Aula 1 — Datas comemorativas não é só vender mais",
        },
        {
          id: "a-materiais",
          type: "download",
          title: "Materiais da jornada",
          files: ["Material de apoio", "Guia de Bolso", "Caderno de Anexos"],
        },
        {
          id: "a-ia-abertura",
          type: "atividade",
          title: "Use a IA — datas do seu nicho",
        },
      ],
    },
    {
      id: "m-ticket",
      title: "Inteligência de mercado",
      activities: [
        {
          id: "a-aula3",
          type: "videoaula",
          title: "Aula 3 — Ticket médio",
        },
        {
          id: "a-ia-ticket",
          type: "atividade",
          title: "Calcule o ticket médio",
        },
      ],
    },
    {
      id: "m-preco",
      title: "Saúde financeira",
      activities: [
        {
          id: "a-aula4",
          type: "videoaula",
          title: "Aula 4 — Precificação",
        },
        {
          id: "a-calc",
          type: "atividade",
          title: "Calculadora de precificação",
        },
      ],
    },
    {
      id: "m-posicao",
      title: "Posicionamento",
      activities: [
        {
          id: "a-aula5",
          type: "videoaula",
          title: "Aula 5 — Apresentação do produto",
        },
        {
          id: "a-ia-embalagem",
          type: "atividade",
          title: "Use a IA — embalagem",
        },
      ],
    },
    {
      id: "m-capacidade",
      title: "Capacidade operacional",
      activities: [
        {
          id: "a-aula6",
          type: "videoaula",
          title: "Aula 6 — Meta e capacidade produtiva",
        },
        {
          id: "a-meta",
          type: "atividade",
          title: "Calcule sua capacidade",
        },
      ],
    },
    {
      id: "m-cronograma",
      title: "Planejamento prático",
      activities: [
        {
          id: "a-aula7",
          type: "videoaula",
          title: "Aula 7 — Cronograma",
        },
        {
          id: "a-ia-cronograma",
          type: "atividade",
          title: "Monte o cronograma com a IA",
        },
      ],
    },
    {
      id: "m-fechamento",
      title: "Fechamento",
      activities: [
        {
          id: "a-aula8",
          type: "videoaula",
          title: "Aula 8 — Lucro e aprendizado",
        },
        {
          id: "a-quest-final",
          type: "quest_final",
          title: "Atividade da última aula",
        },
      ],
    },
  ],
};

export const EDITIONS = [EDITION_EMPREENDE_ZAP];
