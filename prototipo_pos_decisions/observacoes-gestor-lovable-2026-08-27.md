# Observações App Gestor — reunião 27/ago/2026 (Lovable)

**App:** Aplicativo Gestor (Unidade + Turma)  
**Fonte:** reunião 27/ago + [`reunioes/sumario-2026-08-27.md`](../reunioes/sumario-2026-08-27.md)  
**UCs:** UC9, UC57, UC86, UC38  
**Telas base:** [`06-aprovar-doacao.md`](../prototipo/aplicativo-gestor/gestor-unidade/06-aprovar-doacao.md) · [`doacao-processo-unificado.md`](../prototipo/doacao-processo-unificado.md) · [`09-workshop-encerramento.md`](../prototipo/aplicativo-gestor/gestor-unidade/09-workshop-encerramento.md) · [`11-notas-fiscais.md`](../prototipo/aplicativo-gestor/gestor-unidade/11-notas-fiscais.md) · liberação de Aula ([`19-aula-unificada.md`](../prototipo/aplicativo-gestor/gestor-turma/19-aula-unificada.md))

> Colar no Lovable como prompt de ajuste. **Só Gestor** — Cliente e CMS fora deste pacote (exceto o que o Gestor precisa exibir).  
> **Fora deste pacote:** saúde financeira / dívidas (aguarda planilha Sandra); mentoria detalhada; aulas inaugurais.

---

## 0. Já está certo (não reabrir)

- Digitar **APROVAR** no pop-up de aprovação (Unidade, `/doacao`)
- Doação em **massa** (lote de finalistas)
- Funil online: 100% → live externa → KW → quiz 100% (Encerramento, **não** na tela Doação)
- Sugerir no empreendimento; **nunca** aprovar no card do negócio
- Natureza da **Aula**: **natureza original** no **CMS** (`presencial` / `ao_vivo`); na **liberação** (P/H) o gestor recebe o default e pode **trocar** até ministrar (ex.: chuva → ao vivo)

---

## 1. Doação — múltiplos itens (1:N)

**Onde:** modal **Iniciar doação** (negócios) + detalhe na tela **Doação** + aba **NF/Recibo**

- Uma doação = **N linhas** empilhadas: descrição do item + valor (R$).
- Soma das linhas = valor total da doação (exibir total no modal e na lista).
- Tipos continuam: **capital semente (dinheiro)** e **material** (por processo; linhas são itens dentro do tipo).
- UI: botão **[+ Adicionar item]**; cada linha com [remover]; valor total recalcula.
- Na lista `/doacao`: mostrar valor total; expandir linha para ver os itens.
- Material: os mesmos itens aparecem no recibo que a empreendedora só **visualiza** (Cliente); Gestor registra itens + anexa NF.

```
┌─────────────────────────────────┐
│ Iniciar doação — Doces da Maria │
│ Tipo * (•) Capital semente      │
│        ( ) Material             │
│ Itens *                         │
│  1. Geladeira duplex  [ 800 ] ✕ │
│  2. Micro-ondas       [ 400 ] ✕ │
│  [ + Adicionar item ]           │
│ Total R$ 1.200                  │
│ Justificativa * [________]      │
│ [ Cancelar ]  [ Enviar sugestão]│
└─────────────────────────────────┘
```

**Aberto (não implementar regra fechada ainda):** dinheiro + material no **mesmo** processo — manter listas separadas por tipo como hoje.

---

## 2. Orçamento por unidade (substitui teto único da edição)

**Cadastro dos valores:** **CMS de Administração** (por edição × unidade participante). O Gestor **não** define nem edita o teto — só **consome** e **visualiza** saldos da unidade na operação.

**Onde no Gestor:** painel `/doacao` (Unidade) — totalizadores **somente leitura**

