# Inscrição — Dados pessoais

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/pessoal` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21, UC22, UC12 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Cliente.md](../Aplicativo%20Cliente.md) |

---

## Objetivo

Coletar identificação (incluindo **nome social**), documento, endereço via CEP e **dados sensíveis no meio da ficha**. A unidade **não** é escolhida pela empreendedora (alocação automática ou UC17).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●●○○  Bloco 2 — Dados pessoais │
├─────────────────────────────────┤
│  Nome de registro *             │
│  [________________________]     │
│  Nome social (como prefere ser  │
│  chamada)                       │
│  [________________________]     │
│  CPF * (ou RNE p/ estrangeira)  │
│  [___.___.___-__]               │
│  Data de nascimento *           │
│  ℹ Menor de 18: cadastro        │
│     encerrado (UC12)            │
│  CEP *  [_____-___] [Buscar]    │
│  Endereço, bairro, cidade, UF   │
│  (auto-preenchido pelo CEP)     │
├─────────────────────────────────┤
│  Dados sensíveis (meio da ficha)│
│  Raça/cor, deficiência, etc.    │
│  ( ) informar  ( ) Prefiro não  │
│      responder                  │
├─────────────────────────────────┤
│  ℹ Histórico em programas       │  ← somente leitura (UC22/62)
│  anteriores (via hash de CPF)   │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Campos principais

| Campo | Regra |
| ----- | ----- |
| Nome de registro | Obrigatório |
| Nome social | Opcional; nome de exibição no app |
| CPF | Validação; hash no backend; recorrente pré-preenche se já validado |
| RNE | Alternativa para estrangeiras |
| CEP | Valida elegibilidade geográfica; auto-preenche endereço |
| Dados sensíveis | No meio da ficha; **"Prefiro não responder"** grava "não informado" e não entra no BI |
| Data de nascimento | **Bloqueio** se idade &lt; 18 (UC12; não pontua) |

---

## Fluxos alternativos

- **Menor de 18 anos:** encerra inscrição (bloqueio de cadastro — UC12)
- **Recorrente (UC22):** alerta informativo de programas anteriores; pré-preenche apenas dados da base ativa
- **Edição encerrada durante preenchimento:** bloqueia envio com mensagem

---

## Navegação

- **Anterior:** pré-cadastro | **Próximo:** [05-inscricao-dados-financeiros.md](05-inscricao-dados-financeiros.md)
