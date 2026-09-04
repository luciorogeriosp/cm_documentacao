# Transferir entre turmas

| Campo | Valor |
| ----- | ----- |
| **Rota** | Modal em `/gestor/participantes/[id]/transferir` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC18 |
| **Prioridade** | MVP |

---

## Objetivo

Mover participante entre turmas da mesma edição preservando histórico.

---

## Wireframe

```
┌─────────────────────────────────┐
│ Transferir participante         │
├─────────────────────────────────┤
│ De: Turma A                     │
│ Para: [ Turma B          ▼ ] *  │
│ Motivo *                        │
│ [________________________]      │
├─────────────────────────────────┤
│ [ Cancelar ]  [ Confirmar ]     │
└─────────────────────────────────┘
```

---

## Regras

- Turmas devem ser compatíveis (mesma edição)
- Notifica gestores das turmas envolvidas
- Histórico individual preservado
