# Notas fiscais — 1 NF → N doações (material)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/doacao/notas-fiscais` |
| **Perfil** | Gestor de Unidade (Turma consulta) |
| **UCs** | UC86, UC57 |
| **Prioridade** | MVP |
| **Modalidade doação** | **Material** (equipamentos / insumos) |

> Pacote: [encerramento-doacao-mentoria.md](../encerramento-doacao-mentoria.md)

---

## Objetivo

Anexar **uma Nota Fiscal** de compra institucional e **associá-la a várias doações** (rateio de valores). O recibo de cada empreendedora só é liberado para assinatura **depois** que ela **confirma o recebimento** no Cliente.

---

## Fluxo

```
NF anexada + doações vinculadas
        ↓
Empreendedora confirma recebimento (Cliente)
        ↓
Sistema libera recibo 725 para assinatura
        ↓
Assinado + NF no repositório da doação
```

---

## Wireframe — lista / nova NF

```
┌──────────────────────────────────────────────────┐
│ Notas fiscais — doações materiais                │
│ [ + Anexar NF ]                                  │
├──────────────────────────────────────────────────┤
│ NF 4521 · 12/08 · R$ 4.200 · 3 doações           │
│   Confirmou receb.: 2/3 · Assinou recibo: 1/3    │
│   [ Abrir ]                                      │
│ NF 4488 · 01/08 · R$ 2.100 · 2 doações           │
│   Confirmou receb.: 2/2 · Assinou recibo: 2/2    │
└──────────────────────────────────────────────────┘
```

## Wireframe — vincular doações

```
┌──────────────────────────────────────────────────┐
│ Nova / editar Nota Fiscal                        │
│ Arquivo * [ NF-4521.pdf ]  Número [ 4521 ]       │
│ Data emissão [__/__/____]  Valor total R$ [4200] │
├──────────────────────────────────────────────────┤
│ Associar doações aprovadas (material)            │
│ ☐ Maria Silva     Valor rateio R$ [ 800 ]        │
│ ☐ Ana Costa       Valor rateio R$ [ 700 ]        │
│ ☑ Clara Souza     Valor rateio R$ [1500 ]        │
│ ☐ Joana Lima      Valor rateio R$ [1200 ]        │
│ Soma rateio: R$ 4.200  (deve fechar c/ total NF) │
├──────────────────────────────────────────────────┤
│ Status por doação                                │
│ Clara · recebimento: pendente · recibo: bloqueado│
│ [ Salvar ]                                       │
└──────────────────────────────────────────────────┘
```

## Wireframe — detalhe acompanhamento

```
┌──────────────────────────────────────────────────┐
│ NF 4521 — acompanhamento                         │
│ Nome      Rateio   Confirmou?  Recibo            │
│ Maria     800      ✓ 20/08     Assinado          │
│ Ana       700      ✓ 21/08     Liberado p/ assinar│
│ Clara    1500      ✗           Bloqueado         │
│ [ WhatsApp Clara ]                               │
│ ℹ Recibo só após confirmação de recebimento      │
└──────────────────────────────────────────────────┘
```

## Regras

- Uma NF pode cobrir **N doações** da mesma edição/unidade  
- Rateio deve reconciliar com o valor total da NF (alerta se divergir)  
- Sem confirmação de recebimento no Cliente → botão Assinar recibo **oculto/bloqueado**  
- Dinheiro (capital semente) **não** usa este fluxo de NF para liberar recibo  
- Auditoria: NF + recibos assinados ficam no repositório da doação  
