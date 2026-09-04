# Avaliar entrega

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/aprovacoes/[id]` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC44, UC46 |
| **Prioridade** | MVP |

---

## Objetivo

Aprovar ou **Revisar** (comentário obrigatório, sem penalidade automática) tarefa de casa ou dados financeiros.

---

## Wireframe — Tarefa de casa

```
┌──────────────────────────────────────────────────┐
│ Avaliar entrega — Maria Silva                    │
│ Tarefa: Módulo 2 — Plano de negócios             │
├──────────────────────────────────────────────────┤
│ Arquivos enviados:                               │
│ 📷 foto-produto.jpg  [Visualizar]                │
│ 📄 plano.pdf         [Visualizar]                │
├──────────────────────────────────────────────────┤
│ Observações (obrigatório se Revisar) *           │
│ [________________________________]               │
├──────────────────────────────────────────────────┤
│ [ Aprovar ]  [ Revisar ]                         │
└──────────────────────────────────────────────────┘
```

---

## Wireframe — Dados financeiros

```
┌──────────────────────────────────────────────────┐
│ Validar dados — Maio/2027 — Ana Costa            │
├──────────────────────────────────────────────────┤
│ Faturamento: R$ 3.200 | Renda: R$ 2.800          │
│ Comparativo abril: +15% faturamento              │
│ Documentos: [comprovante.pdf]                    │
├──────────────────────────────────────────────────┤
│ [ Aprovar ]  [ Revisar com observação ]          │
└──────────────────────────────────────────────────┘
```

---

## Regras

- **Revisar:** notificação WhatsApp + e-mail + indicador visual no Aplicativo Cliente (sem penalidade automática)
- Participante pode reenviar até aprovação
- Aprovação atualiza progresso e indicadores BI
