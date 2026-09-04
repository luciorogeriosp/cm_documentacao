# Editar participante

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/participantes/[id]/editar` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC27 |
| **Prioridade** | MVP |

---

## Objetivo

Alterar e-mail, telefone e unidade da participante; demais campos com auditoria.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Editar — Maria Silva                             │
├──────────────────────────────────────────────────┤
│ CPF: ***.***.***-**  (somente leitura)           │
│ E-mail * [________________________]              │
│ Telefone (DDD) * [(__) _____-____]               │
│ Unidade * [ Centro            ▼ ]                │
├──────────────────────────────────────────────────┤
│ Demais campos (requer justificativa):            │
│ Nome [________________] 🔒                       │
│ [ Solicitar alteração com justificativa ]        │
├──────────────────────────────────────────────────┤
│ [ Cancelar ]  [ Salvar ]                         │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Gestor de turma: e-mail, telefone, unidade livremente
- Outros campos: justificativa + log de auditoria
- CPF nunca editável
