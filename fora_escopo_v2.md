# Ampliação de escopo — Base para negociação comercial (v2)

| Campo | Valor |
| ----- | ----- |
| **Finalidade** | Documento de **suporte à negociação comercial** (aditivo de escopo / reequilíbrio) |
| **Público** | Comercial, direção e produto (contratante × contratada) |
| **Não é** | ADR técnico, backlog de corte de entrega nem especificação de implementação |
| **Baseline (o que foi pedido por escrito)** | [escopo_original_cliente.txt](escopo_original_cliente.txt) |
| **O que o projeto se tornou** | [Casos de Uso — Consulado da Mulher v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) |
| **Versão** | v2 (alinhada à v7 — ago/2026) |
| **Antecessor comercial** | [fora_escopo_v1.md](fora_escopo_v1.md) |
| **Antecessor técnico** | [fora_escopo_v0.md](fora_escopo_v0.md) |

> **Nota sobre priorização de entrega:** a v7 **não classifica** casos de uso em MVP/Fase 2 — é especificação canônica única. Este documento comercial **pode** agrupar pacotes em fases de contrato; isso é decisão de negociação, não está na v7.

---

## 1. Objetivo deste documento

O [escopo original do cliente](escopo_original_cliente.txt) descreve, em linguagem de RFP, **módulos e necessidades** de um sistema de gestão de programas sociais. Nas **reuniões de levantamento** (abr.–ago./2026) e na consolidação até a **v7**, o Consulado detalhou regras operacionais, papéis, jornada WhatsApp, seleção em etapas, empreendimento coletivo, doação por modalidade, comunicação unificada (templates + alertas), LGPD operacional e indicadores que **não estavam escritos de forma explícita** no RFP.

Este arquivo:

1. **Congela o baseline** = somente o que o texto original pede de forma explícita.
2. **Lista ampliações** consolidadas na v7 e **ausentes** no baseline.
3. Oferece **medição de aumento de tamanho** (documental e funcional) para embasar aditivo.
4. Agrupa as ampliações em **pacotes negociáveis** (não em decisões técnicas de arquitetura).

> **Regra de rigor:** item só entra como “ampliação negociável” se **não houver menção explícita** no `escopo_original_cliente.txt`. Menções genéricas (“WhatsApp”, “turmas”, “LGPD”, “relatórios”) **não** cobrem fluxos específicos (ex.: jornada “OK” + lote; entrevista de seleção P/H; empreendimento coletivo; funil online de doação).

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
- **Pré-inscrita (lead)** vs empreendedora; ficha unificada em 4 blocos; score de vulnerabilidade; status “qualificado / em análise / não qualificado”; **Comunicar aprovação (UC25) como gatilho que inicia a jornada** (online → UC33; P/H → convite ao grupo); seleção em **3 etapas** (classificar → entrevista P/H → alocar turma); remanejo unidade/turma
- Entidade **empreendimento** (negócio coletivo), presença/faturamento/planos no negócio, certificado em cascata, BI pessoas + empreendimentos
- Jornada WhatsApp com **temporizador**, confirmação **“OK”**, envio em **lote**, vídeo arquivo WhatsApp + YouTube, **pacotes de templates** (UC88) e **alertas automáticos** (UC87)
- Autenticação da beneficiada **somente por link mágico**; UUID/dispositivo; presença por QR/deep link
- **Doação** por modalidade (P/H manual vs funil online UC38); critérios A–D; pós-liberação PIX/recibo/NF (UC86); orçamento por unidade; doação em massa
- Beneficiamento/certificação parametrizados (~50% / ~75% por edição)
- **Plano de ação / planejamento estratégico**; relatos de oficina; encerrar edição (freeze); pesquisa pós-programa; mentorias; multi-unidade
- Organizações patrocinadoras; CMS + app gestor + app cliente + BI + backend como **cinco grupos** nomeados (alertas no Backend, sem motor externo de marketing)
- Operacionalização LGPD (anonimização em 5 anos com revalidação; base de consentimentos versionada; CPF em hash)

