# Histórico de participação

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/unidade/historico` |
| **Perfil** | Gestor de Unidade |
| **UCs** | UC28, UC62 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar linha do tempo consolidada de qualquer participante da unidade.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Histórico de participação                        │
│ Busca: [CPF, nome ou telefone________] [Buscar]  │
├──────────────────────────────────────────────────┤
│ Maria Silva — CPF ***                           │
│ ┌────────────────────────────────────────────┐   │
│ │ 2027 — Programa Empreenda — Em assessoria  │   │
│ │ Unidade Centro | Turma A                   │   │
│ │ 2024 — Programa X — Certificada (legado)   │   │
│ │ 2019 — Programa Y — Beneficiada (legado)   │   │
│ └────────────────────────────────────────────┘   │
│ [ Ver detalhe participante ] [ Exportar ]        │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Base ativa + legado somente leitura (UC62)
- Suporte a decisões de seleção, premiação e mentoria
