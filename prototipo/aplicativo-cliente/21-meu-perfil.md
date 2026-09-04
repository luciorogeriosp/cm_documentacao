# Meu perfil

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/perfil` |
| **Perfil** | Empreendedora |
| **UCs** | UC27 |
| **Prioridade** | MVP |

---

## Objetivo

Visualizar e editar dados cadastrais, exceto CPF validado.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meu perfil                │
├─────────────────────────────────┤
│  Nome: Maria Silva              │
│  CPF: ***.***.***-**  🔒        │  ← não editável
│  E-mail *                       │
│  [________________________]     │
│  Telefone (DDD) *               │
│  [(__) _____-____]              │
│  Endereço (CEP, rua, etc.)      │
│  Unidade: Centro (somente leitura│
│  para empreendedora)            │
├─────────────────────────────────┤
│  Programa / Edição / Turma      │
│  (somente leitura)              │
├─────────────────────────────────┤
│  [ Salvar alterações ]          │
│  [ Solicitar desistência ]      │  → UC30
└─────────────────────────────────┘
```

---

## Regras

- CPF validado: **bloqueado** para edição pela empreendedora
- Unidade: somente gestor altera (correção de alocação)
- Vínculos programa/edição/unidade/turma preservados
