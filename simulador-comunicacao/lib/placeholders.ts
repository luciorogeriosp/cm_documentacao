export const EXEMPLO = {
  nome: "Maria Silva",
  programa: "Empreende no Zap 2026",
  programaPH: "Empreende Mulher 2026",
  aula: "Precificação do negócio",
  data: "22/09/2026",
  hora: "14h",
  local: "Unidade Centro — sala 2",
  linkGrupo: "https://chat.whatsapp.com/exemplo-turma",
  linkAcesso: "https://app.exemplo/entrar?t=••••",
  linkLive: "https://youtube.com/live/exemplo",
  prazo: "24/09/2026, 20h",
};

export type FillVars = {
  journey: "online" | "ph";
  nome?: string;
  programa?: string;
};

export function defaultPrograma(journey: "online" | "ph"): string {
  return journey === "ph" ? EXEMPLO.programaPH : EXEMPLO.programa;
}

export function fill(text: string, vars: FillVars): string {
  const nome = (vars.nome ?? EXEMPLO.nome).trim();
  const programa = (vars.programa ?? defaultPrograma(vars.journey)).trim();
  let out = text
    .replaceAll("{nome}", nome || EXEMPLO.nome)
    .replaceAll("{programa}", programa || defaultPrograma(vars.journey))
    .replaceAll("{titulo}", EXEMPLO.aula)
    .replaceAll("{data}", EXEMPLO.data)
    .replaceAll("{hora}", EXEMPLO.hora)
    .replaceAll("{local}", EXEMPLO.local)
    .replaceAll("{link_grupo}", EXEMPLO.linkGrupo)
    .replaceAll("{link}", EXEMPLO.linkAcesso)
    .replaceAll("{link_live}", EXEMPLO.linkLive)
    .replaceAll("{prazo}", EXEMPLO.prazo);
  if (nome) out = out.replaceAll("{{1}}", nome);
  if (programa) out = out.replaceAll("{{2}}", programa);
  return out;
}

export function emailFromName(nome: string): string {
  const slug = nome
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, ".")
    .replace(/^\.+|\.+$/g, "");
  return `${slug || "maria.silva"}@email.com`;
}
