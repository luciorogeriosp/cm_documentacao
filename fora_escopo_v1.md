# Ampliação de escopo — Base para negociação comercial

| Campo | Valor |
| ----- | ----- |
| **Finalidade** | Documento de **suporte à negociação comercial** (aditivo de escopo / reequilíbrio) |
| **Público** | Comercial, direção e produto (contratante × contratada) |
| **Não é** | ADR técnico, backlog de corte MVP nem especificação de implementação |
| **Baseline (o que foi pedido por escrito)** | [escopo_original_cliente.txt](escopo_original_cliente.txt) |
| **O que o projeto se tornou** | [Casos de Uso — Consulado da Mulher v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) + reuniões abr.–jul./2026 |
| **Versão** | v1 (refatoração comercial — ago/2026) |
| **Antecessor técnico** | [fora_escopo_v0.md](fora_escopo_v0.md) (comparativo técnico v4; enfoque distinto) |

---

## 1. Objetivo deste documento

O [escopo original do cliente](escopo_original_cliente.txt) descreve, em linguagem de RFP, **módulos e necessidades** de um sistema de gestão de programas sociais. Nas **reuniões de levantamento** (abr.–jul./2026) o Consulado detalhou regras operacionais, papéis, jornada WhatsApp, seleção, empreendimento coletivo, LGPD operacional e indicadores que **não estavam escritos de forma explícita** nesse documento.

Este arquivo:

1. **Congela o baseline** = somente o que o texto original pede de forma explícita.
2. **Lista ampliações** pedidas ou consolidadas nas reuniões / documentação v6 e **ausentes** no baseline.
3. Oferece **medição de aumento de tamanho** (documental e funcional) para embasar aditivo.
4. Agrupa as ampliações em **pacotes negociáveis** (não em decisões técnicas de arquitetura).

> **Regra de rigor:** item só entra como “ampliação negociável” se **não houver menção explícita** no `escopo_original_cliente.txt`. Menções genéricas (“WhatsApp”, “turmas”, “LGPD”, “relatórios”) **não** cobrem fluxos específicos surgidos nas reuniões (ex.: jornada “OK” + lote; empreendimento coletivo; freeze de edição).

---

## 2. Baseline — o que o documento original pedia (explícito)

Texto-fonte: `escopo_original_cliente.txt` (§3.1 e §3.2). Em síntese, **seis blocos funcionais** + requisitos técnicos:

| Bloco original | Pedido explícito (resumo) |
| -------------- | ------------------------- |
| **A) Gestão de beneficiadas** | Cadastro (nome, idade, contato, CPF, endereço, escolaridade, perfil socioeconômico, raça…); atualização; frequência; histórico em programas anteriores |
| **B) Videoaulas e mensagens** | Local para assistir videoaulas; controle de aulas assistidas/integral/concluídas; trilha **ou** consumo aleatório; WhatsApp individual **e** em grupo; programar mensagens automáticas; **chat** para dúvidas; lives Google Meet ou YouTube |
| **C) Materiais e exercícios** | Envio/recebimento de materiais e tarefas; renda/faturamento/investimento/poupança mensal; notificação de novos conteúdos; confirmação de recebimento/conclusão; formulários de indicadores (beneficiada **e** time) |
| **D) Inscrição e programas** | Formulário online (ou migrar planilha Google); aceites privacidade e uso de imagem; grupos/turmas; vagas e confirmações |
| **E) Relatórios** | Frequência/participação/desempenho; contagens (inscritas, selecionadas, iniciaram, concluíram); evolução financeira; perfil socioeconômico; dashboard; NPS/avaliação |
| **F) Usuários** | Níveis admin / gestores / educadores; acesso das beneficiadas |
| **Técnico** | Cloud; mobile/desktop; integração WhatsApp, e-mail e Google; LGPD; 2FA e política de senhas nos administrativos; ~2–3 mil participantes/ano; pentest anual |

**O que o original *não* descreve** (ausência explícita — relevante para aditivo):

