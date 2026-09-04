# -*- coding: utf-8 -*-
"""Gera Contagem_IFPUG_Consulado.csv a partir do catálogo IFPUG B0×B1.
Executar: python _gen_contagem_ifpug.py
"""
from pathlib import Path

DIR = Path(__file__).parent
OUT = DIR / "Contagem_IFPUG_Consulado.csv"

# IFPUG UFP: Baixa / Média / Alta
V = {
    "EI": {"B": 3, "M": 4, "A": 6},
    "EO": {"B": 4, "M": 5, "A": 7},
    "EQ": {"B": 3, "M": 4, "A": 6},
    "ILF": {"B": 7, "M": 10, "A": 15},
    "EIF": {"B": 5, "M": 7, "A": 10},
}


def pf(tipo: str, cx: str | None) -> int:
    if cx in (None, "-", "", "N"):
        return 0
    return V[tipo][cx]


# (id, cat, nome, tipo, cx_b0, cx_b1, natureza, uc, origem)
# cx: B|M|A|N  (N = ausente no baseline)
CATALOG = [
    # DATA
    ("ILF-01", "DATA", "Colaborador / Perfil / Role", "ILF", "M", "M", "SAME", "UC1,UC5", "RFP §F"),
    ("ILF-02", "DATA", "Programa (metodologia)", "ILF", "M", "M", "SAME", "UC7", "RFP §D"),
    ("ILF-03", "DATA", "Edição", "ILF", "M", "A", "EXPAND", "UC9,UC13", "RFP §D; risco, doação, templates"),
    ("ILF-04", "DATA", "Unidade", "ILF", "B", "B", "SAME", "UC66", "RFP implícito"),
    ("ILF-05", "DATA", "Turma", "ILF", "M", "M", "SAME", "UC16", "RFP §D grupos/turmas"),
    ("ILF-06", "DATA", "Módulo educacional", "ILF", "M", "M", "SAME", "UC15", "RFP trilha"),
    ("ILF-07", "DATA", "Atividade (tipos + config)", "ILF", "M", "A", "EXPAND", "UC15", "RFP; UC15 12 tipos"),
    ("ILF-08", "DATA", "Empreendedora / pessoa", "ILF", "A", "A", "SAME", "UC21,UC27", "RFP §A"),
    ("ILF-09", "DATA", "Empreendimento (negócio)", "ILF", "N", "A", "NEW", "UC31", "Coletivo"),
    ("ILF-10", "DATA", "Inscrição / participação na edição", "ILF", "M", "A", "EXPAND", "UC21,UC29", "RFP; score/status"),
    ("ILF-11", "DATA", "Lead / pré-inscrição", "ILF", "N", "M", "NEW", "UC19,UC26", "Mini CRM"),
    ("ILF-12", "DATA", "Aceite / consentimento LGPD", "ILF", "M", "M", "SAME", "UC20", "RFP aceites"),
    ("ILF-13", "DATA", "Progresso atividade / liberação", "ILF", "M", "A", "EXPAND", "UC33,UC34", "liberada≠enviada≠concluída"),
    ("ILF-14", "DATA", "Presença / frequência", "ILF", "M", "M", "SAME", "UC40,UC41", "RFP §A"),
    ("ILF-15", "DATA", "Entrega / upload / aprovação", "ILF", "M", "M", "SAME", "UC43,UC44", "RFP §C"),
    ("ILF-16", "DATA", "Dados financeiros mensais", "ILF", "M", "M", "SAME", "UC45,UC46", "RFP"),
    ("ILF-17", "DATA", "Questionário / resposta / NPS", "ILF", "M", "M", "SAME", "UC39", "RFP"),
    ("ILF-18", "DATA", "Mensagem / log de disparo", "ILF", "M", "M", "SAME", "UC49", "RFP WA/e-mail"),
    ("ILF-19", "DATA", "Template Meta / e-mail", "ILF", "B", "M", "EXPAND", "UC9", "Templates Meta"),
    ("ILF-20", "DATA", "AlertRule + Binding + DispatchLog", "ILF", "N", "A", "NEW", "UC87,UC52", "Alertas tipados"),
    ("ILF-21", "DATA", "Doação / recibo / PIX", "ILF", "B", "A", "EXPAND", "UC57,UC86", "RFP fraco; funil+recibo"),
    ("ILF-22", "DATA", "Mentoria", "ILF", "N", "M", "NEW", "UC70", "Caroline 12/08"),
    ("ILF-23", "DATA", "Observação de acompanhamento", "ILF", "N", "B", "NEW", "UC77", ""),
    ("ILF-24", "DATA", "Certificado / beneficiamento", "ILF", "B", "M", "EXPAND", "UC55,UC13", "% por edição"),
    ("ILF-25", "DATA", "Pesquisa pós-programa", "ILF", "N", "M", "NEW", "UC82", "D+30"),
    ("ILF-26", "DATA", "Organização / patrocinador", "ILF", "N", "B", "NEW", "UC10,UC11", ""),
    ("ILF-27", "DATA", "Base legado (participações)", "ILF", "B", "M", "EXPAND", "UC62", "Hash CPF"),
    ("ILF-28", "DATA", "Magic link / sessão token", "ILF", "B", "M", "EXPAND", "UC3,UC4,UC54", "Deep links"),
    ("ILF-29", "DATA", "Fila jornada (eventos OK/lote)", "ILF", "N", "M", "NEW", "UC33", "ADR jornada"),
    ("ILF-30", "DATA", "Critérios seleção / régua edição", "ILF", "B", "M", "EXPAND", "UC12", "6 critérios"),
    ("EIF-01", "DATA", "Gupshup (templates/status WA)", "EIF", "M", "M", "SAME", "UC49", "RFP WhatsApp"),
    ("EIF-02", "DATA", "SendGrid (e-mail/eventos)", "EIF", "M", "M", "SAME", "UC54", "RFP e-mail"),
    # CMS
    ("CMS-01", "CMS", "Login administrador (e-mail/senha)", "EI", "B", "B", "SAME", "UC2", "RFP §F"),
    ("CMS-02", "CMS", "Cadastrar/editar colaborador", "EI", "M", "M", "SAME", "UC1", "RFP"),
    ("CMS-03", "CMS", "Gerenciar roles/permissões", "EI", "M", "M", "SAME", "UC5", "RFP"),
    ("CMS-04", "CMS", "Configurar autenticação (políticas)", "EI", "M", "M", "SAME", "UC6", "2FA CMS fora UFP MVP"),
    ("CMS-05", "CMS", "Cadastrar/editar programa", "EI", "M", "M", "SAME", "UC7", "RFP"),
    ("CMS-06", "CMS", "Criar/configurar edição", "EI", "M", "A", "EXPAND", "UC9", "Limiares, doação, WA"),
    ("CMS-07", "CMS", "Cadastrar unidade", "EI", "B", "B", "SAME", "UC66", "RFP"),
    ("CMS-08", "CMS", "Criar módulo e atividades", "EI", "M", "A", "EXPAND", "UC15", "12 tipos"),
    ("CMS-09", "CMS", "Configurar régua/bloqueios seleção", "EI", "B", "A", "EXPAND", "UC12", "6 critérios"),
    ("CMS-10", "CMS", "Configurar % beneficiamento/certificação", "EI", "B", "M", "EXPAND", "UC13", "Por edição"),
    ("CMS-11", "CMS", "Configurar elegibilidade doação A-D", "EI", "N", "M", "NEW", "UC14", ""),
    ("CMS-12", "CMS", "Associar organização à edição", "EI", "N", "B", "NEW", "UC11", ""),
    ("CMS-13", "CMS", "Encerrar edição (freeze)", "EI", "N", "M", "NEW", "UC81", ""),
    ("CMS-14", "CMS", "Criar formulário pesquisa pós-programa", "EI", "N", "M", "NEW", "UC82", ""),
    ("CMS-15", "CMS", "CRUD AlertRule (catálogo tipado)", "EI", "N", "A", "NEW", "UC87", ""),
    ("CMS-16", "CMS", "Simular audiência / teste envio alerta", "EQ", "N", "M", "NEW", "UC87", ""),
    ("CMS-17", "CMS", "Listar programas/edições (admin)", "EQ", "B", "B", "SAME", "UC7,UC9", ""),
    ("CMS-18", "CMS", "Cadastrar organização", "EI", "N", "B", "NEW", "UC10", ""),
    ("CMS-19", "CMS", "Cadastrar voluntário/mentor", "EI", "N", "B", "NEW", "UC73", ""),
    # INSCR
    ("INS-01", "INSCR", "Pré-cadastro (lead + aceites WA)", "EI", "B", "M", "EXPAND", "UC19,UC20", "WA obrigatório"),
    ("INS-02", "INSCR", "Inscrição completa (multi-etapas)", "EI", "A", "A", "SAME", "UC21", "RFP"),
    ("INS-03", "INSCR", "Validar elegibilidade automática", "EO", "M", "A", "EXPAND", "UC23", "Bloqueios + score"),
    ("INS-04", "INSCR", "Consultar histórico legado por CPF", "EQ", "M", "M", "SAME", "UC22,UC62", "RFP"),
    ("INS-05", "INSCR", "Retomar inscrição / UUID dispositivo", "EI", "N", "M", "NEW", "UC67", ""),
    ("INS-06", "INSCR", "Atualizar dados empreendedora", "EI", "M", "M", "SAME", "UC27", "RFP"),
    ("INS-07", "INSCR", "Mini CRM — listar/exportar leads", "EQ", "N", "M", "NEW", "UC26", ""),
    ("INS-08", "INSCR", "Mini CRM — disparo manual lembrete", "EO", "N", "M", "NEW", "UC26", ""),
    ("INS-09", "INSCR", "Aceitar termos LGPD/imagem", "EI", "M", "M", "SAME", "UC20", "RFP"),
    # SELECAO
    ("SEL-01", "SELECAO", "Classificar inscrições (status)", "EI", "M", "M", "SAME", "UC24", "RFP"),
    ("SEL-02", "SELECAO", "Aplicar/exibir score X/Y na seleção", "EQ", "N", "M", "NEW", "UC24,UC12", ""),
    ("SEL-03", "SELECAO", "Entrevista de seleção (P/H)", "EI", "N", "M", "NEW", "UC84", ""),
    ("SEL-04", "SELECAO", "Alocar em turma", "EI", "M", "M", "SAME", "UC17", "RFP"),
    ("SEL-05", "SELECAO", "Remanejar unidade/turma", "EI", "B", "M", "EXPAND", "UC18", "Any time"),
    ("SEL-06", "SELECAO", "Comunicar resultado seleção", "EO", "M", "A", "EXPAND", "UC25", "Inicia jornada"),
    ("SEL-07", "SELECAO", "Criar/editar turma + link grupo WA", "EI", "M", "M", "SAME", "UC16", "RFP"),
    ("SEL-08", "SELECAO", "Agrupar empreendimento coletivo", "EI", "N", "A", "NEW", "UC31", ""),
    ("SEL-09", "SELECAO", "Mover empreendedora entre negócios", "EI", "N", "M", "NEW", "UC32", ""),
    ("SEL-10", "SELECAO", "Export CSV inscritas", "EO", "B", "B", "SAME", "UC24", ""),
    ("SEL-11", "SELECAO", "Dashboard edições (gestor)", "EQ", "B", "M", "EXPAND", "UC3", ""),
    ("SEL-12", "SELECAO", "Login gestor link mágico", "EI", "M", "M", "SAME", "UC3", "RFP"),
    ("SEL-13", "SELECAO", "Registrar desistência/cancelamento", "EI", "B", "M", "EXPAND", "UC30", ""),
    # JORNADA
    ("JOR-01", "JORNADA", "Liberar atividades (visão módulo)", "EI", "M", "A", "EXPAND", "UC34", ""),
    ("JOR-02", "JORNADA", "Orquestrar jornada OK/lote (backend)", "EO", "N", "A", "NEW", "UC33", ""),
    ("JOR-03", "JORNADA", "Consumir conteúdo / home programa", "EQ", "M", "M", "SAME", "UC36", "RFP"),
    ("JOR-04", "JORNADA", "Registrar progresso videoaula", "EI", "M", "M", "SAME", "UC37", "RFP"),
    ("JOR-05", "JORNADA", "Assistir live / KW presença online", "EI", "B", "A", "EXPAND", "UC38", "Funil"),
    ("JOR-06", "JORNADA", "Responder questionário", "EI", "M", "M", "SAME", "UC39", "RFP"),
    ("JOR-07", "JORNADA", "Presença QR / deep link", "EI", "M", "M", "SAME", "UC40", "RFP"),
    ("JOR-08", "JORNADA", "Presença manual", "EI", "B", "B", "SAME", "UC41", "RFP"),
    ("JOR-09", "JORNADA", "Consultar frequência", "EQ", "B", "B", "SAME", "UC42", "RFP"),
    ("JOR-10", "JORNADA", "Enviar tarefa (upload)", "EI", "M", "M", "SAME", "UC43", "RFP"),
    ("JOR-11", "JORNADA", "Aprovar entrega/financeiro", "EI", "M", "M", "SAME", "UC44,UC46", "RFP"),
    ("JOR-12", "JORNADA", "Enviar dados financeiros mensais", "EI", "M", "A", "EXPAND", "UC45", "Zero justificado"),
    ("JOR-13", "JORNADA", "Adicionar aula presencial extra", "EI", "B", "B", "SAME", "UC35", ""),
    ("JOR-14", "JORNADA", "Relato de oficina + export presença", "EO", "N", "M", "NEW", "UC80", ""),
    ("JOR-15", "JORNADA", "Calendário de atividades (cliente)", "EQ", "B", "B", "SAME", "UC68", ""),
    ("JOR-16", "JORNADA", "Agendar visita técnica", "EI", "N", "M", "NEW", "UC78", ""),
    ("JOR-17", "JORNADA", "Inserir dados em nome da empreendedora", "EI", "N", "M", "NEW", "UC69", ""),
    ("JOR-18", "JORNADA", "Ranking / engajamento / estados risco", "EQ", "B", "A", "EXPAND", "UC56", ""),
    ("JOR-19", "JORNADA", "Emitir certificado / beneficiamento auto", "EO", "M", "A", "EXPAND", "UC55", ""),
    ("JOR-20", "JORNADA", "Solicitar certificado (autoatendimento)", "EQ", "B", "B", "SAME", "UC63", ""),
    ("JOR-21", "JORNADA", "Solicitar desligamento", "EI", "N", "M", "NEW", "UC79", ""),
    # COMMS
    ("COM-01", "COMMS", "Disparar WA individual (API)", "EO", "M", "M", "SAME", "UC49", "RFP"),
    ("COM-02", "COMMS", "Comunicar grupo WA (facilitador)", "EO", "B", "M", "EXPAND", "UC50", ""),
    ("COM-03", "COMMS", "Enviar vídeo/conteúdo WA (lote)", "EO", "M", "A", "EXPAND", "UC51", "Pós-OK"),
    ("COM-04", "COMMS", "Enviar link mágico", "EO", "M", "M", "SAME", "UC54", "RFP"),
    ("COM-05", "COMMS", "Mensagens direcionadas manuais online", "EO", "N", "A", "NEW", "UC53", ""),
    ("COM-06", "COMMS", "Avaliador + fila alertas (backend)", "EO", "B", "A", "EXPAND", "UC52,UC87", "RFP programar msgs"),
    ("COM-07", "COMMS", "Binding alertas na edição (Unidade)", "EI", "N", "M", "NEW", "UC87", ""),
    ("COM-08", "COMMS", "Preview audiência / histórico alertas", "EQ", "N", "M", "NEW", "UC87", ""),
    ("COM-09", "COMMS", "Chat dúvidas (Agente IA)", "EI", "M", "M", "SAME", "UC64", "RFP chat"),
    ("COM-10", "COMMS", "Notificar novo conteúdo", "EO", "B", "B", "SAME", "UC33", "RFP"),
    ("COM-11", "COMMS", "Login empreendedora link mágico", "EI", "M", "M", "SAME", "UC4", "RFP"),
    ("COM-12", "COMMS", "Consultar consumo msgs WA (BI)", "EQ", "N", "B", "NEW", "UC65", ""),
    # DOACAO
    ("DOA-01", "DOACAO", "Sugerir/aprovar doação P/H (manual)", "EI", "B", "A", "EXPAND", "UC57", ""),
    ("DOA-02", "DOACAO", "Selecionar elegíveis lote A-D", "EI", "N", "M", "NEW", "UC85", ""),
    ("DOA-03", "DOACAO", "Funil online liberar doação (regras)", "EO", "N", "A", "NEW", "UC38,UC57", ""),
    ("DOA-04", "DOACAO", "Coletar PIX/bancário e recibo", "EI", "N", "A", "NEW", "UC86", ""),
    ("DOA-05", "DOACAO", "Analisar capital semente", "EQ", "B", "M", "EXPAND", "UC58", ""),
    ("DOA-06", "DOACAO", "Gestão de mentorias", "EI", "N", "A", "NEW", "UC70", ""),
    ("DOA-07", "DOACAO", "Workshop encerramento (operar live)", "EI", "N", "M", "NEW", "UC38", ""),
    ("DOA-08", "DOACAO", "Registrar observação acompanhamento", "EI", "N", "B", "NEW", "UC77", ""),
    # BI_LGPD
    ("BI-01", "BI_LGPD", "Dashboard impacto (consulta)", "EQ", "A", "A", "SAME", "UC59", "RFP"),
    ("BI-02", "BI_LGPD", "Relatórios quantitativos", "EO", "A", "A", "SAME", "UC60", "RFP"),
    ("BI-03", "BI_LGPD", "Relatórios qualitativos", "EO", "M", "M", "SAME", "UC61", "RFP"),
    ("BI-04", "BI_LGPD", "Totalizadores com dados pregressos", "EO", "M", "M", "SAME", "UC71", "RFP"),
    ("BI-05", "BI_LGPD", "Visualizar pesquisa pós-programa", "EQ", "N", "M", "NEW", "UC82", ""),
    ("BI-06", "BI_LGPD", "Anonimizar dados / revalidar aceite", "EO", "M", "A", "EXPAND", "UC76", ""),
    ("BI-07", "BI_LGPD", "Classificar status participante (motor)", "EO", "B", "M", "EXPAND", "UC29", ""),
    ("BI-08", "BI_LGPD", "Disparar pesquisa pós-programa", "EO", "N", "M", "NEW", "UC82", ""),
    ("BI-09", "BI_LGPD", "Visão multi-unidade gestor", "EQ", "N", "M", "NEW", "UC83", ""),
    ("BI-10", "BI_LGPD", "Alerta compatibilidade navegador", "EQ", "N", "B", "NEW", "UC72", ""),
]


def main() -> None:
    lines = ["id;cat;nome;tipo;cx_b0;pf_b0;cx_b1;pf_b1;delta;natureza;uc;origem"]
    b0 = b1 = 0
    for id_, cat, nome, tipo, cx0, cx1, nat, uc, origem in CATALOG:
        p0, p1 = pf(tipo, cx0), pf(tipo, cx1)
        b0 += p0
        b1 += p1
        lines.append(
            ";".join(
                [
                    id_,
                    cat,
                    nome.replace(";", ","),
                    tipo,
                    cx0 if cx0 != "N" else "-",
                    str(p0),
                    cx1 if cx1 != "N" else "-",
                    str(p1),
                    str(p1 - p0),
                    nat,
                    uc.replace(";", ","),
                    origem.replace(";", ","),
                ]
            )
        )
    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8-sig")
    growth = 100 * (b1 - b0) / b0 if b0 else 0
    print(f"Gerado: {OUT}")
    print(f"Funcoes: {len(CATALOG)} | UFP B0={b0} | B1={b1} | delta=+{b1 - b0} ({growth:.1f}%)")


if __name__ == "__main__":
    main()
