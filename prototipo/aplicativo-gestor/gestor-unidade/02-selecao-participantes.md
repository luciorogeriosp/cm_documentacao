# Seleção — 3 etapas (classificar / entrevista de seleção / alocar)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/selecao` (etapas 1–3) |
| **Perfil** | **Só Unidade** |
| **UCs** | UC24, UC84, UC17, UC23, UC12, UC31 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §5–7 |

---

## Objetivo

Fluxo de seleção em **3 etapas numeradas** + comunicação em tela própria ([03-comunicar-selecao.md](03-comunicar-selecao.md)):

| Etapa | Nome | UCs | Quando |
| ----- | ---- | --- | ------ |
| **1** | Classificar | UC24 | Todas as modalidades |
| **2** | Entrevista de seleção | UC84 | **Só presencial/híbrido** |
| **3** | Alocar em turma | UC17 | P/H com várias turmas (turma única = automático) |

**Online:** etapa 1 → Comunicar (UC25). **P/H:** 1 → 2 → 3 → Comunicar. Classificar **não** libera jornada.

Nomenclatura (reunião 13/ago.): **entrevista de seleção** (ex-oficina).

Listas exibem **Cidade/UF + Bairro** (não unidade). Sem filtro de unidade. Faixa de progresso vs **meta** da edição (abaixo / na meta / ligeiramente acima). Capacidade de sessão/turma = **soft alert** (sem hard lock).

---

## Barra de seleção em massa (todas as listas)

- Selecionar todas / limpar / inverter · contador “N de M” · Shift+intervalo
- Ações em massa só com seleção; toast com aplicadas vs ignoradas e motivo

---

## Etapa 1 — Classificar (UC24)

```
┌──────────────────────────────────────────────────┐
│ Seleção — Etapa 1/3 Classificar | Meta: 40       │
│ Qualif. 28 | Em análise 12 | Não qualif. 9       │
│ [1 Classificar] [2 Entrevista] [3 Alocar] [Comunicar]│
├──────────────────────────────────────────────────┤
│ Filtros: [Status*] [Elegibilidade*]              │
│          [Período*] Pontos*: [≥ ▼] [4] de Y      │
│ Busca nome* · Ordenação: [Score ↓] [Empreend. A–Z]│
│ Barra: [Todas filtradas] [Só elegíveis] [Limpar] │
├──────────────────────────────────────────────────┤
│ ☐ Empreendedora  Empreendimento  Score  Status   │
│ ☑ Maria          Doces da Maria  4/6 ▼  Em an.   │
│   └ tempo✓ renda✓ CLT✓ cargo✗ internet✓ WhatsApp✓│
│ ☑ Ana            Doces da Maria  3/6    Inscrita │
├──────────────────────────────────────────────────┤
│ Lote: [ Qualificar ] [ Em análise ] [ Não qualif.]│
│       [ Agrupar empreendimento ]                 │
│ ℹ Após agrupar: 1 linha = 1 negócio + N pessoas  │
│ ℹ Classificar NÃO libera jornada · sem coluna turma│
│ P/H → Etapa 2  |  Online → Comunicar             │
└──────────────────────────────────────────────────┘
```

**Modal Agrupar (UC31):** radio no empreendimento que permanece; demais registros de empreendimento **apagados**. Bloqueia se houver operação (faturamento/tarefa/presença/plano). Sem merge automático por nome.

**Régua (UC12/UC23):** catálogo de 6 critérios ativáveis por edição — tempo de negócio, renda familiar per capita, não CLT, não cargo público, internet, WhatsApp. Acordeão mostra ✓/✗ **somente dos ativos**; Y = nº de ativos. Internet e WhatsApp **não** bloqueiam inscrição; pontuam na qualificação. Score **não** aprova automaticamente. Qualificar é do **empreendimento** quando houver sócias.

---

## Etapa 2 — Entrevista de seleção (UC84) — só P/H

```
┌──────────────────────────────────────────────────┐
│ Seleção — Etapa 2/3 Entrevista | [+ Nova sessão] │
│ [ Exportar CSV presença ]                        │
├──────────────────────────────────────────────────┤
│ Sessão: Dinâmica Centro | 12/03 14h | Cap. 20    │
│ Qualificadas p/ agendar (Nome · Cidade/UF · Bairro)│
│ Barra: [Sem sessão] [Distribuir auto] [Realocar] │
│ Presentes / Ausentes:                            │
│ ☐ Maria · Joinville/SC  [Presente] [Aprovar]…    │
│ ☐ Ana · Blumenau/SC     [Ausente]                │
│   └ auto → Não aprovada (ou [Realocar sessão])   │
│ Lote: [Aprovar quem compareceu] [Não aprovar…]   │
│ ℹ Só presentes podem ser aprovadas               │
│ ℹ Ausente = não aprovada automaticamente         │
│ ℹ Realocar cancela o auto-status da ausência     │
│ → Etapa 3 Alocar (aprovadas)                     │
│ → Comunicar: faixa 1 = alocadas na sessão        │
└──────────────────────────────────────────────────┘
```

**Regra (canônica):** marcar **ausente** → status **não aprovada** na hora, salvo **realocação** imediata para outra sessão. Convite (UC25 faixa 1) só para quem está **alocada em sessão**. Liberação (faixa 2) só após etapa 3 (turma).

---

## Etapa 3 — Alocar em turma (UC17)

Ver [04-alocar-participantes.md](../gestor-turma/04-alocar-participantes.md) e Gestor §7. Turma única = automático. Soft capacity. **Não** muda status; **não** libera jornada.

---

## Navegação

- **Próximo:** [03-comunicar-selecao.md](03-comunicar-selecao.md)