- Separação **programa / edição / unidade / turma** como modelo operacional
- Papéis **Gestor de Unidade** × **Gestor de Turma** com regras exclusivas
- **Pré-inscrita (lead)** vs empreendedora; ficha unificada em 4 blocos; score de vulnerabilidade; status “qualificado / em análise / não qualificado”; **aprovação libera a jornada**; seleção também aloca/remaneja unidade e turma com painel de ocupação; comunicar resultado é informativo (UC25)
- Entidade **empreendimento** (negócio coletivo), presença/faturamento/planos no negócio, certificado em cascata, BI pessoas + empreendimentos
- Jornada WhatsApp com **temporizador**, confirmação **“OK”**, envio em **lote**, vídeo arquivo WhatsApp + YouTube, checkbox de disparo por edição
- Autenticação da beneficiada **somente por link mágico**; UUID/dispositivo; presença por QR/deep link
- **Doação** (solicitar/aprovar); critérios parametrizados de beneficiamento/certificação (~50% / ~75%)
- **Plano de ação / planejamento estratégico**; relatos de oficina; encerrar edição (freeze); pesquisa pós-programa
- Organizações patrocinadoras; mentoria/voluntário; CMS + app gestor + app cliente + BI + backend + motor de automação como camadas nomeadas
- Operacionalização LGPD (anonimização em 5 anos com revalidação; anonimização de não aprovadas; base de consentimentos versionada)

---

## 3. O que o projeto se tornou

Após reuniões (abr.–jul./2026) e iterações de casos de uso até a **v6**, o projeto deixou de ser um “sistema monolítico de gestão” descrito em ~1 página de requisitos e passou a ser um **produto multiplataforma** com:

| Dimensão | Baseline (original) | Situação atual (v6) |
| -------- | ------------------- | ------------------- |
| Forma do requisito | Lista de módulos em prosa | **79 casos de uso ativos** (+ 3 incorporados) detalhados |
| Plataformas | Implícitas (“o sistema”) | **6 camadas**: CMS, App Gestor, App Cliente, BI, Backend, Automação |
| Papéis equipe | Admin / gestor / educador | Admin Sistema, Admin Programa, **Gestor Unidade**, **Gestor Turma** |
| Participante | “Beneficiada” | **Lead** + **Empreendedora** + vínculo a **empreendimento** |
| Canais | WhatsApp + e-mail + Google (genérico) | Gupshup (individual), SendGrid, YouTube; grupos **manuais**; jornada online específica |
| Domínio | Pessoa + programa/turma | Programa → **Edição** → Unidade → Turma + **Empreendimento** + regras de propriedade compartilhada |

Documento de referência do “projeto atual”: Casos de Uso v7 (~3.000 linhas).

---

## 4. Medição de aumento de tamanho

Medições **objetivas** (volume documental) e **estimativas** (superfície funcional). Não substituem orçamento em horas; servem para **ordem de grandeza** na mesa comercial.

### 4.1 Volume documental

| Métrica | Escopo original | Casos de Uso v7 | Fator |
| ------- | --------------- | --------------- | ----- |
| Linhas | 109 | 3.005 | **≈ 27,6×** |
| Palavras | ≈ 813 | ≈ 16.857 | **≈ 20,7×** |
| Caracteres | ≈ 5.822 | ≈ 134.394 | **≈ 23,1×** |
| Estrutura | 6 blocos + técnico | **79 UCs ativos** (UC1–UC83, exceto incorporados) | — |

> Interpretação: o original é um **RFP curto**. A v6 é **especificação operacional**. O fator 20–28× mede **profundidade documental**, não horas 1:1 — mas sinaliza que o nível de detalhe exigido nas reuniões extrapolou largamente o texto contratado como “lista de funcionalidades”.

### 4.2 Superfície funcional (baseline × ampliado)

Contagem de **requisitos discretos** no original (§3.1–3.2): **≈ 36 itens** enumeráveis (cadastro, frequência, videoaula, WhatsApp, chat, financeiros, inscrição, KPIs, permissões, cloud, LGPD, 2FA, pentest etc.).

Na v6: **79 casos de uso ativos**. Relação bruta **≈ 2,2 UCs por item original** — porém vários UCs cobrem temas **inteiramente novos** (não desdobramento do original).

Separação comercial sugerida:

| Categoria | Estimativa | Base |
| --------- | ---------- | ---- |
| **A — Cobertura do baseline** (original atendido, ainda que com outra solução) | ~35–45% do esforço de produto v6 | Cadastro, presença, videoaula, WhatsApp individual, financeiros, inscrição, turmas/vagas, relatórios, permissões, cloud, LGPD “de conformidade” |
| **B — Ampliação pedida nas reuniões / ausente no original** | ~55–65% do esforço de produto v6 | Pacotes da §5 |

**Fator comercial de referência (síntese):**