---

## 3. O que o projeto se tornou (v7)

Após reuniões e consolidação na **v7**, o projeto deixou de ser um “sistema monolítico de gestão” descrito em ~1 página de requisitos e passou a ser um **produto multiplataforma**:

| Dimensão | Baseline (original) | Situação atual (v7) |
| -------- | ------------------- | ------------------- |
| Forma do requisito | Lista de módulos em prosa | **85 casos de uso ativos** detalhados (lacunas 8, 47, 48 — UCs obsoletos removidos) |
| Plataformas | Implícitas (“o sistema”) | **5 grupos**: CMS, App Gestor, App Cliente, BI, Backend (fila jornada UC33 + fila alertas UC87/UC52) |
| Papéis equipe | Admin / gestor / educador | Admin Sistema, Admin Programa, **Gestor Unidade**, **Gestor Turma** |
| Participante | “Beneficiada” | **Lead** + **Empreendedora** + vínculo a **empreendimento** |
| Canais | WhatsApp + e-mail + Google (genérico) | Gupshup, SendGrid, YouTube; grupos **manuais** (UC50); jornada online (UC33); templates centralizados (UC88) |
| Domínio | Pessoa + programa/turma | Programa → **Edição** → Unidade → Turma + **Empreendimento** + doação por modalidade |
| Comunicação | “Programar mensagens” | **Pacotes** Meta/Gupshup (UC88) + **alertas tipados** (UC87) — área CMS unificada |

Documento de referência: [Casos de Uso v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) (~3.570 linhas). Pendências de especificação (ex.: saúde financeira UC45) estão na v7 e em [fora_escopo_v1](fora_escopo_v1.md) § temas abertos — não alteram o baseline.

---

## 4. Medição de aumento de tamanho

Medições **objetivas** (volume documental) e **estimativas** (superfície funcional). Não substituem orçamento em horas; servem para **ordem de grandeza** na mesa comercial.

### 4.1 Volume documental

| Métrica | Escopo original | Casos de Uso v7 | Fator |
| ------- | --------------- | --------------- | ----- |
| Linhas | 109 | 3.571 | **≈ 32,8×** |
| Palavras | ≈ 813 | ≈ 27.596 | **≈ 34,0×** |
| Caracteres | ≈ 5.822 | ≈ 230.444 | **≈ 39,6×** |
| Estrutura | 6 blocos + técnico | **85 UCs ativos** (UC1–UC7, UC9–UC46, UC49–UC88) | — |

> Interpretação: o original é um **RFP curto**. A v7 é **especificação operacional canônica**. O fator ~33–40× mede **profundidade documental**, não horas 1:1.

### 4.2 Superfície funcional (baseline × ampliado)

Contagem de **requisitos discretos** no original: **≈ 36 itens** enumeráveis.

Na v7: **85 casos de uso ativos**. Relação bruta **≈ 2,4 UCs por item original** — vários UCs cobrem temas **inteiramente novos**.

| Categoria | Estimativa | Base |
| --------- | ---------- | ---- |
| **A — Cobertura do baseline** | ~30–40% do esforço de produto v7 | Cadastro, presença, videoaula, WhatsApp individual, financeiros, inscrição, turmas, relatórios, permissões, cloud, LGPD “de conformidade”, chat (UC64 cobre pedido genérico de chat) |
| **B — Ampliação ausente no original** | ~60–70% do esforço de produto v7 | Pacotes §5 |

**Fator comercial de referência:**

| Indicador | Valor sugerido para negociação |
| --------- | ------------------------------ |
| Aumento de volume documental | **≈ 33× a 40×** (v7 vs RFP) |
| Aumento de superfície (itens → UCs) | **≈ 2,4×** bruto; **≈ 3,5× a 4,5×** ponderado (jornada, seleção 3 etapas, empreendimento, doação, comunicação UC88/UC87) |
| Esforço relativo ampliação (B) vs baseline (A) | Ampliação **maior** que o baseline (**≈ 1,5× a 2×**) |

