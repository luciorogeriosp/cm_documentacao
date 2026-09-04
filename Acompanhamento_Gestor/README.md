# Acompanhamento Gestor — painel C-level

Painel executivo do projeto **Consulado da Mulher**, em linguagem de negócio (não técnica).

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| [index.html](index.html) | Painel interativo — abrir no navegador |
| [estrutura.json](estrutura.json) | Árvore do projeto (fases, artefatos, itens, escopo, capacidades) |
| `status.json` | Exportado pelo painel — percentuais, escopo, andamento, plano original, extensão e detalhe |
| [../Estrutura_Evolucao_Projeto.csv](../Estrutura_Evolucao_Projeto.csv) | Planilha técnica detalhada (sincronização opcional de IDs) |

## Modelo mental: atividade-mãe + extras

No **Levantamento**, três atividades-mãe concentram a visão C-level. Extensões **não** se cadastram de novo em três lugares: aparecem automaticamente a partir do status no Desenvolvimento (e do catálogo de tipos).

| Mãe | O que é | Painel derivado (to-do) |
|-----|---------|-------------------------|
| **1.1** Casos de uso e regras | Documento canônico ([v7](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) — 85 UCs) | **Extras / fora do plano** — itens com `planoOriginal = false` |
| **1.2** Catálogo de tipos | Uma linha por tipo educacional | Plano · `%`; extensão só se **no plano** e marcado “teve extensão” |
| **1.3** Modelo conceitual | Schema de negócio | **Extras que crescem o modelo** — itens com `impactaModelo` |

No **Desenvolvimento** permanecem as fatias operacionais (CMS, Gestor, Cliente, Backend, Comunicação). O **% canônico** do tipo para o executivo é o do catálogo **1.2**; as fatias são referência de construção da mesma capacidade.

```
Desenvolvimento (planoOriginal=false) ──► lista em 1.1
Catálogo (tipo no plano + teveExtensao) ──► % extensão / detalhe em 1.2
Tipo fora do plano ───────────────────────► só lista em 1.1 (sem “extensão”)
Item com impactaModelo ───────────────────► lista em 1.3
```

## Quatro eixos distintos

| Eixo | Valores | O que significa |
|------|---------|-----------------|
| **Plano original** | Dentro / Fora (toggle) | Se a atividade estava no RFP inicial ([escopo_original_cliente.txt](../escopo_original_cliente.txt)) — **independe de MVP/Fase 2** |
| **Capacidade** | Núcleo · Extensão | Núcleo = funcionalidade do plano original; extensão = acréscimo ligado a essa mesma capacidade |
| **Escopo de entrega** | MVP · Fase 2 · Fase 3 | Quando a atividade entra na entrega |
| **Andamento** | Não iniciado · Em andamento | Situação atual do trabalho |

Uma extensão pode ser **MVP** e ainda assim **fora do plano original**.

## Capacidades: núcleo + extensão (operação)

No Desenvolvimento, itens da mesma capacidade aparecem agrupados **dentro de cada artefato**, com badge `Extensão de …` nas folhas fora do plano. Marcar **fora do plano** faz o item entrar na lista derivada de **1.1** (e em **1.3** se tiver `impactaModelo`).

### Exemplo piloto — Classificar inscritas

| Parte | Artefato | Item | Plano original |
|-------|----------|------|----------------|
| Núcleo | Gestor | Classificar inscritas (status manual) | Sim |
| Extensão | Gestor | Score X/Y na classificação | Não |
| Núcleo | CMS | Bloqueios de inscrição | Sim |
| Extensão | CMS | Régua pontuável — 6 critérios | Não |
| Núcleo | Cliente | Cadastro da edição — bloqueios | Sim |
| Extensão | Cliente | Cadastro da edição — critérios pontuáveis | Não |
| Núcleo | Backend | Validação de bloqueios | Sim |
| Extensão | Backend | Cálculo do score X/Y | Não |

### Exemplo — Cadastro / formulário dinâmico

Capacidade **Cadastro / inscrição da empreendedora** (`cadastro-inscricao`). Itens da extensão têm `impactaModelo` e aparecem sob **1.3**.

| Parte | Artefato | Item | Plano original |
|-------|----------|------|----------------|
| Núcleo | CMS | Ficha de inscrição — base da edição | Sim |
| Extensão | CMS | Formulário dinâmico da inscrição | Não |
| Núcleo | Cliente | Cadastro completo (4 blocos) | Sim |
| Extensão | Cliente | Cadastro — formulário dinâmico (schema) | Não |
| Núcleo | Backend | Persistir inscrição + empreendedora + empreendimento | Sim |
| Extensão | Backend | Schema e respostas dinâmicas | Não |
| Extensão | Gestor | Ficha dinâmica na seleção / inserção assistida | Não |

**Impactos da extensão (formulário dinâmico):**

