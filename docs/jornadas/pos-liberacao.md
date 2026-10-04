# Pós-liberação da doação e desistência

**Comum** às jornadas [online](online.md) e [presencial/híbrido](presencial-hibrido.md).  
**Convenções:** [README](README.md)  
**Fontes:** [Casos de Uso v7](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) UC30, UC55, UC57, UC79, UC86

Chega-se aqui **depois** da aprovação da Unidade na tela Doação (UC57: pop-up + digitar **APROVAR**). No online, a empreendedora já passou pelo funil (liberada para doação) **e** pela aprovação. No presencial ou híbrido, só a aprovação manual — a sugestão pode ter sido da Turma ou da Unidade.

Índice

1. [Dinheiro — PIX / conta e recibo 725](#1-dinheiro--pix--conta-e-recibo-725)
2. [Material — NF 1:N, confirmação e recibo](#2-material--nf-1n-confirmacao-e-recibo)
3. [Certificado em cascata](#3-certificado-em-cascata)
4. [Desistência UC30 / UC79](#4-desistencia-uc30--uc79)

O Cliente mostra **aguarde** — sem datas prometidas de pagamento ou entrega.

---

## 1. Dinheiro — PIX / conta e recibo 725

Nome e CPF são **readonly** (cadastro). Recibo da conta **725** é assinado **antes** do pagamento.

```mermaid
sequenceDiagram
  autonumber
  participant Backend
  participant AppCliente
  participant Empreendedora
  participant GestorUnidade

  Note over Backend,AppCliente: AUTO apos aprovacao UC57 - modalidade dinheiro
  Backend -->> AppCliente: solicita dados bancarios / PIX e aceites
  AppCliente -->> Empreendedora: nome e CPF readonly; conta/PIX editaveis
  AppCliente -->> Empreendedora: status aguarde - sem datas

  Note over Empreendedora,AppCliente: MANUAL empreendedora UC86
  Empreendedora ->> AppCliente: informa banco agencia conta ou chave PIX
  Empreendedora ->> AppCliente: conclui aceites da edicao
  AppCliente ->> Backend: persiste dados

  Note over GestorUnidade: GESTOR confere
  GestorUnidade ->> Backend: valida dados bancarios

  Note over Empreendedora,AppCliente: MANUAL assinar recibo ANTES do pagamento
  Backend -->> AppCliente: libera recibo conta 725
  Empreendedora ->> AppCliente: assina recibo
  AppCliente ->> Backend: recibo assinado
  Note over GestorUnidade: GESTOR opera pagamento fora do app - sem data na tela da empreendedora
```

| Passo | Momento | Tipo | Quem | Canal | O que NÃO faz |
| ----- | ------- | ---- | ----- | ----- | ------------- |
| 1–3 | Pedir dados | AUTO | Backend | App Cliente | Não promete data de crédito |
| 4–6 | Informar PIX/conta | MANUAL | Empreendedora | App Cliente | Não altera nome/CPF |
| 7 | Conferir | GESTOR | Unidade | App Gestor | Não é aprovação da doação (já ocorreu) |
| 8–10 | Recibo 725 | MANUAL | Empreendedora | App Cliente | Dinheiro: assinatura **antes** do pagamento |

---

## 2. Material — NF 1:N, confirmação e recibo

Uma nota fiscal pode cobrir **N** doações. O recibo só libera **depois** que a empreendedora confirma o recebimento. Endereço de entrega: número, complemento e **ponto de referência**.

```mermaid
sequenceDiagram
  autonumber
  participant Backend
  participant AppCliente
  participant Empreendedora
  participant GestorUnidade

  Note over Backend,AppCliente: AUTO apos aprovacao UC57 - modalidade material
  Backend -->> AppCliente: solicita endereco com ponto de referencia e aceites
  AppCliente -->> Empreendedora: status aguarde - sem datas de entrega

  Note over Empreendedora,AppCliente: MANUAL empreendedora
  Empreendedora ->> AppCliente: numero complemento ponto de referencia
  Empreendedora ->> AppCliente: aceites
  AppCliente ->> Backend: persiste endereco

  Note over GestorUnidade: GESTOR NF 1:N
  GestorUnidade ->> Backend: anexa NF e vincula N doacoes
  GestorUnidade ->> Backend: registra entrega operacional

  Note over Empreendedora,AppCliente: MANUAL confirma recebimento
  Empreendedora ->> AppCliente: confirma que recebeu o material
  AppCliente ->> Backend: recebimento confirmado
  Backend -->> AppCliente: libera recibo 725

  Note over Empreendedora: MANUAL assinar recibo APOS a entrega
  Empreendedora ->> AppCliente: assina recibo
  AppCliente ->> Backend: recibo assinado
```

| Passo | Momento | Tipo | Quem | Canal | O que NÃO faz |
| ----- | ------- | ---- | ---- | ----- | ------------- |
| 1–5 | Endereço + aceites | AUTO + MANUAL | Backend / Empreendedora | App Cliente | Sem data de entrega na tela |
| 6–7 | NF 1:N | GESTOR | Unidade | App Gestor | Uma NF → várias doações; não substitui a confirmação da empreendedora |
| 8–10 | Confirmar recebimento | MANUAL | Empreendedora | App Cliente | Sem confirmação o recibo **permanece bloqueado** |
| 11–12 | Recibo 725 | MANUAL | Empreendedora | App Cliente | Material: assinatura **depois** da entrega |

Estados materiais: aprovada → NF vinculada → confirma recebimento → recibo liberado → assinado.

---

## 3. Certificado em cascata

Independente da doação. Quando o **empreendimento** atinge o % de beneficiamento / certificação da edição (em geral 50% / 75% — UC13), o backend emite PDF para **cada sócia**.

Pode ocorrer durante a formação (ao cruzar o limiar) ou no encerramento — o gatilho é o percentual, não a doação.

```mermaid
sequenceDiagram
  autonumber
  participant Backend
  participant Gupshup
  participant Empreendedora
  participant GestorTurma

  Note over Backend: AUTO UC55 - calculo no empreendimento
  Backend -->> Backend: pct de atividades que contam no negocio
  alt atinge beneficiamento e/ou certificacao
    Backend -->> Backend: classifica empreendimento
    Backend -->> Backend: atualiza status de cada socia da edicao
    Backend -->> Gupshup: PDF certificado por socia
    Gupshup -->> Empreendedora: certificado no WhatsApp
  else ainda abaixo do limiar
    Note over GestorTurma: GESTOR acompanha - sem certificado
  end
```

| Passo | Momento | Tipo | Quem | Canal | O que NÃO faz |
| ----- | ------- | ---- | ---- | ----- | ------------- |
| 1–5 | Emitir certificado | AUTO | Backend | Gupshup | Não concede doação; BI conta N pessoas e 1 empreendimento |
| else | Abaixo do % | GESTOR | Turma | App Gestor | Exceções pontuais; não altera o cálculo padrão |

Doação = **1 por empreendimento**, mesmo com N sócias certificadas.

---

## 4. Desistência UC30 / UC79

Pode ocorrer em **qualquer fase** das duas jornadas. Remove a participante das automações: FilaJornada (online), FilaAlertas, e liberações futuras.

```mermaid
sequenceDiagram
  autonumber
  participant Empreendedora
  participant AppCliente
  participant GestorTurma
  participant GestorUnidade
  participant Backend
  participant FilaJornada
  participant FilaAlertas

  alt solicitacao da empreendedora UC79
    Note over Empreendedora,AppCliente: MANUAL empreendedora
    Empreendedora ->> AppCliente: pede desligamento
    Empreendedora ->> AppCliente: questionario + razao do abandono
    AppCliente ->> Backend: registra solicitacao
  else cancelamento pela gestao UC30
    Note over GestorTurma,GestorUnidade: GESTOR
    GestorTurma ->> Backend: registra cancelamento ou desistencia
    GestorTurma ->> Backend: motivo padronizado + observacao + mes/ano
  end

  Note over Backend,FilaAlertas: AUTO remove das jornadas
  Backend -->> Backend: status descontinuada / desistente
  Backend -->> FilaJornada: cancela eventos pendentes
  Backend -->> FilaAlertas: cancela disparos pendentes
  Backend -->> GestorTurma: notifica turma
```

| Passo | Momento | Tipo | Quem | Canal | O que NÃO faz |
| ----- | ------- | ---- | ---- | ----- | ------------- |
| alt UC79 | Pedido no Cliente | MANUAL | Empreendedora | App Cliente | Formalização completa segue UC30 |
| else UC30 | Registro da gestão | GESTOR | Turma ou Unidade | App Gestor | Data completa fica no log; UI usa mês/ano para frequência |
| 8–11 | Sair das filas | AUTO | Backend | FilaJornada + FilaAlertas | Não apaga histórico já ocorrido; interrompe o que ainda estava pendente |

No presencial ou híbrido, `FilaJornada` não está ativa; o cancelamento ainda interrompe alertas e tira a participante das liberações/comunicação operacional.
