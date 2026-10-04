# Atividade — Saúde financeira

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: `saude_financeira` ou `dados_financeiros`) |
| **Perfil** | Empreendedora |
| **UCs** | UC45, UC44 |
| **Prioridade** | MVP |
| **Briefing** | [ia-saude-financeira.md](../../briefings/ia-saude-financeira.md) |

---

## Objetivo

**Reporte póstumo** do mês que já passou. **Não** é fluxo de caixa do dia a dia e **não** existe atividade “Fluxo de caixa” à parte. Resultado **Despesas / capital de giro** é **calculado, só leitura**.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Saúde financeira          │
│  Maio/2027 · Aguardando aprov.  │
│  ℹ Reporte do mês que já passou │
│    — prazo: 10º dia útil de jun.│
├─────────────────────────────────┤
│            Média  Mar  Abr  Mai*│
│ ENTRADAS                        │
│ Faturamento 2800 2100 3000 [3200│
│ Empréstimos    0    0    0 [   0│
│ Nº clientes   18   14   20 [  22│
│ Nº produtos   40   32   45 [  48│
│ SAÍDAS                          │
│ Despesas    1100 1000 1200 [1150│
│ Investimento 200    0  400 [ 200│
│ Poupança     150  100  200 [ 150│
│ Dívidas      180  200  160 [ 180│
│ Renda/retir. 900  800 1000 [ 900│
│ Capital giro 270    0   40 [ 620│
├─────────────────────────────────┤
│ Neste mês sobrou R$ 970 depois  │
│ das despesas, dívidas e da sua  │
│ retirada. Você destinou R$ 200  │
│ ao negócio e R$ 150 à poupança. │
├─────────────────────────────────┤
│ Quão difícil foi preencher? *   │
│ [😣] [🙁] [😐] [🙂] [😄]          │
│ Planilha ou foto do mês *       │
│ [ + Anexar ]                    │
│ [ Enviar para avaliação ]       │
└─────────────────────────────────┘
```

`*` = coluna editável. Média e meses passados = somente leitura. Em mobile a grade **rola na horizontal**. Sem abas, acordeão ou dashboard de cards.

---

## Regras

- **1 registro por competência e empreendimento**
- Cada mês começa **em branco** (sem carry-forward / saldo inicial)
- **Anexo obrigatório**. Sem anexo = não envia
- **Dificuldade** obrigatória (5 níveis)
- Faturamento = 0 **ou** Renda/retirada = 0 → justificativa
- Renda/retirada > Faturamento → alerta (não bloqueia)
- Capital de giro = (Faturamento + Empréstimos) − Despesas − Investimento − Poupança − Dívidas − Renda/retirada (pode ser negativo)
- Média = meses **aprovados** da edição. Disparidade > 30% → célula âmbar (não em nº clientes/produtos)
- Avisos na tela (não trocam a média histórica): saídas > 120% do faturamento; resultado < −30% do faturamento
- **Requer ajustes** (revisão UC44): banner com o comentário; ela corrige e reenvia — **não** usar “reprovado”
- Aprovado: grade travada
- Link mágico WhatsApp (UC54)