| Indicador | Valor sugerido para negociação |
| --------- | ------------------------------ |
| Aumento de volume documental | **20× a 28×** |
| Aumento de superfície (itens → UCs) | **≈ 2,2×** bruto; **≈ 3× a 4×** se ponderado pela complexidade dos pacotes B (jornada Zap, seleção, empreendimento, LGPD operacional) |
| Esforço relativo ampliação (B) vs baseline (A) | Ampliação **maior** que o baseline (**≈ 1,5× a 2×** o esforço do que estava escrito) |

> Faixas são **ordem de grandeza** para aditivo. Recomenda-se fechar números finais com estimativa de sprint/horas por pacote (§5).

### 4.3 Complexidade relativa por pacote (peso)

Pesos relativos (soma ≈ 100) apenas sobre a **fatia de ampliação (B)** — o que **não** estava explícito no original:

| # | Pacote negociável | Peso relativo | Impacto comercial |
| - | ----------------- | ------------- | ----------------- |
| P1 | Modelo operacional (edição, unidade, papéis Unidade/Turma, CMS) | 12 | Alto — base de tudo |
| P2 | Inscrição avançada (lead, ficha 4 blocos, aceites, elegibilidade) | 10 | Alto |
| P3 | Seleção operacional (score, qualificado, lotes, comunicação manual) | 10 | Alto |
| P4 | Empreendimento coletivo + propriedade de registros + BI duplo | 14 | **Muito alto** |
| P5 | Jornada WhatsApp online (OK, temporizador, lote, vídeo WA, templates) | 18 | **Muito alto** |
| P6 | Presença automatizada (QR/UUID/deep link) + operação presencial extra | 8 | Médio-alto |
| P7 | Doação, certificação/beneficiamento parametrizados, certificado cascata | 8 | Médio-alto |
| P8 | LGPD operacional (anonimização, consentimentos, revalidação) | 8 | Médio-alto |
| P9 | Relatos, freeze de edição, observações, desligamento pela participante | 6 | Médio |
| P10 | Backlog Fase 3 nascido das reuniões (pós-programa, multi-unidade, chat IA, mentoria…) | 6 | Médio (pode ser fase posterior) |

---

## 5. Catálogo de ampliações (não estavam no original)

Cada linha: **pedido/consolidado nas reuniões ou na v6** · **ausência no original** · **onde aparece hoje** · **pacote**.

### P1 — Modelo operacional e papéis

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Hierarquia Programa → **Edição** → Unidade → Turma | Original fala em “programas”, “grupos e turmas” — **não** em edição/competência nem unidade regional | UC7, UC9, UC16, UC66 | P1 |
| **Gestor de Unidade** vs **Gestor de Turma** (regras exclusivas) | Original: “administradores, gestores e educadores” — sem matriz de responsabilidades | Atores; UC17, UC18, UC24, UC57 | P1 |
| CMS de Administração + App Gestor + App Cliente + BI + Backend + Automação | Original não nomeia camadas nem CMS | Plataformas do Sistema | P1 |
| Organizações patrocinadoras/parceiras (CNPJ) | Ausente | UC10, UC11 | P1 |
| Modalidade **híbrido** (além de presencial/online citados na apresentação) | Apresentação menciona aulas presenciais e online; **não** exige modalidade configurável por edição | UC7, UC9 | P1 |

### P2 — Inscrição e elegibilidade

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Pré-cadastro (**lead**) separado da inscrição completa | Original: formulário de inscrição — um passo | UC19, UC21, UC26 | P2 |
| Ficha unificada em **4 blocos**; nome social; “prefiro não informar” | Original lista campos básicos — sem modelo Empreender / dados sensíveis estruturados | UC21, UC20 | P2 |
| Aceites obrigatórios além de privacidade/imagem (cookies, WhatsApp, regulamento) | Original: privacidade e uso de imagem | UC20 | P2 |
| Elegibilidade automática (idade ≥18 como **filtro**; não CLT/cargo público; régua) | Original não define critérios de seleção | UC12, UC23 | P2 |
| Disponibilidade e preferência manhã/tarde no formulário | Ausente | UC21, UC24 | P2 |
| CNPJ obrigatório se MEI/ME | Ausente | UC21 | P2 |
| Alocação automática se unidade/turma única | Ausente | UC17, UC21 | P2 |
| Login da beneficiada **somente link mágico** (sem senha) | Original implica “acesso”; não define link mágico | UC4, UC54 | P2 |

