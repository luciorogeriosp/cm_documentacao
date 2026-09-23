# Briefing IA — Saúde financeira (Aplicativo Cliente)

Use este arquivo para **alterar só o Aplicativo Cliente já existente**. É a tela em que a empreendedora preenche o reporte do mês.

**Não implementar** Gestor, CMS, Voluntário, inscrição, doação, PIX, mentoria nem capital semente.

**Produto:** Consulado da Mulher. Empreendedora. Auth: **link mágico** (WhatsApp/e-mail). Sem senha.  
**Fonte:** reunião 09/set/2026 (capital de giro, reporte póstumo, layout em colunas) + 10/set/2026 (empréstimos em Entradas) + 27/ago/2026 (entradas/saídas, anexo, resultado negativo).  
**UCs:** UC45 (preenchimento); status de envio/revisão como a empreendedora já vê hoje (UC44).

---

## O que muda (em uma frase)

A atividade **Dados financeiros / Registro de Faturamento / Fluxo de caixa** vira **Saúde financeira**: ela **reporta o mês que já passou**, vê o histórico em **colunas** (como planilha) com **média**, e o resultado calculado se chama **capital de giro**.

---

## Conceitos (usar exatamente estes nomes)

| Termo antigo | Termo novo | Tipo |
| ------------ | ---------- | ---- |
| Dados financeiros / Fluxo de caixa / Registro de Faturamento | **Saúde financeira** | Título da atividade, card na home, calendário |
| Renda pessoal / Renda | **Renda/retirada** | Campo informado (R$) |
| Resultado / Resultado do negócio | **Capital de giro** | Campo **calculado** (pode ser negativo) |
| Despesas fixas | **Despesas** | Campo informado (R$) |
| — | **Dívidas** | Campo **novo** informado (R$) — valor **pago no mês** |

**Entradas** (bloco)

1. Faturamento (R$)
2. Empréstimos (R$) — financiamentos do negócio no mês
3. Nº de clientes
4. Nº de produtos vendidos

**Saídas** (bloco — **esta ordem**)

1. Despesas
2. Investimento
3. Poupança
4. Dívidas

**Depois dos blocos**

- Renda/retirada (R$) — o que ela tirou do negócio no mês
- Capital de giro — calculado, somente leitura

### Fórmulas

```
Entradas (R$) = Faturamento + Empréstimos
Saídas = Despesas + Investimento + Poupança + Dívidas
Capital de giro = Entradas − Saídas − Renda/retirada
```

- Capital de giro **pode ser negativo** (vermelho).
- Renda/retirada e Empréstimos **não podem ser negativos** (mínimo 0).
- Nº clientes e nº produtos: inteiros ≥ 0. **Não entram** na conta em R$.

### Sobra (só leitura pedagógica)

Não é campo preenchível.

```
Sobra = Faturamento + Empréstimos − Despesas − Dívidas − Renda/retirada
```

Depois do cálculo, uma frase (não um formulário):

| Situação | Copy |
| -------- | ---- |
| Sobra > 0 | “Neste mês sobrou R$ X depois das despesas, dívidas e da sua retirada. Você destinou R$ Y ao negócio e R$ Z à poupança.” |
| Sobra = 0 | “Neste mês não houve sobra depois das despesas, dívidas e da sua retirada.” |
| Sobra < 0 | “Neste mês as despesas, dívidas e a retirada superaram o faturamento em R$ X.” |
| Capital de giro < 0 | Acrescentar: “O capital de giro ficou negativo.” |

### Microcopy dos campos

| Campo | Ajuda (1 linha) |
| ----- | --------------- |
| Faturamento | Tudo o que o negócio recebeu no mês (vendas). |
| Empréstimos | Dinheiro emprestado / financiado para o negócio neste mês. |
| Nº de clientes | Quantas pessoas compraram no mês. |
| Nº de produtos | Quantas peças/serviços foram vendidos. |
| Despesas | Gastos obrigatórios do negócio (aluguel, matéria-prima, contas). |
| Investimento | Dinheiro que entrou no negócio (máquina, reforma, estoque extra) — não é dívida. |
| Poupança | Valor guardado no mês. |
| Dívidas | Quanto **pagou** de dívidas do negócio neste mês. |
| Renda/retirada | O que você tirou do negócio para você. |

Disclaimer fixo no topo:

