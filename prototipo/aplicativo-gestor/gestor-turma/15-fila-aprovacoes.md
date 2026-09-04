# Fila de aprovações

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/aprovacoes` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC44, UC46 |
| **Prioridade** | MVP |

---

## Objetivo

Listar entregas pendentes de aprovação: tarefas de casa e dados financeiros mensais.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Aprovações pendentes                             │
│ Abas: [ Entregas (4) ] [ Financeiro (3) ]        │
│ Filtros: [Turma ▼] [Tipo ▼] [Mais antigas ▼]     │
├──────────────────────────────────────────────────┤
│ Maria Silva — Tarefa Módulo 2                    │
│ Enviado: 18/06 | Turma A                         │
│ [ Avaliar ]                                      │
│ ─────────────────────────────────────────────    │
│ Ana Costa — Dados financeiros — Maio/2027        │
│ Enviado: 17/06 | Turma A                         │
│ [ Avaliar ]                                      │
│ ─────────────────────────────────────────────    │
│ Joana Lima — Tarefa Módulo 1 (reenvio)           │
│ Em revisão — 16/06                               │
│ [ Avaliar ]                                      │
└──────────────────────────────────────────────────┘
```

---

## Navegação

- **Avaliar** → [16-avaliar-entrega.md](16-avaliar-entrega.md)
