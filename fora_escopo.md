# Fora de escopo — Comparativo escopo original × Casos de Uso v4

**Data:** jul/2026  
**Fontes:** [escopo_original_cliente.txt](escopo_original_cliente.txt) · [Casos de Uso - Consulado da Mulher_v4.md](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v4.md)

---

## Metodologia

Este documento lista itens que o escopo original do cliente previa (ou implicava) e que, na documentação v4, foram excluídos, substituídos, reduzidos ou postergados.

**Classificação:**

| Sigla | Significado |
| ----- | ----------- |
| **EXPLÍCITO** | Declarado fora de escopo, substituído ou Fase 3 no v4/contrato/reuniões |
| **DEVE SER FORA** | Recomendação forte: inviável técnico/contratual ou substituído por solução definida |
| **PODE SER FORA** | Simplificação aceitável, entrega parcial ou priorização MVP; negociável |

Também há seção final sobre funcionalidades presentes no v4 mas ausentes no escopo original (ampliações que podem ser cortadas se o projeto precisar reduzir escopo).

---

## A) Gestão de pessoas beneficiadas

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Cadastro com RG como campo padrão | Removido; CPF obrigatório + RNE/passaporte/outros para estrangeiros (reunião 25/jun.) | EXPLÍCITO | Decisão de padronização documentada |
| Preenchimento automático de nova inscrição a partir de histórico/planilhas antigas | Base legada somente consulta (UC62); UC22 reutiliza cadastro recorrente com validação, sem importação em massa | DEVE SER FORA | Escopo original sugeria migração; v4 limita a consulta e reaproveitamento controlado |
| Perfil de acesso "educador" | Substituído por Gestor de Turma e Gestor de Unidade | EXPLÍCITO | Nomenclatura e perfis redefinidos nas reuniões |
| Autenticação da beneficiada com senha/login tradicional | Apenas link mágico (UC4); sem senha | EXPLÍCITO | Decisão arquitetural v3/v4 |

---

## B) Videoaulas e disparo de mensagens

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Armazenar videoaulas gravadas no próprio sistema | Vídeos hospedados no YouTube; sistema registra progresso (UC36/UC37) | DEVE SER FORA | Substituição por YouTube; não há repositório de mídia no backend |
| Escolha pré-lançamento: trilha sequencial OU consumo aleatório de aulas | Jornada online sequencial com temporizador (UC33); liberação progressiva | DEVE SER FORA | Modo "aleatório" não modelado no v4 |
| Controle de visualização integral (100%) das aulas | Meta configurável por percentual (ex.: 70% — UC37); engajamento = conclusão da atividade | PODE SER FORA | Atende parcialmente; critério "integral" só se configurado na edição (UC13) |
| Envio automatizado de mensagens em grupo via WhatsApp | UC50: facilitador manual (copiar mensagem + abrir link do grupo); sem API de grupo | EXPLÍCITO | Decisão explícita v3/v4 (custos Meta, limitações API) |
| Aulas ao vivo via Google Meet | Apenas YouTube para lives (UC38) | DEVE SER FORA | Google Meet não previsto no v4 |
| Programar mensagens automáticas (lembretes) | UC52/UC53 via Mautic — MVP | — | DENTRO DO ESCOPO (atendido) |
| Chat para tirar dúvidas | UC64 Chat IA — Fase 3 (fora do MVP imediato) | EXPLÍCITO | Previsto no contrato Fase 2, mas postergado na priorização v4 |
| Chat humano síncrono (atendimento em tempo real) | Apenas escalonamento do chatbot para educador/gestor (UC64) | PODE SER FORA | Escopo original não especificava IA vs. humano; v4 não modela chat ao vivo |

---

## C) Recebimento de materiais e exercícios

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Confirmação automática de recebimento e conclusão de exercícios | Fluxo de aprovação obrigatória pelo gestor (UC44); reprovação com notificação | DEVE SER FORA | Substitui "confirmação automática" por validação humana |
| Notificação automática sobre novos conteúdos | Via jornada Mautic/WhatsApp (UC33/UC49/UC53) — individual | PODE SER FORA | Atende para mensagens individuais; não para grupos (UC50 manual) |
| Preenchimento de indicadores pelo time que atende | UC69 inserção em nome do gestor — Fase 3 na priorização v4 | PODE SER FORA | Funcionalidade existe (UC69) mas fora do MVP imediato |
| Dados financeiros: renda, faturamento, investimento, poupança | UC45 + despesas, clientes, produtos vendidos — ampliado no v4 | — | DENTRO DO ESCOPO (atendido e expandido) |

