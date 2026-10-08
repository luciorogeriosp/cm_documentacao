# Revalidação C4 × stack (out/2026)

Comparação dos diagramas em `docs/arquitetura/c4/` com os repositórios clonados em `c:\work\EWTI-BR\` (`cm_backend`, `cm_frontend`, `cm_app_gestor`, `cm_hub`, `cm_message_hub`, Trigger em `cm_backend/src/trigger`). **`cm_cms_gestao` não estava clonado** — CMS inferido via `cmsPrisma` + docs; admin homolog: `https://cmshomolog.menduca.com.br/admin`.

**Cobertura (out/2026):** os **33** arquivos C4 (nível 1 + nível 2) incluem seção **Revalidação com a stack** — detalhada em contexto e CRM J1–J3; compacta nas demais jornadas com link para esta matriz.

Legenda: **OK** alinhado · **Parcial** · **Gap** não implementado ou spec divergente · **N/A** só spec/externo

## Cross-cutting (todos os módulos)

| ID | Tema | Spec / diagrama | Stack |
| --- | --- | --- | --- |
| **X-01** | Preview Mermaid | C4Context/C4Container | Preferir flowchart no Cursor; C4 em [mermaid.live](https://mermaid.live) |
| **X-02** | Message Hub | Um worker | Express + BullMQ + **Trigger.dev** (`sync-alerts`) + repo legado `cm_message_hub` |
| **X-03** | AlertRule UC87 | `inscription_incomplete`, `EditionAlertBinding` | **Gap:** regras CMS `components_whatsapp_regra_automacaos` + automação/cron |
| **X-04** | Gestor WhatsApp | Só backend | **Gap:** BFF `cm_app_gestor` `/api/gupshup/send` + backend `comunicacoes` |
| **X-05** | Gestor UI | Telas = API | **Parcial:** muitas stores mock (`gestor-atividades-store`, `gestor-encerramento-store`, …) |
| **X-06** | BI | Container no sistema | **Externo:** `https://bi.menduca.com.br` — sem módulo BI no backend |
| **X-07** | UC26 Mini CRM | App Gestor | **Gap:** menu `/leads` sem `page.tsx`; API `/automation/*` só chave CMS |
| **X-08** | Pré-inscrição UUID | UUID só após UC21 | **`str_uuid` em `tab_pre_inscricao` na J1** |
| **X-09** | Janela inscrição | Edição aberta | **Gap:** enrollment page não usa `enrollmentOpensAt`/`ClosesAt` |
| **X-10** | Sessão dispositivo | `GET /sessao/dispositivo/{uuid}` | **Gap:** JWT empreendedor + `localStorage` auth |

## Nível 1 — Contexto

| Doc | Backend | Frontend | Nota |
| --- | --- | --- | --- |
| [c4-nivel1-contexto.md](c4/nivel1/c4-nivel1-contexto.md) | OK | OK | Detalhe em **CTX-01…07** no próprio arquivo |

## CRM

| Jornada | Doc | Backend | Frontend | Resumo |
| --- | --- | --- | --- | --- |
| 1 Captura lead | [jornada1](c4/nivel2/crm/c4-nivel2-crm-jornada1-captura-lead-aceites.md) | OK | OK | `POST /pre-registrations`, aceites em colunas |
| 2 Retomada local | [jornada2](c4/nivel2/crm/c4-nivel2-crm-jornada2-retomada-progresso-dispositivo.md) | Parcial | OK | Só `localStorage`; upsert lead sem duplicar |
| 3 Mini CRM | [jornada3](c4/nivel2/crm/c4-nivel2-crm-jornada3-reengajamento-mini-crm.md) | Parcial | Gap | Automação sim; UC26 UI não |
| 4 Ponta a ponta | [jornada4](c4/nivel2/crm/c4-nivel2-crm-jornada4-ponta-a-ponta.md) | Parcial | Parcial | Consolidar J1–3 + `enrollment-resume` OTP |

## Empreendedor

| Jornada | Backend | Frontend | Resumo |
| --- | --- | --- | --- |
| 1 Inscrição UC21 | OK | OK | `POST /users`; gaps UC62, partial save |
| 2 Login | OK | OK | Magic link JWT; sem API sessão UUID |
| 3 Fila online | OK (automation) | N/A | WhatsApp OK/inbound; fora do app |
| 4 Funil doação live | Parcial | Parcial | `online-funnel` API; live invite via hub |
| 5 Consumo progresso | OK | OK | `progress/*`; calendário placeholder |
| 6 Entregas | Parcial | Parcial | `complete` JSON; sem upload tarefa/NF exc. doação |
| 7 Conclusão | Parcial | Parcial | Certificados stub; withdrawal OK |
| 8 Chat IA UC64 | Gap | Gap | UI mock `SupportChatDialog` |

## Gestor

| Jornada | Backend | Frontend | Resumo |
| --- | --- | --- | --- |
| 1 Seleção P/H | Parcial | Parcial | Inscritos, entrevista, comunicar, alocar — mocks + dual WhatsApp |
| 2 Seleção online | Parcial | Parcial | Mesmas telas; ramo online no service |
| 3 Liberação P/H | OK | Gap | API liberacoes/chamada; UI `gestor-atividades-store` |
| 4 Resgate online | Parcial | Gap | Estatísticas API; sem engajamento/UC87 UI |
| 5 Doação | OK | Gap | API doacoes; UI mock encerramento |
| 6 Empreendimento | Parcial | Gap | API agrupar; UI mock negócios |
| 7 Remanejamento | Parcial | Gap | **Broken:** alocar FE path/body ≠ BE |
| 8 Mentorias | OK | Gap | API mentorias; UI mock |
| 9 Multi-unidade | Parcial | Parcial | Login + edições; UC83 incompleto |
| 10 Alertas UC87 | Gap | Gap | Sem API binding; alertas estáticos na home |

## CMS (authoring Strapi — runtime via backend read)

| Jornada | Strapi (admin) | Backend read/automation | Nota |
| --- | --- | --- | --- |
| 1 Colaborador | Parcial (repo ausente) | OK gestor login | `tab_gestor_login` + CMS colaborador |
| 2 Edição | Parcial | OK | `management`, `cmsPrisma.edicaos` |
| 3 Pacotes/alertas | Parcial | OK | Regras WhatsApp bundle; não nomes spec AlertRule |
| 4 Organização | Parcial | OK | `organizacaos` |
| 5 Auth UC6 | N/A | Parcial | Janela envio; resto Strapi |
| 6 Inativar/migrar | N/A | Gap | UC74/75 não verificável local |

## BI (produto externo)

| Jornada | Backend | BI app | Nota |
| --- | --- | --- | --- |
| 1 Dashboard | Gap | Externo | Looker hipótese; dados operacionais existem |
| 2 Totalizadores | Gap | Externo | Sem job consolidação dedicado no backend |
| 3 Custo WhatsApp | Parcial | Externo | `tab_hub_mensagem`, disparos |
| 4 Pesquisa pós | Parcial | Externo | NPS/progress; não BI module |

## Como atualizar os diagramas

1. Manter bloco **fonte C4** como spec de produto.
2. Adicionar **flowchart preview** quando útil no Cursor.
3. Seção **Revalidação** no `.md` da jornada + linha nesta matriz.
4. Não alterar código da aplicação neste exercício — registrar **Gap** e pendência.

Última revisão em lote: **2026-10-08**.