### P3 — Seleção

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Status **qualificado / não qualificado / em análise** | Original: “selecionadas” e “confirmações” — sem workflow | UC24 | P3 |
| **Qualificar em lote** ≠ **alocar em lote** ≠ **comunicar aprovação** | Ausente; comunicação era implícita | UC24, UC25 | P3 |
| Score de vulnerabilidade + critérios editáveis no CMS | Ausente | UC12, UC23, UC24 | P3 |
| Qualificação no **empreendimento** (quando coletivo) | Ausente | UC24, UC31 | P3 |

### P4 — Empreendimento coletivo (domínio novo)

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Entidade **empreendimento** com N sócias na mesma edição | Original é centrado na **pessoa** beneficiada | UC31, UC32 | P4 |
| Presença: 1 sócio presente = presença do **negócio** | Original: frequência da pessoa | UC40, UC13 | P4 |
| Faturamento **1 por competência/empreendimento** | Original: preenchimento pela empreendedora (pessoa) | UC45 | P4 |
| Planos (marketing) e **plano de ação** compartilhados (ambos editam) | Ausente | UC15, UC31 | P4 |
| Questionários **individuais**; demais obrigações no negócio | Original não distingue | UC39, UC31 | P4 |
| Beneficiamento ~50% / certificação ~75% **no empreendimento**; certificado para **todas** as sócias | Original: “concluíram todas as atividades” (pessoa) | UC13, UC55 | P4 |
| BI: contar **pessoas e empreendimentos** | Original: métricas de pessoas | UC71, UC59 | P4 |

### P5 — Jornada WhatsApp (programas online / Empreende no Zap)

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Liberação por **temporizador** independente de conclusão | Original: trilha ou aleatório; lembretes — **sem** essa regra | UC33 | P5 |
| Envio somente após **“OK”**; lote de todas liberadas pendentes | Ausente | UC33, UC51 | P5 |
| Templates de jornada (pré-inscrição, aprovação+OK, boas-vindas, comunidade, próximo conteúdo) | Original: “programar mensagens” genérico | UC88, UC19, UC25, UC33 | P5 |
| Videoaula: YouTube **e** arquivo compatível WhatsApp; checkbox ON/OFF na edição | Original: armazenar videoaulas no sistema; WhatsApp com “aulas” — sem dual publish nem flag | UC9, UC15, UC51 | P5 |
| Grupos WhatsApp via **facilitador manual** (dois níveis) | Original pedia envio **em grupo** (automático implícito) — solução atual é **mais restrita** tecnicamente, mas o **desenho operacional** (dois níveis, clipboard) é novo | UC50, UC16 | P5* |

\*P5 inclui desenho operacional de grupos; o original pedia grupo, porém **não** o facilitador nem a política de custo/Meta.

### P6 — Presença e operação de turma

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| UUID de dispositivo + localStorage + deep links | Ausente | UC67 | P6 |
| Presença automática por QR / deep link | Original: “registro de frequência” — sem automação | UC40 | P6 |
| Prazo 48h / prazo na liberação; aula presencial **extra** | Ausente | UC34, UC35 | P6 |
| Retificação de dados financeiros após aprovação | Ausente | UC44 | P6 |

### P7 — Doação e certificação

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Fluxo de **doação** (solicita turma / aprova unidade); status “recebeu doação” | **Ausente** no original | UC14, UC57 | P7 |
| Critérios textuais/parametrizados de contemplação | Ausente | UC14 | P7 |
| Emissão automática de certificado + cascata aos sócios | Original mede “concluíram”; **não** pede certificado digital automático | UC55 | P7 |

### P8 — LGPD operacional (além de “conformidade”)

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Anonimização **5 anos após o aceite** com revalidação ao voltar a usar | Original: “conformidade LGPD” — sem regra operacional | UC76 | P8 |
| Anonimização de CPF de **não aprovadas** (1 dia após seleção) | Ausente | UC76, UC24 | P8 |
| Base de consentimentos versionada (tipo, versão, data, dispositivo) | Original cita aceites na inscrição — sem base operacional | UC20, UC76 | P8 |
| CPF apenas como hash (HMAC); consulta legado por hash | Ausente | UC62, UC76 | P8 |

### P9 — Operação e encerramento (pedidos de reunião)

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Relato de oficina/atividade + export de presença | Ausente | UC80 | P9 |
| Encerrar edição (**freeze** operacional → só BI) | Ausente | UC81 | P9 |
| Observação de acompanhamento | Ausente | UC77 | P9 |
| Desligamento solicitado pela empreendedora (questionário + motivo) | Ausente | UC79 | P9 |

