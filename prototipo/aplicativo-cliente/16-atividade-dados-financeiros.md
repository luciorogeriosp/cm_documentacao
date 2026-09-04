# Atividade — Dados financeiros mensais

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: dados_financeiros) |
| **Perfil** | Empreendedora |
| **UCs** | UC45, UC44 |
| **Prioridade** | MVP |

---

## Objetivo

**Reporte ao programa** da evolução do negócio (não é fluxo de caixa pessoal). Preenchimento **pela empreendedora**.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Dados financeiros         │
│  Mês de referência: Maio/2027   │
│  Status: Aprovado ✓             │
│  ℹ Reporte ao programa — não é  │
│    seu fluxo de caixa pessoal   │
├─────────────────────────────────┤
│  Faturamento (R$) *             │
│  [___________]                  │
│  Renda pessoal (R$) *           │
│  Investimento no negócio (R$)   │
│  Poupança (R$)                  │
│  Despesas fixas (R$)            │
│  Nº de clientes                 │
│  Nº de produtos vendidos        │
├─────────────────────────────────┤
│  Se faturamento ou renda = 0:   │
│  Observação / justificativa *   │
│  [________________________]     │
├─────────────────────────────────┤
│  Quão difícil foi preencher? *  │
│  [😣] [🙁] [😐] [🙂] [😄]         │
│  muito difícil … muito fácil    │
├─────────────────────────────────┤
│  Documentos / planilha (opc.)   │
│  [ + Anexar ]                   │
├─────────────────────────────────┤
│  [ Enviar para avaliação ]      │
└─────────────────────────────────┘
```

---

## Regras

- Coleta **mensal** recorrente pelo Cliente (não pela gestora via planilha)
- Validação: renda ≤ faturamento (alerta se inconsistente)
- Valor **0** em faturamento ou renda: **observação obrigatória**
- Mês sem movimento: zeros com justificativa
- **Dificuldade** obrigatória (5 níveis com emoticon); visível ao gestor na aprovação/histórico e no resumo da turma; gestor pode registrar via UC69
- Aprovação obrigatória gestor (UC44/UC46); gestor pode marcar **revisão**
- Acessível também via link mágico WhatsApp (UC54)
