import type {
  CmsActivity,
  CmsEdition,
  CompiledEvent,
  CompiledMessage,
} from "./types";

function tpl(edition: CmsEdition, key: string): string {
  return edition.package.templates[key] || "";
}

function text(
  id: string,
  title: string,
  templateKey: string,
  fallback: string,
  extra?: Partial<CompiledMessage>,
): CompiledMessage {
  return { id, title, templateKey, fallback, kind: "text", ...extra };
}

function templateKeyFor(edition: CmsEdition, activity: CmsActivity): string {
  if (activity.type === "aula") {
    return activity.modalidade === "ao_vivo"
      ? tpl(edition, "aula_ao_vivo")
      : tpl(edition, "aula_presencial");
  }
  return tpl(edition, activity.type === "visita" ? "visita" : activity.type);
}

function fallbackFor(activity: CmsActivity): string {
  switch (activity.type) {
    case "videoaula":
      return `✨ Já está no aplicativo: *${activity.title}*. Assista quando puder 💛${activity.url ? `\n\n${activity.url}` : ""}`;
    case "download":
      return `📚 ${activity.title}\n\nSalve os arquivos para consultar sempre que precisar 💛`;
    case "aula":
      return activity.modalidade === "ao_vivo"
        ? `{nome}, aula ao vivo: *${activity.title}*. Data {data} às {hora}. Link: {link}`
        : `{nome}, aula presencial: *${activity.title}*. Data {data} às {hora} em {local}`;
    case "visita":
      return `{nome}, vamos agendar a visita técnica: *${activity.title}*.`;
    case "faturamento":
      return `{nome}, hora de registrar o faturamento 💛\n\n{link}`;
    case "plano":
      return `{nome}, monte seu plano de ação: *${activity.title}*\n\n{link}`;
    case "quest_inicial":
      return `{nome}, responda o questionário inicial do {programa}: {link}`;
    case "quest_final":
      return `{nome}, responda: *${activity.title}*\n\n{link}`;
    case "nps":
      return `{nome}, como está sendo o {programa} para você? Responda o NPS: {link}`;
    case "tarefa":
      return `{nome}, sua tarefa: *${activity.title}*. Envie quando concluir 💛\n\n{link}`;
    default:
      return `Agora é com você! ${activity.title} 😀\n\n{link}`;
  }
}

function channelsOf(activity: CmsActivity): ("whatsapp" | "email")[] {
  const channels: ("whatsapp" | "email")[] = [];
  if (activity.envioWhatsapp !== false) channels.push("whatsapp");
  if (activity.envioEmail) channels.push("email");
  return channels.length ? channels : ["whatsapp"];
}

function fromWa(
  id: string,
  title: string,
  wa: { elementName?: string; data?: string } | undefined,
  fallback: string,
  extra?: Partial<CompiledMessage>,
): CompiledMessage {
  const data = wa?.data?.replaceAll("{{1}}", "{programa}").replaceAll("{{2}}", "{nome}");
  return text(id, title, wa?.elementName || extra?.templateKey || "", data || fallback, extra);
}

function loteDaAtividade(
  edition: CmsEdition,
  activity: CmsActivity,
): CompiledMessage[] {
  if (activity.type === "mensagem") {
    return [
      fromWa(
        `${activity.id}-msg`,
        activity.title,
        activity.mensagem,
        "Recado do {programa} 💛",
        { channels: channelsOf(activity) },
      ),
    ];
  }
  const rows: CompiledMessage[] = [
    text(
      `${activity.id}-msg`,
      activity.title,
      templateKeyFor(edition, activity),
      fallbackFor(activity),
      { kind: activity.type === "videoaula" ? "video" : "text" },
    ),
  ];
  for (const file of activity.files || []) {
    rows.push({
      id: `${activity.id}-${file}`,
      title: file,
      templateKey: "",
      fallback: `PDF · ${file}`,
      kind: "pdf",
      channels: ["whatsapp"],
    });
  }
  return rows;
}

function welcomeFallback(edition: CmsEdition): string {
  const raw = edition.mensagemInscricao?.data;
  if (raw) {
    return raw.replaceAll("{{1}}", "{programa}").replaceAll("{{2}}", "{nome}");
  }
  return "✨ Seja bem-vinda ao *{programa}*! 🎉\n\nUma jornada para o seu negócio, no seu ritmo 💛";
}