### 4.3 Complexidade relativa por pacote (peso)

Pesos relativos (soma = 100) sobre a **fatia de ampliação (B)** — recalibrados na v2 vs v1:

| # | Pacote negociável | Peso | Δ vs v1 | Impacto |
| - | ----------------- | ---- | ------- | ------- |
| P1 | Modelo operacional (edição, unidade, papéis, CMS, 5 grupos) | 10 | −2 | Alto |
| P2 | Inscrição avançada (lead, ficha 4 blocos, aceites, elegibilidade) | 9 | −1 | Alto |
| P3 | Seleção operacional (score, **entrevista P/H UC84**, UC25 gatilho) | 12 | +2 | **Muito alto** |
| P4 | Empreendimento coletivo + propriedade + BI duplo | 12 | −2 | **Muito alto** |
| P5 | Jornada WhatsApp + **templates UC88** + **alertas UC87** | 20 | +2 | **Muito alto** |
| P6 | Presença automatizada (QR/UUID) + **conteúdo extra** (UC35) | 7 | −1 | Médio-alto |
| P7 | Doação (**funil UC38**, UC57, **UC85 lote**, **UC86 pós-liberação**, orçamento) | 14 | +6 | **Muito alto** |
| P8 | LGPD operacional | 7 | −1 | Médio-alto |
| P9 | Relatos, freeze, observações, desligamento | 5 | −1 | Médio |
| P10 | Evoluções ainda abertas ou parciais (ver §5) | 4 | −2 | Baixo-médio |

---

## 5. Catálogo de ampliações (não estavam no original)

Cada linha: **consolidado na v7** · **ausência no original** · **referência v7** · **pacote**.

### P1 — Modelo operacional e papéis

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Hierarquia Programa → **Edição** → Unidade → Turma | “Programas”, “grupos e turmas” — sem edição/competência nem unidade | UC7, UC9, UC16, UC66 | P1 |
| **Gestor de Unidade** vs **Gestor de Turma** | “Admin, gestores, educadores” — sem matriz | Atores; UC17, UC18, UC24, UC57 | P1 |
| **5 grupos**: CMS + Gestor + Cliente + BI + Backend | Original não nomeia camadas | Plataformas v7 | P1 |
| Organizações patrocinadoras/parceiras (CNPJ) | Ausente | UC10, UC11 | P1 |
| Modalidade **híbrido** + duração Longa/Média/Curta (BI) | Presencial/online citados; sem configuração por edição | UC7, UC9 | P1 |
| Duração programa → agrupamento BI | Ausente | UC7, UC59 | P1 |

### P2 — Inscrição e elegibilidade

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Pré-cadastro (**lead**) separado da inscrição completa | Formulário único | UC19, UC21, UC26 | P2 |
| Ficha unificada **4 blocos**; nome social; “prefiro não informar” | Campos básicos apenas | UC21, UC20 | P2 |
| Aceites (cookies, WhatsApp, regulamento, sensíveis…) | Privacidade e imagem | UC20 | P2 |
| Bloqueio cadastro × régua pontuável (6 critérios) | Sem critérios de seleção | UC12, UC23 | P2 |
| Disponibilidade P/H; preferência manhã/tarde | Ausente | UC21, UC24 | P2 |
| CNPJ obrigatório se MEI/ME | Ausente | UC21 | P2 |
| Alocação automática unidade/turma única | Ausente | UC17, UC21 | P2 |
| Login **somente link mágico** (Cliente e Gestor) | “Acesso” genérico | UC3, UC4, UC54 | P2 |

