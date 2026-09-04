# Contagem IFPUG — Consulado da Mulher

**Método:** IFPUG CPM (Function Point Analysis) — **Unadjusted Function Points (UFP)**  
**Público:** comercial, direção e produto (com glossário para quem não é analista IFPUG).  
**Não é:** orçamento em reais, cronograma nem especificação de implementação.

---

## Para quem não é técnico — o que este documento mede

Imagine comparar **dois pedidos de software**:

1. **B0** — o que o cliente pediu por escrito no início (RFP curto).
2. **B1** — o que o sistema **realmente precisa fazer** depois do levantamento e da especificação canônica ([Casos de Uso v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md)).

A **contagem IFPUG** traduz cada “função do usuário” (cadastrar alguém, enviar WhatsApp, aprovar doação…) em **pontos de função (PF / UFP)**. Quanto mais rico o sistema, mais pontos. O **delta** (B1 − B0) mostra **quanto o escopo cresceu** em relação ao pedido original.

**Em uma frase:** _o RFP pedia ~448 pontos; o canônico v7 pede ~766 — crescimento de cerca de 71% em tamanho funcional estimado._

---

## Glossário (siglas e termos)

### Método e métricas

| Sigla / termo                        | Significado                              | Em linguagem simples                                                                                                     |
| ------------------------------------ | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **IFPUG**                            | International Function Point Users Group | Organização que padroniza como “medir o tamanho” de um software pelo que o usuário faz, não por linhas de código.        |
| **CPM**                              | Counting Practices Manual                | Manual oficial do IFPUG com as regras da contagem.                                                                       |
| **FPA**                              | Function Point Analysis                  | Análise por pontos de função — o método em si.                                                                           |
| **UFP**                              | Unadjusted Function Points               | Pontos de função **sem** ajuste por fatores de ambiente (só complexidade das funções). É o número usado neste documento. |
| **PF**                               | Pontos de função                         | Unidade de tamanho: cada função recebe um valor (ex.: 3, 4, 7, 10…).                                                     |
| **B0**                               | Baseline 0                               | Contagem do **pedido original** (`[escopo_original_cliente.txt](escopo_original_cliente.txt)`).                          |
| **B1**                               | Baseline 1                               | Contagem do **produto canônico** ([Casos de Uso v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md)).              |
| **Delta (Δ)**                        | Diferença B1 − B0                        | Quanto o escopo **aumentou** (em UFP).                                                                                   |
| **Growth**                           | Crescimento percentual                   | (Δ ÷ B0) × 100 — ex.: +71%.                                                                                              |
| **Baixa / Média / Alta (B / M / H)** | Complexidade da função                   | Quanto mais campos, arquivos e regras, maior a complexidade e o PF.                                                      |
| **SAME**                             | Mesma função nos dois baselines          | Existia no RFP e continua igual (mesmo PF).                                                                              |
| **EXPAND**                           | Função expandida                         | Já existia de forma genérica no RFP; no v7 ficou **mais rica** (mais PF).                                                |
| **NEW**                              | Função nova                              | **Não** estava no RFP; surgiu no levantamento / v7.                                                                      |

### Cinco tipos de função IFPUG

| Sigla   | Nome em inglês          | O que é                                                                | Exemplo no projeto                                         |
| ------- | ----------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------------- |
| **EI**  | External Input          | **Entrada** de dados pelo usuário ou sistema externo                   | Cadastrar empreendedora; liberar atividade; aprovar doação |
| **EO**  | External Output         | **Saída** com lógica / cálculo (relatório, mensagem montada)           | Relatório de frequência; disparo WhatsApp com regras       |
| **EQ**  | External Inquiry        | **Consulta** simples (busca / exibição sem cálculo pesado)             | Ver ficha; consultar histórico legado por CPF              |
| **ILF** | Internal Logical File   | **Arquivo lógico interno** — grupo de dados que o sistema mantém       | Empreendedora; Edição; Doação; Pacote de comunicação       |
| **EIF** | External Interface File | **Arquivo lógico externo** — dados de outro sistema que só consultamos | Templates/status no Gupshup; eventos no SendGrid           |