- Trocar “teto único da edição” por **orçamento da unidade** (valor vindo do CMS).
- Faixas: **disponível** · **consumido** (só aprovadas) · **em análise** (sugeridas) · **saldo**.
- Sugeridas **não** entram no consumido (já era assim).
- Sem orçamento cadastrado no CMS para a unidade: aviso *“Orçamento não cadastrado para esta unidade”* — operação segue (não bloqueia).
- Estouro do disponível no pop-up APROVAR: aviso; Unidade pode seguir (igual aviso de teto antigo).
- **Sem** botão [Editar…] nem modal de alteração de valor no Gestor.

```
┌──────────────────────────────────────────────────┐
│ Orçamento — Unidade Joinville                    │
│ (definido no CMS da edição)                      │
│ Disponível R$ 40.000                             │
│ Consumido  R$ 16.500  │ Em análise R$ 9.200      │
│ Saldo      R$ 23.500  ████░░░░ 41%                │
└──────────────────────────────────────────────────┘
```

**Mock Lovable:** pré-preencher `orcamentoUnidade` por unidade na edição (como se viesse do CMS).

---

## 3. Pós-liberação no Gestor (aba Recibo / NF)

**Onde:** `/doacao` abas Recibo e NF (Unidade)

| Regra | UI |
|-------|-----|
| Recibo texto **até 60 dias** | Copy no preview/geração do recibo: “doação realizada em até 60 dias” |
| Material: gestor registra **itens + NF** | Empreendedora **não** sobe NF; só confirma recebimento e assina no Cliente |
| Assinatura **obrigatória** | Status “recibo pendente de assinatura”; sem assinatura o processo material não fecha |
| Itens no recibo | Preview lista os itens cadastrados na doação |

CPF-PIX imutável é regra do **Cliente** — no Gestor só exibir a chave como readonly na conferência, se houver tela de dados bancários.

---

## 4. Funil online — timestamp do quiz

**Onde:** `/encerramento/funil`

- Coluna ou detalhe: **data/hora exatas** da conclusão do questionário final (além do timestamp da KW).
- Export CSV inclui esses campos.
- Ranking/desempate pode usar KW e quiz timestamps (já indicado no wireframe).

```
│ Nome         KW              Quiz OK        Liberada? │
│ Maria Silva  22/08 15:12     22/08 15:41    Sim       │
│ Ana Costa    22/08 15:18     — (80%)        Não       │
```

---

## 5. Aula — natureza presencial / ao vivo (reforço)

**Onde:** liberação de atividade tipo **Aula** (P/H)

- **CMS** define **natureza original** (`presencial` ou `ao_vivo`) + título + descrição — ver [02-modulo-aula-evento.md](../prototipo/cms/02-modulo-aula-evento.md).
- Na **liberação**, natureza vem **pré-selecionada** do CMS; gestor pode **trocar** (ex.: chuva → ao vivo), com data/hora e link ou endereço coerentes, **até ministrar**.
- Gestor **não** altera título/descrição nem a estrutura do módulo — só operacionaliza.
- Não misturar com funil de doação online.

---

## 6. Checklist Lovable (ordem sugerida)

1. Modal sugerir doação → itens 1:N + total  
2. Lista `/doacao` → expandir itens; totalizadores por **unidade** (leitura; valor do CMS)  
3. Pop-up APROVAR → listar itens + aviso de saldo  
4. Aba Recibo/NF → copy 60 dias; itens no preview; assinatura pendente  
5. Funil → coluna timestamp quiz + CSV  
6. Liberação Aula → natureza default do CMS; trocar presencial/ao vivo até ministrar  

---

## 7. Não fazer neste prompt

- Campos de **saúde financeira** / dívidas no faturamento (rascunho)  
- Mentoria (aguarda e-mail)  
- Aulas inaugurais  
- Mudanças só do App Cliente (home faixa doação, formulário PIX) — pacote separado se necessário  
- **CMS Admin** — cadastro/edição do orçamento por unidade na edição (justificativa no CMS, se houver remanejamento); fora do escopo deste prompt Gestor