### P3 — Seleção (3 etapas)

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Status **qualificado / em análise / não qualificado** | “Selecionadas” sem workflow | UC24 | P3 |
| **Entrevista de seleção P/H** (etapa 2) | Ausente | UC84 | P3 |
| **Alocar turma** (etapa 3) separado de classificar | Ausente | UC17 | P3 |
| **Comunicar (UC25)** = gatilho jornada + três faixas | Comunicação implícita | UC25 | P3 |
| Score X/Y + critérios CMS | Ausente | UC12, UC23, UC24 | P3 |
| Qualificação no **empreendimento** (coletivo) | Ausente | UC24, UC31 | P3 |
| Ausente na entrevista → não aprovada (auto) | Ausente | UC84, UC25 | P3 |

### P4 — Empreendimento coletivo

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Entidade **empreendimento**; agrupamento manual (sem merge por nome) | Centrado na pessoa | UC31, UC32 | P4 |
| Presença: 1 sócio = presença do negócio | Frequência da pessoa | UC40, UC13 | P4 |
| Faturamento 1/competência/empreendimento | Pessoa | UC45 | P4 |
| Planos + **plano de ação** compartilhados | Ausente | UC15, UC31 | P4 |
| Questionários individuais; demais no negócio | Ausente | UC39, UC31 | P4 |
| Beneficiamento/certificação no empreendimento; certificado cascata | “Concluíram” (pessoa) | UC13, UC55 | P4 |
| BI: N pessoas / 1 empreendimento / 1 doação | Métricas de pessoas | UC71, UC59 | P4 |

### P5 — Comunicação, jornada WhatsApp e alertas

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Liberação por **temporizador** (pós-UC25) | Trilha/lembretes genéricos | UC33 | P5 |
| Envio após **“OK”**; lote de liberadas pendentes | Ausente | UC33, UC51 | P5 |
| **Pacotes de comunicação** (1 template/tipo; Aula presencial+ao_vivo) | “Programar mensagens” | UC88, UC9 | P5 |
| **Alertas automáticos** tipados (inscrição incompleta, risco, prazo…) | Ausente; sem Mautic | UC87, UC52 | P5 |
| Janela comercial WhatsApp + retry 48h | Ausente | Conceitos v7; UC33 | P5 |
| Videoaula YouTube + arquivo WhatsApp; checkbox edição | Hospedar no sistema | UC9, UC15, UC51 | P5 |
| Grupos via **facilitador manual** (dois níveis) | Grupo automático implícito | UC50, UC16 | P5 |
| Override corpo template (Gestor Unidade) antes UC50 P/H | Ausente | UC88, UC50 | P5 |

### P6 — Presença e operação de turma

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| UUID + localStorage + deep links | Ausente | UC67 | P6 |
| Presença QR / deep link | “Frequência” manual | UC40 | P6 |
| Liberação por módulo; prazo na liberação | Ausente | UC34 | P6 |
| **Conteúdo extra** presencial (não conta %/carga) | Ausente | UC35 | P6 |
| **Aula** unificada (natureza CMS; data/link na liberação) | Aula presencial vs ao vivo separados | UC15, UC34 | P6 |
| Retificação financeira pós-aprovação (**Revisar**) | Ausente | UC44 | P6 |

### P7 — Doação, certificação e pós-liberação

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| **Doação** P/H manual vs **funil online** (100% → live → KW → quiz) | **Ausente** | UC57, UC38 | P7 |
| Critérios elegibilidade A–D + **lote auxiliar** | Ausente | UC14, UC85 | P7 |
| **Orçamento por unidade** (CMS); doação em massa; itens 1:N | Ausente | UC9, UC57 | P7 |
| **PIX, recibo, NF 1:N, aceites** pós-liberação | Ausente | UC86 | P7 |
| Aprovar doação: digitar **APROVAR**; Turma sugere / Unidade aprova | Ausente | UC57 | P7 |
| Certificado automático + cascata sócias | Sem certificado digital | UC55, UC63 | P7 |
| Beneficiamento/certificação % por edição | “Concluíram” | UC13 | P7 |

### P8 — LGPD operacional

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Anonimização **5 anos** + revalidação | “Conformidade LGPD” | UC76 | P8 |
| Base de **consentimentos** versionada | Aceites na inscrição | UC20, UC76 | P8 |
| CPF **HMAC**; legado por hash | Ausente | UC62, UC76 | P8 |