1. **CMS administrativo** — Campos e perguntas variáveis por edição (ordem, tipo, obrigatoriedade, show/hide), além de instruções e Guia do Participante.
2. **Processo de cadastro (Cliente)** — UI dirigida pelo schema; bloqueios (idade / disponibilidade) distintos da régua.
3. **Backend** — Schema da edição, validação server-side, snapshot no submit, UUID/retomada (UC67) e alerta de inscrição incompleta (UC87).
4. **Modelo de dados** — Definição de formulário por edição + respostas tipadas (JSON/EAV), sem misturar variáveis ao BI comparável.
5. **Aplicativo Gestor** — Classificação/ficha com campos variáveis; inserção assistida (UC69) no mesmo schema.
6. **LGPD / BI** — Sensíveis e perguntas variáveis fora do BI comparável (UC21).

### Exemplo — Registro de faturamento (4 → 7 + dificuldade)

Capacidade **Registro de faturamento** (`tipo-faturamento`).

No plano original: **renda, faturamento, investimento e poupança**. No canônico (UC45): **7 indicadores** + **dificuldade** (5 rostos).

No **catálogo 1.2**, o tipo tem `% núcleo` (os 4) e `% extensão` (+3, dificuldade, anexo), com tags em `extensoes[]`. Fatias CMS/Gestor/Cliente/Backend da extensão têm `impactaModelo`.

| Parte | Artefato | Item | Plano original |
|-------|----------|------|----------------|
| Núcleo | CMS / Gestor / Cliente / Backend / BI | 4 indicadores | Sim |
| Extensão | CMS / Gestor / Cliente / Backend / BI | +3 indicadores + dificuldade + anexo obrigatório | Não |

### Exemplo — Entrevista de seleção (P/H)

Capacidade **Entrevista de seleção (P/H)** (`entrevista-selecao`) — fora do plano original; `impactaModelo` no Gestor e no Backend.

| Parte | Artefato | Item | Plano original |
|-------|----------|------|----------------|
| Extensão | Gestor | Entrevista (sessões, presença, aprovar/realocar) | Não |
| Extensão | Gestor | Convocar (UC25 faixa 1 — só alocadas em sessão) | Não |
| Extensão | Backend | Sessões, presença, ausente→não aprovada | Não |

Online permanece **sem** esta etapa (classificar → comunicar).

### 11 tipos de atividade (catálogo 1.2)

Cada tipo educacional é **uma folha no catálogo**, alinhado a [`Tipos_de_Atividade.md`](../Tipos_de_Atividade.md) / UC15, com controles configuráveis:

- **Plano original** — toggle: estava ou não no RFP
- **Teve extensão** — em **qualquer** atividade com **Plano original** ligado: o escopo original cresceu (aumento documentável). Folhas que já são fatia “extensão” no Desenvolvimento não repetem o toggle.
- Se **teve extensão**: abre o campo **Detalhe da extensão** e o **`% extensão`**
- Tipo/atividade **fora do plano** = nova inteira — **não** usa “extensão”

Default de “teve extensão”: ligado se a estrutura trouxer `extensoes[]` **e** o tipo estiver no plano (ex. faturamento, Aula com QR/relato/replay). Status persiste `teveExtensao`, `detalheExtensao` e `pctExtensao`.

A **média do artefato 1.2** usa só o `% núcleo`. O `% extensão` é indicador paralelo e **não** entra no badge do agrupamento.

Operação no Desenvolvimento (sem duplicar modelo/layout por tipo):

| Artefato | O que o tipo exige |
|----------|-------------------|
| **CMS** | Criar/alterar a atividade no módulo |
| **Gestor** | Liberação, prazo, conferência |
| **Cliente** | Exibir e operacionalizar |
| **Backend** | Persistência e regras |
| **Comunicação** | Mensagem / lembrete |
| **BI** | Frequência, evolução, NPS (quando couber) |

**Catálogo canônico (11):** Aula (presencial ∪ ao vivo na liberação), Vídeo Aula, Atividade, Tarefa de casa, Registro de faturamento, Download, Plano de ação, Visita técnica, Questionário inicial, Questionário final, NPS.

- **Aula** unifica presencial e ao vivo (natureza no CMS UC15; data/link na liberação UC34). Extensões operacionais: QR/chamada, relato, replay.
- **Conteúdo extra (UC35)** não é tipo da matriz — item avulso no Gestor; não conta %/carga.
- Fora do plano original: **plano de ação** e **visita técnica**.
- Extensões de faturamento: +3 indicadores, dificuldade, **anexo obrigatório**.

### Doação e encerramento — P/H × online

Doação **não** é o mesmo fluxo nas duas modalidades. Pós-liberação (PIX/recibo/aceites) é **comum**.

| Modalidade | Gatilho de liberação | Quando |
|------------|----------------------|--------|
| **P/H** | Análise **manual** do gestor (sugerir/aprovar; individual ou **massa**) | **Qualquer momento** do programa |
| **Online** | Funil: **100% atividades** → live → **presença/KW** → questionário **100% certo** | Só ao **fim** do funil |

