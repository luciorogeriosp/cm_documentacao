# Dashboard da unidade

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/unidade` |
| **Perfil** | Gestor de Unidade |
| **UCs** | UC59 (visão resumida) |
| **Prioridade** | MVP |

---

## Objetivo

Visão operacional da unidade: inscrições, seleção, turmas e indicadores-chave. Dashboard completo no Painel BI.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Dashboard — Unidade Centro | Edição 2027         │
├──────────────────────────────────────────────────┤
│ ┌────────┐ ┌────────┐ ┌────────┐ ┌────────┐     │
│ │Inscrições│ │Selecionadas│ │Em assessoria│ │Certificadas│ │
│ │   120  │ │   45   │ │   38   │ │   12   │     │
│ └────────┘ └────────┘ └────────┘ └────────┘     │
├──────────────────────────────────────────────────┤
│ Ações rápidas                                    │
│ [ Seleção pendente (32) ] [ Doações a aprovar (3)]│
│ [ Entregas a aprovar (8) ] [ Financeiro a aprovar (3)]│
├──────────────────────────────────────────────────┤
│ Turmas da unidade                                │
│ Turma A — 18 participantes — Gestor: Ana         │
│ Turma B — 20 participantes — Gestor: João        │
├──────────────────────────────────────────────────┤
│ Alertas: 5 inscrições aguardando análise         │
└──────────────────────────────────────────────────┘
```

---

## KPIs (cards)

- Inscritas, selecionadas, em assessoria, beneficiadas, certificadas, **recebeu doação**
- Sem KPI “chamadas em aberto”
- Pendências: **Entregas a aprovar** e **Financeiro a aprovar**
- Filtro por edição/programa
- Link "Ver painel completo" → BI externo
