# Doação — PIX, recibo e aceites (UC86)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/doacao` · `/app/doacao/recibo` |
| **Perfil** | Empreendedora |
| **UCs** | UC86, UC57 |
| **Prioridade** | MVP |

---

## Objetivo

Após **doação aprovada** (Unidade, pop-up + digitar **APROVAR**): informar dados, aceites e assinar recibo (conta **725**). A empreendedora **não** vê a sugestão.

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
│  Banco / agência / conta *      │
│  [____________________]         │
│  Chave PIX (se houver)          │
│  [____________________]         │
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
│  [ Confirmar recebimento ]      │
│    ← só quando já tiver o bem   │
│  Recibo: 🔒 bloqueado           │
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

A faixa de **doação** só aparece **depois de aprovada**. Sugerida/recusada: **nada**.

| Estado | Mensagem curta |
| ------ | -------------- |
| *(vazio)* | Sem processo, sugerida ou recusada |
| Doação aprovada | Doação aprovada — aguarde orientações |
| Informe dados | Complete PIX/conta ou endereço |
| Material pendente | Confirme quando receber o produto |
| Recibo liberado | Assine o recibo |
| Concluído | Recebeu doação |

**Fora desta faixa:** “Liberada para doação” = estado do **funil online** (home/encerramento), **não** em P/H e **não** em `/app/doacao`.

---

## Regras

- Nome/CPF readonly (titularidade)  
- Conta + PIX opcional mas conta formal obrigatória para dinheiro  
- Material: NF fica no **Gestor** (1:N); Cliente só confirma recebimento e assina  
- Elegível/liberada/aprovada ≠ garantia até o fluxo completar  