### Detalhes técnicos da complexidade (aparecem nas premissas)

| Sigla   | Significado          | Em linguagem simples                                     |
| ------- | -------------------- | -------------------------------------------------------- |
| **DET** | Data Element Type    | “Campo” ou pedaço de dado (nome, CPF, status…).          |
| **FTR** | File Type Referenced | Quantos “arquivos” (ILF/EIF) a transação toca.           |
| **RET** | Record Element Type  | Subgrupos dentro de um ILF (ex.: regra + binding + log). |

### Domínios desta planilha (`cat`)

| Código      | Domínio              | Em linguagem simples                                          |
| ----------- | -------------------- | ------------------------------------------------------------- |
| **DATA**    | Dados (ILF/EIF)      | Os “cadastros / arquivos” que o sistema guarda ou lê de fora. |
| **CMS**     | CMS de Administração | Configuração: programas, edições, módulos, templates.         |
| **INSCR**   | Inscrição            | Pré-cadastro, ficha, aceites, lead.                           |
| **SELECAO** | Seleção              | Classificar, entrevista, alocar turma, comunicar.             |
| **JORNADA** | Jornada educacional  | Liberar atividades, progresso, videoaula, presença.           |
| **COMMS**   | Comunicação          | WhatsApp, e-mail, filas, alertas, templates.                  |
| **DOACAO**  | Doação               | Sugerir/aprovar, funil online, PIX/recibo.                    |
| **BI_LGPD** | BI e LGPD            | Relatórios, painel de dados, anonimização, consentimentos.    |

### Siglas do produto / negócio

| Sigla / termo | Significado                                                                                                                                                        |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **RFP**       | _Request for Proposal_ — documento em que o cliente descreveu o que queria comprar/contratar (aqui: `[escopo_original_cliente.txt](escopo_original_cliente.txt)`). |
| **UC**        | Caso de uso (ex.: UC25 = comunicar resultado da seleção). Catálogo completo na [v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) (85 UCs ativos).         |
| **CMS**       | Sistema de administração (Strapi) — quem monta programa/edição.                                                                                                    |
| **BI**        | _Business Intelligence_ — painel de indicadores (Looker Studio).                                                                                                   |
| **LGPD**      | Lei Geral de Proteção de Dados.                                                                                                                                    |
| **P/H**       | Presencial / híbrido (mesma operação no sistema).                                                                                                                  |
| **WA**        | WhatsApp.                                                                                                                                                          |
| **API**       | Interface entre sistemas (ex.: envio automatizado via Gupshup).                                                                                                    |
| **PIX**       | Pagamento instantâneo brasileiro (dados bancários da doação).                                                                                                      |
| **NF**        | Nota fiscal (doação material).                                                                                                                                     |
| **NPS**       | _Net Promoter Score_ — pesquisa de satisfação.                                                                                                                     |
| **KW**        | _Keyword_ / palavra-chave (presença no funil online de encerramento).                                                                                              |
| **2FA**       | Autenticação em dois fatores (CMS).                                                                                                                                |
| **MVP**       | _Minimum Viable Product_ — recorte mínimo de entrega (decisão comercial; a v7 **não** classifica MVP).                                                             |
| **CR**        | _Change Request_ — pedido de mudança futura sobre o baseline.                                                                                                      |
| **CI/CD**     | Integração e entrega contínuas (infra de desenvolvimento — **fora** do UFP).                                                                                       |

### Sistemas externos citados

| Nome                     | Papel                                                                |
| ------------------------ | -------------------------------------------------------------------- |
| **Gupshup**              | Envio de WhatsApp Business (templates Meta).                         |
| **SendGrid**             | Envio de e-mail (link mágico, alertas).                              |
| **YouTube / StreamYard** | Vídeo e live **fora** da plataforma (só link no sistema).            |
| **Looker Studio**        | BI externo; dashboards nativos **não** entram no UFP.                |
| **Mautic**               | Antigo motor de marketing — **removido**; alertas = UC87 no Backend. |
| **Meta**                 | Empresa do WhatsApp — aprovação de templates.                        |