export function compileEdition(edition: CmsEdition): CompiledEvent[] {
  const welcomeKey =
    edition.mensagemInscricao?.elementName ||
    tpl(edition, "jornada_boas_vindas");
  const events: CompiledEvent[] = [
    {
      id: "d1",
      flow: "nao_inscrita",
      label: "Relógio · 1 dia",
      kind: "relogio",
      delay: { tempo: 1, medida: "dia" },
      canais: "e-mail · WhatsApp opcional",
      messages: [
        text(
          "d1-msg",
          "Ficha incompleta",
          tpl(edition, "inscription_incomplete"),
          "Oi, {nome}. Vimos que você começou a inscrição no {programa}. Falta só terminar a ficha: {link}",
        ),
      ],
    },
    {
      id: "d3",
      flow: "nao_inscrita",
      label: "Relógio · 3 dias",
      kind: "relogio",
      delay: { tempo: 3, medida: "dias" },
      canais: "e-mail · WhatsApp opcional",
      messages: [
        text(
          "d3-msg",
          "Ficha incompleta — reforço",
          tpl(edition, "inscription_incomplete"),
          "{nome}, ainda dá tempo de concluir sua ficha no {programa}: {link}",
        ),
      ],
    },
    {
      id: "ela-escreve",
      flow: "inscrita",
      label: "Ela escreve",
      kind: "dela",
      messages: [
        text(
          "ela-escreve-msg",
          "Inbound",
          "",
          "Oi! Me inscrevi no {programa}.",
          { outgoing: true },
        ),
      ],
    },
    {
      id: "recebemos",
      flow: "inscrita",
      label: "Recebemos a inscrição",
      kind: "lote",
      messages: [
        text(
          "recebemos-msg",
          "Confirmação",
          tpl(edition, "inscricao_pos_inbound"),
          edition.journey === "online"
            ? "Oi, {nome}! Recebemos sua inscrição no {programa}. Agora é aguardar a seleção."
            : "Oi, {nome}! Recebemos sua inscrição no {programa}. A seleção começa em breve.",
        ),
      ],
    },
    {
      id: "nao-segue",
      flow: "nao_segue",
      label: "Comunicar: não segue",
      kind: "gestora",
      messages: [
        text(
          "nao-segue-msg",
          "Não selecionada",
          tpl(edition, "selecao_nao_aprovada"),
          "{nome}, obrigada pelo interesse no {programa}. Nesta edição não foi possível seguir.",
        ),
      ],
    },
    {
      id: "aprovacao",
      flow: "aprovada",
      label: "Aprovada — pede OK",
      kind: "gestora",
      messages: [
        text(
          "aprovacao-msg",
          "Aprovação",
          tpl(edition, "selecao_aprovacao"),
          edition.journey === "online"
            ? "{nome}, você está no {programa}! Envie OK para receber as boas-vindas."
            : `{nome}, você está no {programa}! Entre no grupo da turma: ${edition.grupoLink || "{link_grupo}"}`,
        ),
      ],
    },
  ];

  if (edition.journey === "online") {
    events.push({
      id: "ok-primeiro",
      flow: "aprovada",
      label: "Ela envia OK",
      kind: "ok",
      messages: [
        text("ok-primeiro-msg", "OK", "", "OK", { outgoing: true }),
      ],
    });
  }

  const modules = edition.modules;
  if (!modules.length) {
    events.push({
      id: "lote-boas-vindas",
      flow: "aprovada",
      label: "Lote · boas-vindas",
      kind: "lote",
      messages: [
        text(
          "boas-vindas",
          "Boas-vindas",
          edition.mensagemInscricao?.data ? "" : welcomeKey,
          welcomeFallback(edition),
        ),
      ],
    });
    return events;
  }

  modules.forEach((mod, i) => {
    events.push(...compileModule(edition, mod, i, welcomeKey));
  });

  return events;
}

