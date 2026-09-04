# Elegibilidade — Capital semente (parecer UC58)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/capital-semente` |
| **Perfil** | Gestor de Unidade |
| **UCs** | UC58 |
| **Prioridade** | Fase 2 / a revisar |

> **Nao confundir** com a modalidade **"capital semente (dinheiro)"** em Sugerir/Aprovar doacao ([06-aprovar-doacao.md](06-aprovar-doacao.md) / UC57). Esta tela e **parecer** estruturado.

---

## Objetivo

Analise estruturada com parecer documentado (entregas, financeiro, necessidade).

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Capital semente — Parecer (UC58)                   │
│ Participante: Maria Silva                          │
│ Distinto da doacao UC57                            │
├──────────────────────────────────────────────────┤
│ Consolidacao automatica:                           │
│ • Entregas aprovadas: 12/12                        │
│ • Constancia financeira: 6 meses                   │
│ • Necessidade equipamentos: Sim                    │
├──────────────────────────────────────────────────┤
│ Parecer do gestor *                                │
│ [________________________________]                 │
│ Decisao * ( ) Aprovado ( ) Revisar ( ) Pendente    │
│ Valor sugerido (R$)                                │
├──────────────────────────────────────────────────┤
│ [ Salvar parecer ]                                 │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Integra historico financeiro (UC45) e entregas (UC44)
- Decisao rastreavel para BI
- Concessao efetiva da doacao = UC57 (tela Doacao Unidade + APROVAR) + UC86