---

## Baselines e documentos relacionados

| Baseline | Fonte                                                                                           | Significado                                                          |
| -------- | ----------------------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **B0**   | `[escopo_original_cliente.txt](escopo_original_cliente.txt)`                                    | Pedido original (RFP)                                                |
| **B1**   | `[Casos de Uso — Consulado da Mulher v7](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md)` | Spec canônica (85 UCs; comunicação UC88/UC87; doação por modalidade) |

| Documento                                                      | Uso nesta contagem                                                                         |
| -------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `[fora_escopo_v2.md](fora_escopo_v2.md)`                       | Ampliações **comerciais** (pacotes P1–P10) alinhadas à v7 — complemento narrativo do delta |
| `[Acompanhamento_Gestor/](Acompanhamento_Gestor/)`             | Painel C-level (plano original × entrega MVP/Fase 2) — pode ligar IDs IFPUG aos itens      |
| `[Contagem_IFPUG_Consulado.csv](Contagem_IFPUG_Consulado.csv)` | Planilha detalhada (abrir no Excel) — **fonte dos totais UFP**                             |
| `[_gen_contagem_ifpug.py](_gen_contagem_ifpug.py)`             | Script para regenerar o CSV                                                                |
| `[reunioes/](reunioes/)`                                       | Histórico de decisões (não altera totais até regenerar CSV)                                |

---

## 1. Premissas da contagem

1. Contagem **estimada IFPUG**: complexidade **Baixa / Média / Alta** por julgamento de DET/FTR/RET típicos — **não** é auditoria campo a campo.
2. **Infraestrutura** (cloud, CI/CD, pen-test) **fora** do UFP de aplicação.
3. **Looker Studio / BI externo:** dashboards nativos = fora; **extração/API** e relatórios do sistema = EO/EQ.
4. **YouTube / StreamYard:** não EIF — só links/configuração na atividade.
5. **Gupshup e SendGrid:** **EIF** (templates/status) + EO/EI de envio.
6. **Mautic:** **não** entra em B1. Em B0, “programar mensagens” = funções de **alerta interno**, não EIF Mautic.
7. **EXPAND:** existia no RFP de forma genérica; o canônico **aumentou** DET/FTR (mesmo tema, mais PF em B1).
8. **NEW:** só no canônico (fora do plano original típico) — ver também `[fora_escopo_v2](fora_escopo_v2.md)`.
9. Valores IFPUG (UFP por tipo × complexidade):

| Tipo | Baixa | Média | Alta |
| ---- | ----- | ----- | ---- |
| EI   | 3     | 4     | 6    |
| EO   | 4     | 5     | 7    |
| EQ   | 3     | 4     | 6    |
| ILF  | 7     | 10    | 15   |
| EIF  | 5     | 7     | 10   |

---

## 2. Resultado executivo

| Métrica            | Valor    | Leitura para leigo                                |
| ------------------ | -------- | ------------------------------------------------- |
| **UFP B0 (RFP)**   | **448**  | Tamanho do pedido original                        |
| **UFP B1 (v7)**    | **766**  | Tamanho do produto especificado hoje              |
| **Delta absoluto** | **+318** | Pontos a mais que o RFP                           |
| **Growth**         | **+71%** | Quase três quartos a mais de superfície funcional |

Funções catalogadas: **124** (ver CSV).

> Os totais vêm do `[Contagem_IFPUG_Consulado.csv](Contagem_IFPUG_Consulado.csv)`. A coluna B1 reflete o canônico consolidado (hoje rotulado **v7**). Itens pós-v7 ainda **não** incorporados no CSV estão na §8 (estimativa informal).

### Delta por natureza

| Natureza                         | Efeito no delta (UFP) | Leitura                         |
| -------------------------------- | --------------------- | ------------------------------- |
| **NEW** (só B1)                  | **+234**              | Funções que o RFP **não** pedia |
| **EXPAND** (B0→B1 mais complexo) | **+84**               | Mesmo tema, mais rico           |
| **SAME**                         | 0                     | Igual nos dois baselines        |

