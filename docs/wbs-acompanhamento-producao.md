# WBS — Acompanhamento de produção (Consulado da Mulher)

| Campo | Valor |
| ----- | ----- |
| **Finalidade** | Estrutura para planilha Google Sheets de status de produção |
| **Base** | Casos de Uso v7, ADR jornada online, protótipos Cliente/Gestor |
| **Versão** | 1.0 — ago/2026 |

---

## Legenda de nomenclatura

Use estes nomes na planilha e nas reuniões para evitar confusão:

| Nome informal (evitar como pacote) | Nome canônico no projeto |
| ---------------------------------- | ----------------------- |
| Aplicativo educacional / portal | **Aplicativo Cliente** |
| Aplicativo administrador / admin | **CMS de Administração (Strapi)** |
| Cadastro | **Inscrição** (App Cliente) + **cadastros mestres** (CMS: programa, edição, unidade, turma, colaborador) |
| Processos | Artefatos de **Requisitos e domínio** (não é plataforma) |
| Casos de Uso / Jornadas | Subatividades do pacote **Requisitos e domínio** |
| Automações | Desenho na Fase 1; **build** (filas + Gupshup) na Fase 2 |
| Backend / API / filas | **Sistemas de Retaguarda (Backend)** |
| Painel / relatórios | **Painel de Dados (BI)** |

**Plataformas canônicas (v6):** CMS · Aplicativo Cliente · Aplicativo Gestor · BI · Backend · Automação (WhatsApp path = fila no backend).

---

## Colunas sugeridas (Google Sheets)

### Aba 1 — Acompanhamento

| Coluna | Conteúdo |
| ------ | -------- |
| `id` | Código WBS (ex.: 1.2.1) |
| `fase` | 1 — Levantamento / 2 — Desenvolvimento |
| `pacote` | Ex.: 1.2 Prototipação UX/UI |
| `atividade` | Ex.: App Cliente |
| `subatividade` | Ex.: Inscrição 4 blocos |
| `status` | Não iniciado / Em andamento / Concluído / Bloqueado |
| `pct` | 0–100 |
| `dono` | Responsável |
| `evidencia` | Link (protótipo, UC, PR, ADR) |
| `observacao` | Livre |

### Aba 2 — Resumo executivo

Pivot por `pacote` com média de `pct` (status para cliente/direção).

### Aba 3 — Legenda

Copiar a tabela de nomenclatura acima.

### Aba 4 — Backlog por UC (opcional)

Só se o time precisar; **não** usar na apresentação executiva.

---

## Árvore WBS

### FASE 1 — Levantamento de requisitos e prototipação

#### 1.1 Requisitos e domínio

- 1.1.1 Reuniões e atas (abr–jul/2026+)
- 1.1.2 Escopo original × ampliação (`fora_escopo_v1` / aditivo comercial)
- 1.1.3 Casos de Uso (manutenção v7 e decisões fechadas)
- 1.1.4 Glossário e regras de domínio (modalidades; empreendimento × empreendedora; UC24 ≠ UC25 ≠ OK)
- 1.1.5 Jornadas (online WhatsApp; presencial/híbrido; inscrição → seleção → aplicação → certificação)
- 1.1.6 Critérios fixos × régua dinâmica (UC12)
- 1.1.7 Priorização MVP × Fase 3

#### 1.2 Prototipação UX/UI

- 1.2.1 Design system / Design.md
- 1.2.2 Protótipo App Cliente — inscrição/cadastro (4 blocos)
- 1.2.3 Protótipo App Cliente — home, atividades, faturamento, presença, desligamento
- 1.2.4 Protótipo App Gestor — dashboard edições, seleção/score, comunicar (UC25)
- 1.2.5 Protótipo App Gestor — módulos, presença, doação, visita técnica
- 1.2.6 Protótipo CMS — programa, edição, módulos, templates, nº WhatsApp org
- 1.2.7 Protótipo BI — indicadores (inscritos, selecionados, frequência, financeiro, maratona/risco)
- 1.2.8 Validação com Consulado e ajustes