### P10 — Fase 3 / pós-MVP nascido do levantamento

| Ampliação | Por que não está no original | Referência v6 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Pesquisa pós-programa (~5 anos, edições finalizadas) | Ausente | UC82 | P10 |
| Visão **multi-unidade** no app gestor | Ausente | UC83 | P10 |
| Chat de dúvidas (IA) | Original pede “chat”; a **solução IA** e o adiamento são do projeto — negociar se chat humano/simplificado cobre o baseline | UC64 | P10 / baseline parcial |
| Mentoria / voluntário; capital semente; calendário participante; consumo WhatsApp; logística avançada de visita | Ausentes ou parciais no original | UC70, UC73, UC58, UC68, UC65, UC78† | P10 |

† **UC78**: agendamento 1 a 1 + calendário (Visita Técnica) entra no núcleo operacional da atividade; em P10 fica a **logística** (proximidade / agrupamento de localidades) e sync Google Calendar.

---

## 6. O que do original permanece como cobertura (sem ser “aditivo”)

Para evitar contestar o baseline na mesa: estes pedidos **estavam no original** e continuam no projeto (ainda que implementados de outra forma):

- Cadastro e atualização de participantes  
- Frequência / presença  
- Histórico de participação  
- Videoaulas com algum controle de progresso  
- Mensagens individuais WhatsApp e lembretes  
- Upload de materiais/tarefas e dados financeiros mensais  
- Formulários de indicadores / avaliação  
- Inscrição online com aceites  
- Organização em turmas, vagas e seleção  
- Relatórios, dashboard, NPS  
- Perfis de equipe e acesso da beneficiada  
- Cloud, responsivo, integração WhatsApp/e-mail, LGPD de princípio  

**Substituições** (não aumentam escopo — mudam solução): vídeos no YouTube (em vez de hospedar no sistema); lives só YouTube (sem Google Meet); grupos WhatsApp manuais; confirmação de exercícios via aprovação do gestor (não automática). Esses pontos podem entrar em **contrapartida** de negociação, não como aditivo da contratada.

---

## 7. Como usar na negociação

1. **Baseline contratado** = texto do `escopo_original_cliente.txt` (± o que o contrato de 08.05.2026 já tiver fixado).  
2. **Aditivo** = pacotes **P1–P9** (e P10 se for fase seguinte), com pesos da §4.3.  
3. Sugerir fechamento por **pacote** (não por UC isolado), com estimativa de esforço da equipe técnica sobre os pesos.  
4. Prioridade típica para edições 2027 (alinhada ao MVP v6): **P1 → P2 → P3 → P5 → P4 → P7 → P8 → P6 → P9**; P10 em fase posterior.  
5. Manter este documento **comercial**; detalhes de regra ficam na v6 / ADR — aqui basta a **prova de ausência no original** + **tamanho**.

### Proposta de redação comercial (modelo)

> O escopo escrito pelo Consulado descrevia módulos de gestão de beneficiadas, conteúdos, inscrição, relatórios e permissões (~36 requisitos). O levantamento (abr.–jul./2026) e a especificação v6 consolidaram um produto multiplataforma com 79 casos de uso, dos quais a maior parte detalha ou introduz capacidades **não explícitas** no documento original — notadamente jornada WhatsApp com confirmação “OK”, empreendimento coletivo, seleção operacional, doação/certificação parametrizada e LGPD operacional. Em volume documental a especificação cresceu cerca de **20 a 28 vezes**; em superfície funcional ponderada estima-se **cerca de 3 a 4 vezes** o baseline. Propõe-se aditivo cobrindo os pacotes P1–P9 (MVP) e, se aplicável, P10 (evolução).

---

## 8. Fontes

| Fonte | Uso |
| ----- | --- |
| [escopo_original_cliente.txt](escopo_original_cliente.txt) | **Baseline** — único critério de “estava / não estava” |
| [Casos de Uso v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) | O que o projeto se tornou |
| Reuniões abr.–jul./2026 (`reunioes/`) | Origem das solicitações detalhadas |
| [fora_escopo_v0.md](fora_escopo_v0.md) | Histórico técnico (corte/substituição) — **enfoque diferente** |

---

*Documento para negociação comercial — ago/2026. Atualizar números da §4 se houver v7 ou reestimativa formal de esforço.*