### Delta por domínio

| Domínio (`cat`) | B0      | B1      | Δ        |
| --------------- | ------- | ------- | -------- |
| DATA (ILF/EIF)  | 218     | 345     | +127     |
| CMS             | 39      | 78      | +39      |
| INSCR           | 26      | 42      | +16      |
| SELECAO         | 34      | 57      | +23      |
| JORNADA         | 58      | 94      | +36      |
| COMMS           | 35      | 59      | +24      |
| DOACAO          | 6       | 40      | +34      |
| BI_LGPD         | 32      | 51      | +19      |
| **Total**       | **448** | **766** | **+318** |

---

## 3. Arquivos lógicos (ILF / EIF)

Resumo — detalhe no CSV (`cat=DATA`).

### ILF (internos)

| ID     | Nome                                 | B0       | B1       | Notas                                                                 |
| ------ | ------------------------------------ | -------- | -------- | --------------------------------------------------------------------- |
| ILF-01 | Colaborador / Perfil / Role          | M 10     | M 10     | RFP §F                                                                |
| ILF-02 | Programa (metodologia)               | M 10     | M 10     | RFP §D                                                                |
| ILF-03 | Edição                               | M 10     | **H 15** | EXPAND: % benef., risco, pacote UC88, orçamento por unidade, pós-live |
| ILF-04 | Unidade                              | B 7      | B 7      |                                                                       |
| ILF-05 | Turma                                | M 10     | M 10     | RFP grupos/turmas                                                     |
| ILF-06 | Módulo educacional                   | M 10     | M 10     |                                                                       |
| ILF-07 | Atividade (11 tipos + config)        | M 10     | **H 15** | EXPAND: matriz tipada UC15 (Aula unificada)                           |
| ILF-08 | Empreendedora / pessoa               | **H 15** | **H 15** | Cadastro rico já no RFP                                               |
| ILF-09 | Empreendimento (negócio)             | —        | **H 15** | **NEW** — entidade canônica                                           |
| ILF-10 | Inscrição / participação edição      | M 10     | **H 15** | EXPAND: score, status, vínculos                                       |
| ILF-11 | Lead / pré-inscrição                 | —        | M 10     | **NEW** mini CRM                                                      |
| ILF-12 | Aceite / consentimento LGPD          | M 10     | M 10     | RFP                                                                   |
| ILF-13 | Progresso atividade / liberação      | M 10     | **H 15** | EXPAND: liberada ≠ enviada ≠ concluída                                |
| ILF-14 | Presença / frequência                | M 10     | M 10     | RFP                                                                   |
| ILF-15 | Entrega / upload / aprovação         | M 10     | M 10     | RFP                                                                   |
| ILF-16 | Dados financeiros mensais            | M 10     | M 10     | RFP renda/fat/inv/poupança                                            |
| ILF-17 | Questionário / resposta / NPS        | M 10     | M 10     | RFP                                                                   |
| ILF-18 | Mensagem / disparo log               | M 10     | M 10     | WA/e-mail                                                             |
| ILF-19 | Template Meta / e-mail (pacote UC88) | B 7      | M 10     | EXPAND → catálogo de pacotes                                          |
| ILF-20 | AlertRule + Binding + DispatchLog    | —        | **H 15** | **NEW** UC87 (1 ILF lógico composto\*)                                |
| ILF-21 | Doação / recibo / PIX                | B 7†     | **H 15** | EXPAND+NEW funil / UC86                                               |
| ILF-22 | Mentoria                             | —        | M 10     | **NEW** UC70                                                          |
| ILF-23 | Observação acompanhamento            | —        | B 7      | **NEW**                                                               |
| ILF-24 | Certificado / beneficiamento         | B 7      | M 10     | EXPAND % edição                                                       |
| ILF-25 | Pesquisa pós-programa                | —        | M 10     | **NEW** UC82                                                          |
| ILF-26 | Organização / patrocinador           | —        | B 7      | **NEW** UC10/11                                                       |
| ILF-27 | Base legado (participações hash)     | B 7      | M 10     | EXPAND consulta hash                                                  |
| ILF-28 | Magic link / sessão token            | B 7      | M 10     | EXPAND deep link                                                      |
| ILF-29 | Fila jornada (eventos OK/lote)       | —        | M 10     | **NEW** UC33                                                          |
| ILF-30 | Critérios seleção / régua edição     | B 7      | M 10     | EXPAND 6 critérios                                                    |

