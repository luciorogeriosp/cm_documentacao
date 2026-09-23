import type { ThreadItem } from "./types";

function msg(
  id: string,
  title: string,
  body: string,
  kind: ThreadItem["kind"] = "text",
): ThreadItem {
  return {
    stepId: id,
    title,
    trigger: "sistema",
    channels: ["whatsapp"],
    body,
    templateKey: "",
    source: "mock",
    kind,
  };
}

export function loteBemVinda(programa: string): ThreadItem[] {
  return [
    msg(
      "lote-bv-texto",
      "Boas-vindas da jornada",
      `✨ Seja bem-vinda ao *${programa}*! 🎉\n\nUma jornada criada para ajudar você a transformar essas datas em oportunidades de lucro, com mais planejamento, organização e tranquilidade 💛\n\nE, ao final, quem concluir o curso e responder às atividades concorre a uma bonificação imperdível! 🤩\n\n📌 Salve este número na sua agenda para não perder nenhum conteúdo!\n\nAproveite para entrar na nossa comunidade e troque experiências, ideias e aprendizados com outras empreendedoras 💛\n\n👉 {link_grupo}`,
    ),
    msg("lote-bv-video-apresentacao", "Apresentação", "Vídeo · Apresentação", "video"),
    msg(
      "lote-bv-video-aula1",
      "Aula 1 — Abertura",
      "Vídeo · Aula 1 — Datas comemorativas não é só vender mais, é vender melhor",
      "video",
    ),
    msg(
      "lote-bv-materiais",
      "Materiais da jornada",
      "📚 Agora, confira os materiais que vão acompanhar você nesta jornada:\n\n👉 Material de apoio da aula\n👉 Guia de Bolso, com os principais passos desta turma\n👉 Caderno de Anexos\n\nSalve os arquivos para consultar sempre que precisar 💛",
    ),
    msg("lote-bv-pdf-1", "Material de apoio", "PDF · Material de apoio da aula", "pdf"),
    msg("lote-bv-pdf-2", "Guia de Bolso", "PDF · Guia de Bolso", "pdf"),
    msg("lote-bv-pdf-3", "Caderno de Anexos", "PDF · Caderno de Anexos", "pdf"),
    msg(
      "lote-bv-ia",
      "Use a IA",
      "💡 Use a IA e coloque em prática!\n\nEscolha uma ferramenta, como ChatGPT, Gemini ou Copilot, e digite:\n\n“Sou empreendedora do nicho de [coloque seu segmento]. Quais datas comemorativas ao longo do ano são mais interessantes para o meu tipo de negócio e por quê?”\n\nDepois, escolha as datas que mais combinam com o seu negócio, anote as ideias e compartilhe na comunidade qual delas você pretende aproveitar. 🗓️💛",
    ),
    msg(
      "lote-bv-atividade",
      "Atividade de hoje",
      "Agora é com você! Clique no link a seguir para realizar a atividade de hoje. 😀\n\n{link}",
    ),
  ];
}

export function loteAula(): ThreadItem[] {
  return [
    msg(
      "lote-aula-intro",
      "Abertura da aula",
      "Preço certo protege o seu trabalho e o seu negócio 💰\n\nQuando você considera materiais, remuneração, outros custos e lucro, fica mais fácil vender sem sair no prejuízo.",
    ),
    msg(
      "lote-aula-video",
      "Aula 4 — Saúde Financeira",
      "Vídeo · Aula 4 — Preço certo evita dor de cabeça (Precificação)",
      "video",
    ),
    msg(
      "lote-aula-calc",
      "Calculadora de precificação",
      "Separe os principais produtos do seu catálogo e use a Calculadora de Precificação para verificar se o valor considera materiais, seu trabalho, outros custos e lucro.\n\n👉 https://precificacao.consuladodamulher.org.br/\n\nUm preço bem calculado protege você e a saúde financeira do seu negócio 💛",
    ),
    msg(
      "lote-aula-atividade",
      "Atividade de hoje",
      "Agora é com você! Clique no link a seguir para realizar a atividade de hoje. 😀\n\n{link}",
    ),
  ];
}