| Capacidade no painel | O que cobre |
|----------------------|-------------|
| **Doação P/H** | Sugerir e aprovar a qualquer momento; **doação em massa**; **itens 1:N**; **orçamento por unidade** (valores só no CMS — UC9) |
| **Doação online** | Live externa, funil presença/KW+quiz (+ timestamp quiz), sugerir/aprovar só liberadas |
| **Pós-liberação da doação** | PIX/conta (CPF-PIX imutável), endereço, recibo conta **725** (até 60 dias), assinatura obrigatória, aceites — comum às duas jornadas |

> Saúde financeira (UC45) permanece **rascunho** — ver [Pendências v7](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) e [fora_escopo_v2 § P10](../fora_escopo_v2.md).

### Comunicação unificada (UC88 + UC87)

| Capacidade | O que cobre |
|------------|-------------|
| **Pacotes de comunicação (UC88)** | Catálogo CMS de templates Meta/Gupshup (1 por tipo; Aula presencial + ao_vivo); edição **seleciona pacote** (UC9); mesmo corpo para API online e clipboard P/H (UC50) |
| **Alertas de engajamento (UC87)** | Aba **Alertas** na mesma área Comunicação; binding no Gestor; fila no Backend (UC52) → SendGrid/Gupshup; sem Mautic |

**Duas filas:** jornada OK/lote (UC33) ≠ alertas/resgate (UC87).

### Visão de BI (escopo × além)

O artefato **BI e indicadores** no Desenvolvimento organiza o Painel de Dados (Looker Studio) em quatro blocos. A distinção **executivo vs. fora do executivo** separa o que entra no dashboard C-level do que permanece contemplado no RFP, mas só em drill-down operacional.

| Bloco | Plano original | O que cobre |
|-------|----------------|-------------|
| **Escopo contemplado — visão executiva** | Sim | Funil (inscritas → selecionadas → iniciaram → concluíram); evolução de renda e faturamento; perfil socioeconômico por programa; dashboard Looker; NPS e pesquisas; relatório como artefato; série anual |
| **Escopo contemplado — fora do executivo** | Sim | Frequência e participação; investimento e poupança; relatório por beneficiária. O **relatório como artefato** (UC60/UC61) também está disponível aqui |
| **Além do escopo** | Não | Metas institucionais e prazos contratuais; capital semente e doações; mapa de regiões; acompanhamento das mentorias; tipos de doação e valores; divisão empreendedoras × empreendimentos (UC71); análise de Persona |
| **Extensões — registro de faturamento** | Parcial | +3 indicadores (7 total) e dificuldade de prefill — extensão da capacidade `tipo-faturamento` |

**Regra:** “Fora do executivo” = item do plano original do cliente, mas **sem KPI** na visão resumida do dashboard C-level (UC59). Totais operacionais rápidos (inscritas, pendentes) permanecem no **App Gestor** (`2.4.1.4`), distintos do funil executivo do BI.

## Como usar

1. Abra `index.html` no Chrome, Edge ou Firefox.
   - Se abrir por duplo clique (`file://`), clique em **Carregar estrutura.json**.
   - Alternativa: `python -m http.server 8080` na pasta do painel.
2. Em **1.1** e **1.3**, use os painéis derivados como checklist (fora do plano / impacto no modelo).
3. Em qualquer item **no plano original**, use **Teve extensão** para registrar aumento de escopo (detalhe + `% extensão`). No catálogo **1.2**, o mesmo vale para os tipos.
4. No Desenvolvimento, **Plano original**, escopo, andamento e `%` por fatia operacional.
5. Painéis no topo: plano original, capacidades com extensões, progresso, escopo e andamento.

## JSON — estrutura vs status

**estrutura.json** (`version` 1.6+):

```json
{
  "version": "1.6",
  "meta": {
    "scopes": ["MVP", "Fase 2", "Fase 3"],
    "andamentoStatuses": ["Não iniciado", "Em andamento"],
    "capacidadePartes": ["nucleo", "extensao"],
    "planoOriginalRef": "../escopo_original_cliente.txt"
  },
  "phases": [ … ]
}
```

Campos opcionais nas folhas: `capacidade` / `capacidadeLabel` / `capacidadeParte`, `catalogoTipo`, `extensoes`, `impactaModelo`, `defaultPctExtensao`.

**status.json:**

```json
{
  "version": 5,
  "items": {
    "cat-tipo-faturamento": {
      "pct": 40,
      "pctExtensao": 10,
      "teveExtensao": true,
      "detalheExtensao": "+3 indicadores; dificuldade (5 rostos)",
      "scope": "MVP",
      "andamento": "Em andamento",
      "planoOriginal": true
    },
    "2.4.2.1-ext-score": { "planoOriginal": false, "andamento": "Em andamento" }
  }
}
```

## Manutenção

```bash
python Acompanhamento_Gestor/_build_html.py
```

Regenera `estrutura.json` a partir do script (percentuais iniciais sincronizados com o CSV). O `index.html` é mantido à mão.

## Fontes

- [Casos de Uso v7](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) — spec canônica (85 UCs)
- [fora_escopo_v2.md](../fora_escopo_v2.md) — ampliações comerciais (pacotes P1–P10)
- [escopo_original_cliente.txt](../escopo_original_cliente.txt) — baseline RFP
- [Tipos de Atividade](../Tipos_de_Atividade.md)