RET múltiplos (regra, binding, log) → Alta.  
† RFP não cita doação explicitamente; B0 mínimo = “contemplação” implícita — contagem conservadora Baixa; B1 Alta.

### EIF (externos)

| ID     | Nome                            | B0  | B1  |
| ------ | ------------------------------- | --- | --- |
| EIF-01 | Gupshup (templates / status WA) | M 7 | M 7 |
| EIF-02 | SendGrid (e-mail / eventos)     | M 7 | M 7 |

**Soma DATA:** B0 **218** · B1 **345** · Δ **+127**

---

## 4. Transações — visão por domínio

Totais no CSV. Principais drivers de crescimento (alinhados à v7 / `[fora_escopo_v2](fora_escopo_v2.md)`):

### 4.1 Comunicação e alertas (maior Δ de processo)

| Tema                                        | B0 (RFP) | B1 (v7)                                                             |
| ------------------------------------------- | -------- | ------------------------------------------------------------------- |
| WA individual / grupo / programar mensagens | Genérico | Fila jornada **≠** fila alertas; **pacotes UC88**; janela comercial |
| Chat dúvidas                                | Sim      | UC64 (mantido)                                                      |
| Alertas tipados CMS + binding Gestor        | —        | **NEW** UC87/UC52                                                   |

≈ **+24 UFP** (COMMS). Também empurram DATA (ILF-20, ILF-29) e JORNADA.

### 4.2 Seleção e empreendimento

| Tema                     | B0  | B1                                                                |
| ------------------------ | --- | ----------------------------------------------------------------- |
| Organizar turmas / vagas | Sim | + 3 etapas, entrevista UC84, score X/Y; UC25 = gatilho de jornada |
| Empreendimento coletivo  | —   | **NEW** UC31/32                                                   |

≈ **+23 UFP** (SELECAO) + parte de DATA (ILF-09).

### 4.3 Doação / encerramento

| Tema   | B0              | B1                                                                              |
| ------ | --------------- | ------------------------------------------------------------------------------- |
| Doação | Implícito/fraco | P/H manual + funil online 100%→live→KW→quiz; PIX/recibo (UC86); lote A–D (UC85) |

≈ **+34 UFP** (DOACAO).

### 4.4 Jornada online

| Tema                             | B0  | B1                                             |
| -------------------------------- | --- | ---------------------------------------------- |
| Trilha / videoaula / notificação | Sim | Temporizador, OK, lote, estados maratona/risco |

≈ **+36 UFP** (JORNADA).

---

## 5. Como usar o CSV

| Coluna            | Significado                                                       |
| ----------------- | ----------------------------------------------------------------- |
| `id`              | Identificador estável                                             |
| `cat`             | DATA / CMS / INSCR / SELECAO / JORNADA / COMMS / DOACAO / BI_LGPD |
| `nome`            | Função de usuário                                                 |
| `tipo`            | EI · EO · EQ · ILF · EIF                                          |
| `cx_b0` / `pf_b0` | Complexidade e PF no RFP (`-` / 0 se NEW)                         |
| `cx_b1` / `pf_b1` | Complexidade e PF no canônico (v7)                                |
| `delta`           | `pf_b1 − pf_b0`                                                   |
| `natureza`        | SAME · EXPAND · NEW                                               |
| `uc`              | Casos de uso                                                      |
| `origem`          | Trecho RFP ou decisão de levantamento                             |

