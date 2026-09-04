# Mini CRM — Leads

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/leads` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC26, UC19, UC87 |
| **Prioridade** | MVP |

---

## Objetivo

Visualizar e reengajar leads que autorizaram comunicação e abandonaram a inscrição.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Mini CRM — Inscrições incompletas                │
│ Filtros: [Edição ▼] [Etapa abandono ▼]           │
├──────────────────────────────────────────────────┤
│ Nome        Etapa           Último acesso  Ação  │
│ Carla Lima  Dados pessoais  19/06         [↻]   │
│ Paula Dias  Dados financeiros 18/06       [↻]   │
│ Rosa Alves  Pré-cadastro    15/06         [↻]   │
├──────────────────────────────────────────────────┤
│ [ Reengajar selecionados ]                       │
│ Template: [ Retomar inscrição — link ▼ ]         │
├──────────────────────────────────────────────────┤
│ Conversões este mês: 12/45 (27%)                 │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Disparo **manual** (reforço) + histórico do alerta automático `inscription_incomplete` (UC87), se ativo na edição.
- E-mail prioritário; WhatsApp opcional (custo).
- Ao concluir inscrição, Backend cancela pendentes da regra.
- Apenas leads com **autorização de comunicação** (UC19)
- Sem comunicação autorizada: lead visível mas sem ação de reengajamento
- Dispara link personalizado com retomada (UC67)
- Métrica de conversão registrada
