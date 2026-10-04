# Doação — PIX, recibo e aceites (UC86)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/doacao` · `/app/doacao/recibo` |
| **Perfil** | Empreendedora |
| **UCs** | UC86, UC57 |
| **Prioridade** | MVP |

---

## Objetivo

Um só caminho. A gestora **aprova valor e donatários**. Ela **preenche os passos** (isso **não** é solicitar doação — a empreendedora **nunca** pede no Cliente). A gestora **acompanha fez / não fez** e **pode preencher no lugar**. Sem form paralelo de R$ 1.000 e sem tela de geladeira (material = este fluxo).

Canônico: [doacao-processo-unificado.md](../doacao-processo-unificado.md).

| Modalidade | Recibo |
| ---------- | ------ |
| **Dinheiro** (capital semente) | Assinar **antes** do pagamento |
| **Material** | **Confirmar recebimento** → só então o recibo é liberado para assinatura |

Sempre: mensagem **“aguarde”** — **não** mostrar datas de pagamento.

---

## 1. Dados bancários / PIX

```
┌─────────────────────────────────┐
│  Dados para a doação            │
│  Nome [ Maria Silva     ] 🔒    │
│  CPF  [ ***.***.***-** ] 🔒    │
│  ℹ Nome e CPF não editáveis     │
├─────────────────────────────────┤
│  Banco (busca pelo nome) *      │
│  [____________________]         │
│  Agência / conta *              │
│  PIX: CPF 🔒 ou telefone/e-mail │
│  Titular = você (não terceiros) │
│  [ Salvar ]                     │
├─────────────────────────────────┤
│  ℹ Aguarde orientações da       │
│    educadora. Sem prazo de      │
│    pagamento nesta tela.        │
└─────────────────────────────────┘
```

### Material — endereço

```
┌─────────────────────────────────┐
│  Endereço de entrega *          │
│  + ponto de referência *        │
│  [____________________]         │
│  [ Salvar ]                     │
└─────────────────────────────────┘
```

---

## 2. Dinheiro — assinar recibo

```
┌─────────────────────────────────┐
│  Recibo de doação (conta 725)   │
│  Capital semente · R$ 1.500     │
│  [ Ler e assinar ]              │
│  Aceites [ ✓ ]                  │
│  ℹ Assine antes do pagamento    │
└─────────────────────────────────┘
```

---

## 3. Material — confirmar → assinar

### Aguardando produto

```
┌─────────────────────────────────┐
│  Doação material aprovada       │
│  Status: Aguarde a entrega /    │
│  retirada com sua educadora     │
│  [ + Foto da nota (opcional) ]  │
│  [ Confirmar recebimento ]      │
│  Recibo: 🔒 até confirmar       │
└─────────────────────────────────┘
```

### Após confirmar recebimento

```
┌─────────────────────────────────┐
│  ✓ Recebimento confirmado       │
│  Recibo liberado                │
│  [ Assinar recibo 725 ]         │
│  Aceites [ ✓ ]                  │
└─────────────────────────────────┘
```

---

## Estados na home

| Estado | Quando | Mensagem curta |
| ------ | ------ | -------------- |
| Aguarde aprovação | Liberada pelo funil (online), ainda sem UC57 | Elegível ≠ ganhou — agora é torcer |
| Informe os dados | Aprovada | Complete PIX/conta ou endereço |
| Recibo | Dados ok; dinheiro assina antes; material depois de confirmar | Assine o recibo |
| Recebeu | Passos dela concluídos | Recebeu doação |

Sugerida ou recusada: **sem faixa**. Sem datas prometidas. Sem banner de valor fixo.

---

## Regras

- Nome/CPF só leitura; PIX no CPF imutável; telefone e e-mail podem ser chave
- Banco: busca pelo nome (código do Banco Central)
- Material: ela confirma, **pode anexar foto da nota**; a gestora também anexa ou revisa as notas e os itens
- Gestora vê fez / não fez e pode preencher no lugar
- Elegível / liberada / aprovada ≠ garantia até concluir os passos