Filtros úteis no Excel:

- `natureza = NEW` → o que o RFP **não** pedia
- `natureza = EXPAND` → o que **engordou**
- Pivot por `cat` → mapa de crescimento

---

## 6. Limitações (ler antes de usar em contrato)

1. Não substitui contagem **certificada** IFPUG com DET documentados.
2. Agrupamentos (ex. AlertRule+Binding+Log = 1 ILF Alta) são julgamento; auditor pode fatiar em 2–3 ILF (+7 a +20 UFP).
3. Relatórios BI: se Looker só lê réplicas SQL sem “relatório do sistema”, parte dos EO pode ser reclassificada.
4. **2FA** no CMS (RFP): em B1 pode constar como não priorizado na entrega imediata — ver linhas AUTH no CSV.
5. A **v7 não classifica MVP**; priorização de entrega fica no comercial (`[fora_escopo_v2](fora_escopo_v2.md)`) e no `[Acompanhamento_Gestor](Acompanhamento_Gestor/)`.
6. Para change request futuro: usar esta planilha como **baseline B1** e contar só o **delta do CR**.

---

## 7. Próximos passos sugeridos

1. Revisar com o time as linhas `natureza=NEW` (o que entra na primeira entrega).
2. Em disputa comercial: recalcular 2–3 ILF controversos com DET reais (Empreendedora, Edição, Progresso) — ver pacotes P4/P5/P7 no `[fora_escopo_v2](fora_escopo_v2.md)`.
3. Ligar IDs desta contagem aos itens do `[Acompanhamento_Gestor](Acompanhamento_Gestor/)` (`planoOriginal`).
4. Após fechar DET da **saúde financeira** (UC45 / pendências v7): regenerar CSV via `[_gen_contagem_ifpug.py](_gen_contagem_ifpug.py)` incorporando a §8.

---

## 8. Delta pós-canônico (pendente regeneração do CSV)

Temas **já documentados na v7** (ou em rascunho) que **ainda não** alteram os totais B0/B1 desta página até regenerar o CSV. Estimativa informal: **+15 a +40 UFP**.

| Tema                                                     | Função afetada                                     | Efeito provável     | Status                                                                        |
| -------------------------------------------------------- | -------------------------------------------------- | ------------------- | ----------------------------------------------------------------------------- |
| Itens 1:N na doação                                      | ILF-21 / ILF ItemDoacao; EI cadastrar itens        | NEW ou EXPAND DET   | Canônico v7 (UC57); CSV pendente                                              |
| Orçamento **por unidade** (só CMS)                       | ILF-03 / ILF OrcamentoUnidade; EO saldos no Gestor | NEW / EXPAND        | Canônico v7 (UC9/UC57) — Gestor **consulta** saldos, **não** ajusta orçamento |
| Saúde financeira (Entradas/Saídas/dívidas)               | ILF-16                                             | EXPAND (M→H?)       | **Rascunho** — pendência v7 / `[fora_escopo_v2` P10](fora_escopo_v2.md)       |
| PIX-CPF imutável; recibo 60 dias; assinatura obrigatória | ILF-21 / EI-EQ assinatura                          | EXPAND              | Canônico UC86; CSV pendente                                                   |
| Timestamp do quiz                                        | DET em Progresso / EO funil                        | SAME ou EXPAND leve | Canônico UC38                                                                 |
| Pacotes UC88 (1 template/tipo; Aula presencial+ao_vivo)  | ILF-19                                             | EXPAND ou NEW DET   | Canônico UC88; CSV pode subestimar                                            |

**Não regenerar** o CSV até a planilha de saúde financeira fechar DET (evita double-count e rework).

---

_Documento de apoio à comparação RFP × canônico v7. Totais UFP = soma do `[Contagem_IFPUG_Consulado.csv](Contagem_IFPUG_Consulado.csv)`. Regenerar com `[_gen_contagem_ifpug.py](_gen_contagem_ifpug.py)`. Ampliações comerciais: `[fora_escopo_v2.md](fora_escopo_v2.md)`._