### P9 — Operação e encerramento

| Ampliação | Por que não está no original | Referência v7 | Pacote |
| --------- | ---------------------------- | ------------- | ------ |
| Relato oficina + export presença | Ausente | UC80 | P9 |
| Encerrar edição (**freeze** → BI) | Ausente | UC81 | P9 |
| Observação de acompanhamento | Ausente | UC77 | P9 |
| Desligamento pela empreendedora | Ausente | UC79 | P9 |

### P10 — Evoluções / pendências (negociar separadamente)

Itens **especificados na v7** mas com detalhe incompleto, ou **fora** do núcleo operacional imediato:

| Item | Situação na v7 | Referência v7 | Pacote |
| ---- | -------------- | ------------- | ------ |
| **Saúde financeira** (Entradas/Saídas/dívidas) | Rascunho UC45 | UC45 | P10 |
| **Comunidade WhatsApp** (longo prazo) | Evolução; ≠ grupo turma | Conceitos v7 | P10 |
| **Logística visita** (proximidade/agrupamento) | Desejável; ≠ agendamento 1:1 | UC78† | P10 |
| Sync **Google Calendar** | Em avaliação | — | P10 |
| **Mentorias** detalhadas / abas CMS | UC70 especificado; operação aprofundar | UC70, UC73 | P10 |
| **Múltiplas KW** pós-live | Pendência v7 | UC38 | P10 |
| Metodologia renda Tier 1/2; investimento×dívida | Ver fora_escopo / reuniões | — | P10 |

† **UC78** (agendamento + calendário) está no **núcleo** da atividade — pode ser tratado em P6/P9 na negociação; P10 cobre só logística avançada.

**Itens que saíram de P10 vs v1** (agora em outros pacotes na v2): UC82 pós-programa, UC83 multi-unidade, UC64 chat IA, UC87 alertas, UC88 templates, UC84 entrevista, UC85/UC86 doação — **já contabilizados em P3/P5/P7/P9**.

---

## 6. O que do original permanece como cobertura (sem ser “aditivo”)

- Cadastro e atualização de participantes  
- Frequência / presença  
- Histórico de participação  
- Videoaulas com controle de progresso  
- Mensagens WhatsApp e lembretes  
- Materiais/tarefas e dados financeiros mensais  
- Formulários de indicadores / NPS  
- Inscrição online com aceites  
- Turmas, vagas e seleção (forma genérica)  
- Relatórios e dashboard  
- Perfis de equipe e acesso da beneficiada  
- Cloud, responsivo, integrações, LGPD de princípio  
- **Chat para dúvidas** — baseline atendido por UC64 (Agente de IA); negociar se IA excede o pedido genérico de “chat”

**Substituições** (mudam solução, não aumentam escopo): YouTube vs hospedagem; lives YouTube vs Meet; grupos manuais; aprovação gestor vs confirmação automática.

---

## 7. Como usar na negociação

1. **Baseline contratado** = `escopo_original_cliente.txt` (± contrato 08.05.2026).  
2. **Aditivo** = pacotes **P1–P9** (P10 = evoluções/pendências), pesos §4.3.  
3. Fechar por **pacote**, não por UC isolado.  
4. **Ordem sugerida de implementação** (negociação — não está na v7): P1 → P2 → P3 → P5 → P4 → P7 → P8 → P6 → P9; P10 conforme contrato.  
5. Detalhes de regra = **v7** + ADR + protótipos; aqui = **ausência no original** + **tamanho**.

### Proposta de redação comercial (modelo v2)