#### 1.3 Arquitetura e integrações (desenho)

- 1.3.1 ADR jornada online (filas, Gupshup, Strapi)
- 1.3.2 Modelo de dados (empreendimento, inscrição, jornada)
- 1.3.3 Desenho de automações (inbound inscrição, UC25, timer/OK/lote, e-mail opcional)
- 1.3.4 Matriz de ambientes e integrações (Gupshup, SendGrid, YouTube)

---

### FASE 2 — Desenvolvimento (MVP edições 2027)

#### 2.1 Infraestrutura

- 2.1.1 AWS (ECS / Aurora / Redis ou SQS / S3)
- 2.1.2 CI/CD e secrets
- 2.1.3 Ambientes (dev / homolog / prod)

#### 2.2 Backend / APIs

- 2.2.1 Auth link mágico (Cliente + Gestor)
- 2.2.2 Domínio: inscrição, seleção, empreendimento, progresso
- 2.2.3 Webhooks Gupshup + filas (liberar / OK / lote)
- 2.2.4 OpenAPI do caminho crítico

#### 2.3 CMS de Administração (Strapi)

- 2.3.1 Usuários, roles, colaboradores
- 2.3.2 Programa, edição, unidade, turma
- 2.3.3 Módulos e atividades
- 2.3.4 Critérios UC12; % beneficiamento / certificação
- 2.3.5 Templates Meta + número WhatsApp da organização
- 2.3.6 Conteúdo / regulamento

#### 2.4 Aplicativo Cliente (educacional)

- 2.4.1 Landing + pré-cadastro + inscrição (cadastro)
- 2.4.2 Confirmação + CTA WhatsApp (`wa.me`)
- 2.4.3 Home / trilha / videoaula / questionários
- 2.4.4 Tarefas, faturamento mensal, presença, plano de ação
- 2.4.5 Certificado / desligamento / LGPD no dispositivo

#### 2.5 Aplicativo Gestor

- 2.5.1 Login link mágico + dashboard de edições
- 2.5.2 Seleção (score ↓, filtro por pontos) + alocar / remanejar
- 2.5.3 Comunicar aprovação (UC25)
- 2.5.4 Módulos: liberar (P/H) / acompanhar (online)
- 2.5.5 Aprovações de entrega / financeiro
- 2.5.6 Comunicação grupo (facilitador), mini CRM, doação, visita técnica (MVP sem logística avançada)

#### 2.6 Automações (build)

- 2.6.1 Inbound pós-cadastro → template de inscrição
- 2.6.2 UC25 → início jornada (online) / convite ao grupo (P/H)
- 2.6.3 Temporizadores + OK + lote + lembretes (UC53)
- 2.6.4 E-mail / nurturing (somente se mantido no contrato)

#### 2.7 Painel de Dados (BI)

- 2.7.1 Datasets / ETL a partir do operacional
- 2.7.2 Dashboards: funil inscrição/seleção, frequência, financeiro, cobertura/maratona
- 2.7.3 Exportações / base legada (conforme MVP)

#### 2.8 Qualidade e entrega

- 2.8.1 Testes do caminho crítico (inscrição → seleção → UC25 → 1º OK)
- 2.8.2 Homologação com Consulado
- 2.8.3 Go-live edições 2027 / handoff

---

## Tabela flat (colar no Sheets)

Copie a tabela abaixo para a Aba 1. Preencha `status`, `pct`, `dono`, `evidencia` e `observacao` na planilha.

