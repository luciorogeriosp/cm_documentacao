# Lista de turmas

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/turmas` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC16 |
| **Prioridade** | MVP |

---

## Objetivo

Listar, criar e gerenciar turmas vinculadas à edição e unidade.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Turmas — Unidade Centro | Edição 2027            │
│ [ + Nova turma ]                                 │
├──────────────────────────────────────────────────┤
│ Turma A                                          │
│ 18 participantes | Vagas: 20 | Gestor: você      │
│ Início: 01/06 | Status: Ativa                    │
│ [ Detalhe ] [ Editar ]                           │
│ ─────────────────────────────────────────────    │
│ Turma B                                          │
│ 15 participantes | Vagas: 20 | Gestor: Ana       │
│ [ Detalhe ] [ Editar ]                           │
└──────────────────────────────────────────────────┘
```

---

## Formulário nova turma

| Campo | Obrigatório |
| ----- | ----------- |
| Nome | Sim |
| Edição | Sim |
| Unidade | Sim |
| Gestor responsável | Sim |
| Vagas | Sim |
| Datas início/fim | Sim |
| Região | Opcional |
