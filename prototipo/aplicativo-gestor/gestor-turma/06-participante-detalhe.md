# Detalhe da participante

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/participantes/[id]` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC27, UC42, UC28 |
| **Prioridade** | MVP |

---

## Objetivo

Visão 360° da participante: cadastro, status, frequência, entregas e histórico.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ [←] Maria Silva — Em assessoria                  │
│ Turma A | Unidade Centro                         │
├──────────────────────────────────────────────────┤
│ Abas: [Resumo] [Frequência] [Entregas] [Histórico]│
├──────────────────────────────────────────────────┤
│ Resumo                                           │
│ CPF: *** | Tel: (11) *****-**** | E-mail: m@...  │
│ Progresso: ████████░░ 85%                        │
│ Frequência global: 90% (meta edição: 75%)        │
├──────────────────────────────────────────────────┤
│ [ Editar ] [ Inserir dados ] [ Transferir ]      │
│ [ Caso de sucesso ] [ Cancelar/desistência ]     │
│ [ Enviar WhatsApp ]                              │
└──────────────────────────────────────────────────┘
```

---

## Aba Frequência (UC42)

- Percentual global e por módulo/atividade
- Metas 50%, 75%, 100% da edição
- Lista de presenças (QR + manual)

---

## Aba Entregas

- Tarefas de casa e dados financeiros com status
- Link direto para avaliação (UC44)