function compileModule(
  edition: CmsEdition,
  mod: { id: string; title: string; activities: CmsActivity[] },
  index: number,
  welcomeKey: string,
): CompiledEvent[] {
  const online = edition.journey === "online";
  const out: CompiledEvent[] = [];

  if (online && index > 0) {
    out.push({
      id: `ok-pedido-${mod.id}`,
      flow: "aprovada",
      label: `Pedido de OK · ${mod.title}`,
      kind: "relogio",
      moduleTitle: mod.title,
      messages: [
        text(
          `ok-pedido-${mod.id}-msg`,
          mod.title,
          tpl(edition, "jornada_pedir_ok"),
          `Já está disponível sua aula sobre ${mod.title}. Envie agora um OK para receber.`,
        ),
      ],
    });
    out.push({
      id: `ok-${mod.id}`,
      flow: "aprovada",
      label: `OK · ${mod.title}`,
      kind: "ok",
      moduleTitle: mod.title,
      messages: [text(`ok-${mod.id}-msg`, "OK", "", "OK", { outgoing: true })],
    });
  }

  if (index === 0) {
    out.push({
      id: `boas-vindas-${mod.id}`,
      flow: "aprovada",
      label: "Boas-vindas",
      kind: "lote",
      moduleTitle: mod.title,
      messages: [
        text(
          "boas-vindas",
          "Boas-vindas",
          edition.mensagemInscricao?.data ? "" : welcomeKey,
          welcomeFallback(edition),
        ),
      ],
    });
    out.push({
      id: `comunidade-${mod.id}`,
      flow: "aprovada",
      label: "Comunidade",
      kind: "lote",
      moduleTitle: mod.title,
      messages: [
        text(
          "comunidade",
          "Comunidade",
          tpl(edition, "comunidade"),
          "✨ Entre na nossa comunidade e troque experiências com outras empreendedoras 💛\n\n👉 {link_grupo}",
        ),
      ],
    });
  }

  for (const activity of mod.activities) {
    if (activity.type === "gatilho") {
      const delay = `${activity.delay?.tempo ?? ""} ${activity.delay?.medida || "horas"}`.trim();
      const clock: CompiledMessage[] = [];
      if (activity.requerOk || activity.teaser) {
        clock.push(
          fromWa(
            `${activity.id}-teaser`,
            activity.title,
            activity.teaser,
            `Já está disponível sua aula sobre ${mod.title}. Envie agora um OK para receber.`,
            {
              templateKey: tpl(edition, "jornada_pedir_ok"),
              channels: channelsOf(activity),
            },
          ),
        );
      } else if (activity.mensagem) {
        clock.push(
          fromWa(
            `${activity.id}-msg`,
            activity.title,
            activity.mensagem,
            `Passaram ${delay}.`,
            { channels: channelsOf(activity) },
          ),
        );
      } else {
        clock.push(
          text(
            `${activity.id}-tick`,
            activity.title,
            "",
            `Passaram ${delay}.`,
            { channels: channelsOf(activity) },
          ),
        );
      }
      const via = [
        activity.envioWhatsapp !== false ? "WhatsApp" : null,
        activity.envioEmail ? "e-mail" : null,
      ]
        .filter(Boolean)
        .join(" + ");
      out.push({
        id: `relogio-${activity.id}`,
        flow: "aprovada",
        label: `Relógio · ${delay}`,
        kind: "relogio",
        moduleTitle: mod.title,
        delay: activity.delay,
        canais: via,
        requerOk: activity.requerOk,
        activityId: activity.id,
        activityType: activity.type,
        auditId: `clk-${activity.id}`,
        messages: clock,
      });
      if (online && activity.requerOk) {
        out.push({
          id: `ok-${activity.id}`,
          flow: "aprovada",
          label: `OK · ${mod.title}`,
          kind: "ok",
          moduleTitle: mod.title,
          messages: [text(`ok-${activity.id}-msg`, "OK", "", "OK", { outgoing: true })],
        });
      }
      continue;
    }
    out.push({
      id: `act-${activity.id}`,
      flow: "aprovada",
      label: activity.title,
      kind: "atividade",
      moduleTitle: mod.title,
      activityId: activity.id,
      activityType: activity.type,
      auditId: activity.type === "mensagem" ? `msg-${activity.id}` : `act-${activity.id}`,
      canais: channelsOf(activity).join(" + "),
      messages: loteDaAtividade(edition, activity),
    });
  }
  return out;
}