> Isto é um **reporte do mês que já passou** — não é o seu controle do dia a dia. Preencha até o **10º dia útil** do mês seguinte.

---

## Regras da tela

- **1 registro por competência e empreendimento** (sócios compartilham a mesma grade).
- **Anexo obrigatório** (planilha, foto ou print). Sem anexo = não envia.
- **Dificuldade** obrigatória: 😣 🙁 😐 🙂 😄 (lado a lado).
- Faturamento = 0 **ou** Renda/retirada = 0 → justificativa obrigatória.
- Mês sem movimento: zeros + justificativa.
- Renda/retirada > Faturamento → **alerta** (não bloqueia), pede conferência.
- Link mágico WhatsApp continua abrindo esta atividade.
- Depois de **enviado**: aguardando aprovação; ela não edita.
- **Em revisão:** banner com o comentário da educadora + campos liberados de novo.
- **Aprovado:** grade travada, sem botão enviar.
- Só meses **aprovados** entram na coluna Média.

---

## Modelo de reporte

- Cada competência começa **em branco**. **Não** copiar valores do mês anterior. **Não** existe saldo inicial / saldo transportado.
- A coluna do mês corrente é a única editável; meses anteriores só aparecem se já tiverem registro (aprovado ou em análise).
- **Média** = média aritmética dos meses **aprovados** daquela edição (mesmo empreendimento). Sem aprovados: exibir “—”.
- Disparidade: se a média > 0 e o valor do mês diverge **mais de 30%**, destacar a célula (fundo âmbar). Vale para Faturamento, Empréstimos, Despesas, Investimento, Poupança, Dívidas, Renda/retirada e Capital de giro. Não aplicar em nº clientes/produtos.

---

## Tela da atividade

**Rota:** a mesma de hoje (`/app/atividade/[id]`, tipo `dados_financeiros` ou `saude_financeira`).  
**Título:** Saúde financeira.  
**Subtítulo:** `Mês de referência: Maio/2027` + status (rascunho / aguardando aprovação / em revisão / aprovado).

Layout **em colunas** (planilha). Sem abas, sem acordeão, sem dashboard de cards. Em mobile a tabela **rola na horizontal**; a coluna do mês atual fica pinada à direita (ou é a última visível).

```
Saúde financeira
Maio/2027 · Aguardando aprovação
ℹ Reporte do mês que já passou — prazo: 10º dia útil de junho.

              Média    Mar     Abr     Mai *
ENTRADAS
Faturamento   2.800   2.100   3.000   [ 3.200 ]
Empréstimos       0       0       0   [     0 ]
Nº clientes      18      14      20   [    22 ]
Nº produtos      40      32      45   [    48 ]

SAÍDAS
Despesas      1.100   1.000   1.200   [ 1.150 ]
Investimento    200       0     400   [   200 ]
Poupança        150     100     200   [   150 ]
Dívidas         180     200     160   [   180 ]

Renda/retirada  900     800   1.000   [   900 ]
Capital de giro 270       0      40   [   620 ]

Neste mês sobrou R$ 970 depois das despesas, dívidas e da sua
retirada. Você destinou R$ 200 ao negócio e R$ 150 à poupança.

Quão difícil foi preencher? *   [😣][🙁][😐][🙂][😄]
Planilha ou foto do mês *       [ + Anexar ]
[ Enviar para avaliação ]
```

`*` = coluna editável. Células de meses passados e a coluna Média são somente leitura. Capital de giro da coluna atual atualiza ao digitar.

Primeiro mês da edição: só Média (—) + coluna atual.

---

## Copy na home e no calendário

| Onde | Texto |
| ---- | ----- |
| Card da atividade | Saúde financeira — Maio/2027 |
| Prazo | Até o 10º dia útil de junho |
| Status revisão | Em revisão — confira o comentário da educadora |

Não criar item novo no menu inferior nem no hambúrguer. A atividade continua no módulo, como hoje.

---

## Fora deste incremento

- Qualquer tela ou fila do **Aplicativo Gestor**.
- Dívida pessoal vs dívida do negócio como dois campos.
- Saldo devedor acumulado (estoque de dívida).
- Carry-forward / saldo inicial.
- Campo “renda/retirada desejada”.
- Decisão interativa “amortizar × reinvestir × poupar” (a copy da sobra já cobre o conceito).