> O escopo escrito pelo Consulado descrevia módulos de gestão (~36 requisitos em prosa). O levantamento e a especificação **v7** consolidaram um produto multiplataforma com **85 casos de uso**, em **cinco grupos** (CMS, Gestor, Cliente, BI, Backend). A maior parte introduz capacidades **não explícitas** no RFP — jornada WhatsApp com “OK” e lote, **seleção em 3 etapas** (incl. entrevista P/H), empreendimento coletivo, **pacotes de comunicação e alertas** (UC88/UC87), doação por modalidade com funil online e pós-liberação (PIX/recibo), e LGPD operacional. Em volume documental a especificação cresceu **cerca de 33 a 40 vezes**; em superfície funcional ponderada, **cerca de 3,5 a 4,5 vezes** o baseline. Propõe-se aditivo pelos pacotes **P1–P9**; **P10** para evoluções acordadas à parte.

---

## 8. Fontes

| Fonte | Uso |
| ----- | --- |
| [escopo_original_cliente.txt](escopo_original_cliente.txt) | Baseline |
| [Casos de Uso v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) | Especificação canônica |
| [fora_escopo_v1.md](fora_escopo_v1.md) | Versão comercial anterior |
| [reunioes/](reunioes/) | Origem das solicitações |
| [fora_escopo_v0.md](fora_escopo_v0.md) | Histórico técnico |

---

## Anexo A — Checklist de diffs (v1 → v2)

Use para revisão rápida ou auditoria comercial.

### Cabeçalho e métricas

| # | Tópico | v1 | v2 |
| - | ------ | -- | -- |
| 1 | UCs ativos | 79 (+3 incorporados) | **85** (sem 8/47/48) |
| 2 | Faixa UC | UC1–UC83 | UC1–UC88 (lacunas) |
| 3 | Linhas v7 | ~3.005 | **3.571** |
| 4 | Fator documental | 20–28× | **33–40×** |
| 5 | Plataformas | 6 (+ Automação) | **5 grupos** (alertas no Backend) |
| 6 | Referências internas | v6 misturado | **v7** consistente |
| 7 | MVP na spec | MVP v6 citado | v7 **sem** MVP; nota explícita §1 |

### Regras corrigidas

| # | Tópico | v1 | v2 |
| - | ------ | -- | -- |
| 8 | UC25 | “comunicar é informativo” (§2) | **Gatilho que inicia jornada** |
| 9 | UC35 | “aula presencial extra” | **Conteúdo extra** |
| 10 | Arquitetura alertas | Camada Automação | **UC87 + UC52** no Backend |

### Ampliações adicionadas ao catálogo

| # | UC / tema | Pacote v2 |
| - | --------- | --------- |
| 11 | UC84 Entrevista seleção P/H | P3 |
| 12 | UC38 Funil online doação | P7 |
| 13 | UC85 Lote elegíveis A–D | P7 |
| 14 | UC86 PIX/recibo/NF/aceites | P7 |
| 15 | UC87 Alertas automáticos | P5 |
| 16 | UC88 Pacotes templates | P5 |
| 17 | Orçamento por unidade / doação massa | P7 |
| 18 | Aula unificada CMS/liberação | P6 |
| 19 | Seleção 3 etapas explícita | P3 |

### P10 reclassificado

| # | Item | v1 | v2 |
| - | ---- | -- | -- |
| 20 | UC82 pós-programa | P10 | **P1/P9** (especificado) |
| 21 | UC83 multi-unidade | P10 | **P1** (especificado) |
| 22 | UC64 chat IA | P10 / baseline | **Baseline parcial** + P10 só se IA exceder |
| 23 | UC87/88 | Não catalogados / parcial | **P5** |
| 24 | P10 residual | Fase 3 genérica | **Pendências** (saúde financeira, comunidade WA, logística UC78, KW múltiplas) |

### Pesos §4.3 (soma 100)

| Pacote | v1 | v2 |
| ------ | -- | -- |
| P3 | 10 | **12** |
| P5 | 18 | **20** |
| P7 | 8 | **14** |
| P10 | 6 | **4** |
| Demais | ver §4.3 v1 | rebalanceados |

---

*Documento para negociação comercial — ago/2026 (v2 alinhada à Casos de Uso v7).*