| id | fase | pacote | atividade | subatividade |
| -- | ---- | ------ | --------- | ------------ |
| 1.1.1 | 1 — Levantamento | 1.1 Requisitos e domínio | Governança de requisitos | Reuniões e atas (abr–jul/2026+) |
| 1.1.2 | 1 — Levantamento | 1.1 Requisitos e domínio | Governança de requisitos | Escopo original × ampliação (fora_escopo / aditivo) |
| 1.1.3 | 1 — Levantamento | 1.1 Requisitos e domínio | Casos de Uso | Manutenção v7 e decisões fechadas |
| 1.1.4 | 1 — Levantamento | 1.1 Requisitos e domínio | Domínio | Glossário e regras (modalidades; empreendimento; UC24≠UC25≠OK) |
| 1.1.5 | 1 — Levantamento | 1.1 Requisitos e domínio | Jornadas | Online WhatsApp; P/H; inscrição → seleção → aplicação → certificação |
| 1.1.6 | 1 — Levantamento | 1.1 Requisitos e domínio | Elegibilidade | Critérios fixos × régua dinâmica (UC12) |
| 1.1.7 | 1 — Levantamento | 1.1 Requisitos e domínio | Priorização | MVP × Fase 3 |
| 1.2.1 | 1 — Levantamento | 1.2 Prototipação UX/UI | Design | Design system / Design.md |
| 1.2.2 | 1 — Levantamento | 1.2 Prototipação UX/UI | App Cliente | Inscrição/cadastro (4 blocos) |
| 1.2.3 | 1 — Levantamento | 1.2 Prototipação UX/UI | App Cliente | Home, atividades, faturamento, presença, desligamento |
| 1.2.4 | 1 — Levantamento | 1.2 Prototipação UX/UI | App Gestor | Dashboard edições, seleção/score, comunicar UC25 |
| 1.2.5 | 1 — Levantamento | 1.2 Prototipação UX/UI | App Gestor | Módulos, presença, doação, visita técnica |
| 1.2.6 | 1 — Levantamento | 1.2 Prototipação UX/UI | CMS | Programa, edição, módulos, templates, nº WhatsApp org |
| 1.2.7 | 1 — Levantamento | 1.2 Prototipação UX/UI | BI | Indicadores (inscritos, selecionados, frequência, financeiro, maratona) |
| 1.2.8 | 1 — Levantamento | 1.2 Prototipação UX/UI | Validação | Validação com Consulado e ajustes |
| 1.3.1 | 1 — Levantamento | 1.3 Arquitetura e integrações | ADR | Jornada online (filas, Gupshup, Strapi) |
| 1.3.2 | 1 — Levantamento | 1.3 Arquitetura e integrações | Dados | Modelo (empreendimento, inscrição, jornada) |
| 1.3.3 | 1 — Levantamento | 1.3 Arquitetura e integrações | Automações (desenho) | Inbound inscrição, UC25, timer/OK/lote, e-mail opcional |
| 1.3.4 | 1 — Levantamento | 1.3 Arquitetura e integrações | Integrações | Matriz ambientes (Gupshup, SendGrid, YouTube) |
| 2.1.1 | 2 — Desenvolvimento | 2.1 Infraestrutura | AWS | ECS / Aurora / Redis ou SQS / S3 |
| 2.1.2 | 2 — Desenvolvimento | 2.1 Infraestrutura | DevOps | CI/CD e secrets |
| 2.1.3 | 2 — Desenvolvimento | 2.1 Infraestrutura | Ambientes | Dev / homolog / prod |
| 2.2.1 | 2 — Desenvolvimento | 2.2 Backend / APIs | Auth | Link mágico (Cliente + Gestor) |
| 2.2.2 | 2 — Desenvolvimento | 2.2 Backend / APIs | Domínio | Inscrição, seleção, empreendimento, progresso |
| 2.2.3 | 2 — Desenvolvimento | 2.2 Backend / APIs | Mensageria | Webhooks Gupshup + filas (liberar / OK / lote) |
| 2.2.4 | 2 — Desenvolvimento | 2.2 Backend / APIs | Contratos | OpenAPI do caminho crítico |
| 2.3.1 | 2 — Desenvolvimento | 2.3 CMS de Administração | Acesso | Usuários, roles, colaboradores |
| 2.3.2 | 2 — Desenvolvimento | 2.3 CMS de Administração | Estrutura | Programa, edição, unidade, turma |
| 2.3.3 | 2 — Desenvolvimento | 2.3 CMS de Administração | Conteúdo educacional | Módulos e atividades |
| 2.3.4 | 2 — Desenvolvimento | 2.3 CMS de Administração | Regras | Critérios UC12; % beneficiamento / certificação |
| 2.3.5 | 2 — Desenvolvimento | 2.3 CMS de Administração | WhatsApp config | Templates Meta + número WhatsApp org |
| 2.3.6 | 2 — Desenvolvimento | 2.3 CMS de Administração | Conteúdo | Regulamento e textos da edição |
| 2.4.1 | 2 — Desenvolvimento | 2.4 Aplicativo Cliente | Inscrição | Landing + pré-cadastro + inscrição (cadastro) |
| 2.4.2 | 2 — Desenvolvimento | 2.4 Aplicativo Cliente | Inscrição | Confirmação + CTA WhatsApp |
| 2.4.3 | 2 — Desenvolvimento | 2.4 Aplicativo Cliente | Jornada educacional | Home / trilha / videoaula / questionários |
| 2.4.4 | 2 — Desenvolvimento | 2.4 Aplicativo Cliente | Entregas | Tarefas, faturamento mensal, presença, plano de ação |
| 2.4.5 | 2 — Desenvolvimento | 2.4 Aplicativo Cliente | Encerramento | Certificado / desligamento / LGPD dispositivo |
| 2.5.1 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Acesso | Login link mágico + dashboard de edições |
| 2.5.2 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Seleção | Score ↓, filtro por pontos; alocar / remanejar |
| 2.5.3 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Seleção | Comunicar aprovação (UC25) |
| 2.5.4 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Operação | Módulos: liberar (P/H) / acompanhar (online) |
| 2.5.5 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Operação | Aprovações de entrega / financeiro |
| 2.5.6 | 2 — Desenvolvimento | 2.5 Aplicativo Gestor | Operação | Grupo WhatsApp, mini CRM, doação, visita técnica (MVP) |
| 2.6.1 | 2 — Desenvolvimento | 2.6 Automações | WhatsApp | Inbound pós-cadastro → template inscrição |
| 2.6.2 | 2 — Desenvolvimento | 2.6 Automações | WhatsApp | UC25 → jornada online / convite grupo P/H |
| 2.6.3 | 2 — Desenvolvimento | 2.6 Automações | WhatsApp | Temporizadores + OK + lote + lembretes UC53 |
| 2.6.4 | 2 — Desenvolvimento | 2.6 Automações | E-mail | Nurturing (somente se no contrato) |
| 2.7.1 | 2 — Desenvolvimento | 2.7 Painel de Dados (BI) | Dados | Datasets / ETL operacional |
| 2.7.2 | 2 — Desenvolvimento | 2.7 Painel de Dados (BI) | Dashboards | Funil, frequência, financeiro, cobertura/maratona |
| 2.7.3 | 2 — Desenvolvimento | 2.7 Painel de Dados (BI) | Exportações | Exportações / base legada (MVP) |
| 2.8.1 | 2 — Desenvolvimento | 2.8 Qualidade e entrega | QA | Testes caminho crítico (inscrição → seleção → UC25 → 1º OK) |
| 2.8.2 | 2 — Desenvolvimento | 2.8 Qualidade e entrega | Homologação | Homologação com Consulado |
| 2.8.3 | 2 — Desenvolvimento | 2.8 Qualidade e entrega | Entrega | Go-live edições 2027 / handoff |

---

## O que não entra como pacote de 1º nível

- “Processos”, “Casos de Uso” e “Jornadas” fora do levantamento → ficam em **1.1**
- “Cadastro” como plataforma → vira subatividade de **Cliente** e **CMS**
- Lista de UCs na aba executiva → usar aba 4 opcional

---

## Referências

- [Casos de Uso v7](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md)
- [ADR jornada online](adr-jornada-online.md)
- [Protótipo Aplicativo Cliente](../prototipo/Aplicativo%20Cliente.md)
- [Protótipo Aplicativo Gestor](../prototipo/Aplicativo%20Gestor.md)
- [fora_escopo_v1](../fora_escopo_v1.md)

_Documento WBS — ago/2026. Pasta: `documentacao/docs/`._
