# Meu perfil

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/perfil` |
| **Perfil** | Empreendedora |
| **UCs** | UC27, UC79 |
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
│  [ Solicitar desistência ]      │  → UC30 / UC79
└─────────────────────────────────┘
```

---

## Regras

- CPF validado: **bloqueado** para edição pela empreendedora
- Unidade: somente gestor altera (correção de alocação)
- **Mentoria** não fica no perfil — área própria no menu inferior: [29-mentorias-hub.md](29-mentorias-hub.md)