---

## D) Inscrição e gestão de programas

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Migrar planilha de inscrições Google Forms para dentro do sistema | Sem UC de importação/migração em massa; inscrição nativa (UC19–UC21) | DEVE SER FORA | Dados legados: consulta (UC62), não carga automática |
| Aceites de privacidade e uso de imagem | UC20 (LGPD, comunicação, cookies, localStorage, regulamento/imagem) | — | DENTRO DO ESCOPO |
| Organização de grupos e turmas | Hierarquia Programa → Edição → Unidade → Turma (mais granular que o original) | PODE SER FORA | Ampliação de complexidade além do texto original |
| Controle de vagas e confirmações | UC16 (vagas por turma), UC24 (seleção), UC25 (comunicação resultado) | — | DENTRO DO ESCOPO |

---

## E) Relatórios e indicadores de impacto

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Dashboard visual com métricas | UC59 — MVP; BI externo | — | DENTRO DO ESCOPO |
| Relatórios quantitativos e qualitativos | UC60, UC61 — MVP | — | DENTRO DO ESCOPO |
| KPIs: inscritas, selecionadas, iniciaram, concluíram | UC29, UC59, UC71 | — | DENTRO DO ESCOPO |
| NPS / avaliação de aulas | UC48 — MVP | — | DENTRO DO ESCOPO |
| Ranking automático de premiação | Premiação manual (UC57); ranking só consulta (UC56) — Fase 3 | EXPLÍCITO | Escopo original não pedia premiação; v4 adiciona processo manual |
| Capital semente / elegibilidade específica | UC58 — Fase 3 | PODE SER FORA | Não consta no escopo original; ampliação v4 |

---

## F) Controle de usuários e permissões

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Diferentes níveis de acesso (admin, gestor, educador) | CMS + Gestor Unidade + Gestor Turma + Admin Programa + Admin Sistema | — | DENTRO DO ESCOPO (redefinido) |
| Acesso das beneficiadas | Aplicativo Cliente via link mágico | — | DENTRO DO ESCOPO |

---

## G) Requisitos técnicos (escopo original §3.2)

| Item (escopo original) | Situação no v4 | Classificação | Observação |
| ---------------------- | -------------- | ------------- | ---------- |
| Hospedagem em cloud | AWS (stack contratual) | — | DENTRO DO ESCOPO |
| Compatível mobile e desktop | Responsivo; UC72 alerta de navegador — Fase 3 | PODE SER FORA | UC72 fora do MVP |
| Integração WhatsApp | Gupshup (individual); grupo manual (UC50) | PODE SER FORA | Parcial para grupos |
| Integração e-mail | SendGrid | — | DENTRO DO ESCOPO |
| Integração Google (genérica) | YouTube apenas; sem Meet, Forms, Drive ou Workspace | DEVE SER FORA | "Google" do original reduzido a YouTube |
| LGPD | Conformidade documentada; segregação por unidade; retenção 5 anos | — | DENTRO DO ESCOPO |
| Duplo fator de autenticação (2FA) nos sistemas administrativos | Previsto contrato; fora do MVP imediato (UC6) | EXPLÍCITO | Texto v4: "não bloqueante para MVP operacional" |
| Controle de expiração e troca de senhas (gestores) | UC6 — MVP | — | DENTRO DO ESCOPO |
| ~2.000–3.000 participantes/ano; 15–20 equipe; 3 admins | Capacidade implícita na arquitetura; sem UC específico de dimensionamento | PODE SER FORA | Requisito não operacionalizado em UC |
| Teste de penetração anual em sistemas e infraestrutura | Não mencionado nos casos de uso v4 | DEVE SER FORA | Exigência do RFP original sem UC/entregável correspondente |
| Solução pro bono / baixo custo mensal como critério de produto | Aspecto de contratação/comercial; não é funcionalidade do sistema | EXPLÍCITO | Fora do escopo de requisitos funcionais |

---

## H) Funcionalidades no v4 ausentes no escopo original (ampliações — podem ser cortadas)

Itens introduzidos na evolução requisitos → v4 que o documento inicial do cliente não pedia. Úteis para negociação de redução de escopo.

