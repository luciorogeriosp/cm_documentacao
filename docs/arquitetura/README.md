# Arquitetura — diagramas C4

**Versão:** out/2026 (v1)  
**Fontes:** [Casos de Uso v10](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v10.md), jornadas em [docs/jornadas](../jornadas/README.md)

Diagramas **C4** (contexto e containers) por módulo e jornada. Cada arquivo traz objetivo, diagrama, containers, fluxo numerado e pontos de atenção para validação com produto e engenharia.

## Nível 1 — Contexto

| Arquivo | Conteúdo |
| ------- | -------- |
| [c4/nivel1/c4-nivel1-contexto.md](c4/nivel1/c4-nivel1-contexto.md) | Atores, sistema em foco e integrações externas (Gupshup, SendGrid, YouTube) |

O diagrama de contexto inclui **flowchart Mermaid** para preview no Cursor/VS Code e bloco **fonte C4** (`C4Context`) para [mermaid.live](https://mermaid.live).

## Nível 2 — Containers (por módulo)

| Pasta | Jornadas |
| ----- | -------- |
| [c4/nivel2/gestor/](c4/nivel2/gestor/) | Seleção P/H e online, liberação, resgate, doação, empreendimento, remanejamento, mentoria, multi-unidade, alertas |
| [c4/nivel2/empreendedor/](c4/nivel2/empreendedor/) | Inscrição, login, jornada online, funil/doação, progresso, entregas, conclusão, agente IA |
| [c4/nivel2/crm/](c4/nivel2/crm/) | Captura de lead, retomada, reengajamento, ponta a ponta |
| [c4/nivel2/cms/](c4/nivel2/cms/) | Colaborador, edição, comunicação/alertas, organização, auth, ciclo de vida |
| [c4/nivel2/bi/](c4/nivel2/bi/) | Dashboard, totalizadores, WhatsApp, pesquisa pós-programa |

## Notação e preview

- Blocos `C4Context` / `C4Container` exigem Mermaid com suporte C4 (GitHub, mermaid.live ou extensão dedicada).
- Onde houver seção **Diagrama (preview — flowchart)**, use o preview embutido de Markdown no editor.
- Detalhe de mensagens e gatilhos: [comunicacao.md](../jornadas/comunicacao.md).