| Item (v4) | UC | Classificação | Observação |
| --------- | -- | ------------- | ---------- |
| Motor de Automação Mautic (camada separada) | UC33, UC52, UC53 | PODE SER FORA | Arquitetura contratual; simplificar para filas no backend reduziria escopo |
| UUID de dispositivo + localStorage + deep links | UC67 | PODE SER FORA | Melhoria de UX; não consta no escopo original |
| Presença automática via deep link/QR sem autenticação | UC40, UC67 | PODE SER FORA | Escopo original pedia frequência; não especificava automação por UUID |
| Empreendimento coletivo (N empreendedoras → 1 negócio) | UC31, UC32 | PODE SER FORA | Ampliação de domínio |
| Gestão de organizações patrocinadoras/parceiras (CNPJ) | UC10, UC11 | PODE SER FORA | Não consta no escopo original |
| Mentoria com voluntário/mentor | UC70, UC73 | PODE SER FORA | Fase 3; não no texto original |
| Mini CRM de leads com inscrição incompleta | UC26 | PODE SER FORA | Fase 3 na priorização (contradição: também listado no range MVP UC19–26) |
| Migrar colaborador entre unidades | UC75 | PODE SER FORA | Fase 3; pedido em reunião 25/jun., não no RFP original |
| Ativar/inativar colaborador | UC74 | PODE SER FORA | Fase 3; pedido em reunião 25/jun. |
| Consulta consumo/custo WhatsApp | UC65 | PODE SER FORA | Fase 3 |
| Calendário visual no app cliente | UC68 | PODE SER FORA | Fase 3 |
| Autoatendimento de reenvio de certificado | UC63 | PODE SER FORA | Fase 3; emissão automática (UC55) está no MVP |
| Totalizadores com dados pregressos | UC71 | PODE SER FORA | Fase 3 |
| Anonimização reversível (CPF, e-mail, telefone) | Segurança v4 | PODE SER FORA | Mais sofisticado que "anonimizar ou manter contagens" do escopo v4 base legada |
| Hierarquia Programa → Edição → Unidade → Turma | Domínio v4 | PODE SER FORA | Mais complexa que "grupos e turmas" do original; difícil remover sem impacto |
| Cancelamento/desistência tipificado | UC30 | PODE SER FORA | Fluxo operacional ampliado |
| Envio de vídeo em lote após resposta (`tab_empreendedor_atividade`) | UC33, UC51 | PODE SER FORA | Regra técnica v4; não no original |

---

## I) Resumo executivo

### Explicitamente fora ou postergado no v4

- 2FA no MVP (UC6)
- Chat de dúvidas IA no MVP (UC64 — Fase 3)
- Mensagens automatizadas em grupo WhatsApp (UC50 manual)
- Perfil "educador" (substituído)
- Senha para empreendedora (link mágico)
- Critério comercial pro bono / baixo custo como requisito de produto

### Deve permanecer fora (substituição técnica definida)

- Hospedagem de vídeos no sistema (→ YouTube)
- Google Meet (→ YouTube)
- Migração/importação em massa de Google Forms/planilhas
- Modo aleatório de consumo de videoaulas
- Confirmação automática de exercícios sem gestor (→ UC44)
- Teste de penetração anual como entregável de casos de uso
- Integração Google além de YouTube

### Pode ser fora (negociável / Fase 3 / parcial)

- UC26, UC51, UC56–UC58, UC63–UC65, UC64, UC68–UC75 (lista Fase 3 v4)
- UC69 inserção em nome da empreendedora (Fase 3 na priorização)
- UC72 alerta de navegador
- Ampliações de domínio (empreendimento, organizações, Mautic, UUID/deep links)
- Controle integral vs. percentual de vídeo (configurável)
- Notificações de grupo (manual via UC50)

---

## J) Itens do escopo original atendidos pelo v4 (referência rápida)

Para evitar ambiguidade, estes itens centrais do RFP original permanecem no escopo v4/MVP:

- Cadastro e atualização de participantes
- Frequência/presença (UC40, UC41, UC42)
- Histórico de participação (UC28, UC62)
- Videoaulas com controle de progresso (UC36, UC37)
- Mensagens individuais WhatsApp (UC49, UC54)
- Mensagens automáticas/lembretes (UC52, UC53)
- Upload de tarefas e materiais (UC43)
- Dados financeiros mensais (UC45, UC46)
- Formulários de indicadores baseline/endline (UC47)
- Inscrição online com LGPD (UC19–UC21)
- Turmas, vagas, seleção (UC16, UC17, UC24, UC25)
- Relatórios, dashboard, NPS (UC48, UC59–UC61)
- Perfis e permissões de equipe (UC1, UC3, UC5, UC66)
- Cloud, mobile, LGPD base, integração WhatsApp/e-mail

---

*Revisar quando houver Casos de Uso v5 ou alteração contratual.*
