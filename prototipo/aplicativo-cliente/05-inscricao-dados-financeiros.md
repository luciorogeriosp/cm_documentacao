# Inscrição — Dados do empreendimento e econômicos

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/empreendimento` e `/e/[slug]/inscricao/economico` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21, UC12, UC23 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Cliente.md](../Aplicativo%20Cliente.md) blocos 3–4 |

---

## Objetivo

Coletar dados do negócio e da régua pontuável da inscrição (UC12 B), **quando o critério estiver ativo** na edição. **Internet** e **WhatsApp** **não bloqueiam** o cadastro: a empreendedora responde e o backend pontua depois (UC23).

---

## Wireframe — bloco 3 (empreendimento)

```
┌─────────────────────────────────┐
│  ●●●○  Bloco 3 — Empreendimento │
├─────────────────────────────────┤
│  Formalização * (não pontua)    │
│  ( ) Informal ( ) MEI ( ) ME    │
│  CNPJ * se MEI ou ME            │
│  Segmento / ramo *              │
│  Tempo de negócio * (se ativo)  │
│  ( ) Menos de 6 meses           │
│  ( ) 6 meses a 1 ano            │
│  ( ) Mais de 1 ano              │
│  Tem acesso à internet? *       │
│  (se ativo — não bloqueia)      │
│  ( ) Sim  ( ) Não               │
│  ( ) Internet móvel no celular  │
│  Tem WhatsApp? *                │
│  (se ativo — não bloqueia)      │
│  ( ) Sim  ( ) Não               │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Wireframe — bloco 4 (econômico)

```
┌─────────────────────────────────┐
│  ●●●●  Bloco 4 — Dados econômico│
├─────────────────────────────────┤
│  Renda familiar mensal *        │
│  (faixas de salário mínimo)     │
│  Valor aproximado (R$, opcional)│
│  Nº de pessoas na casa *        │
│  Nº de dependentes *            │
│  ℹ Per capita alimenta critério 2│
│  Tem carteira assinada (CLT)? * │
│  (se ativo) ( ) Sim  ( ) Não    │
│  É funcionária pública? *       │
│  (se ativo) ( ) Sim  ( ) Não    │
│  Faturamento mensal do negócio  │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Regras

- Campos da régua visíveis **somente se o critério estiver ativo** na edição (Admin/Strapi — UC12)
- Formalização = filtro/cadastro, **não pontua**
- Internet / WhatsApp: resposta negativa **não** encerra a inscrição
- Backend: renda per capita = renda familiar ÷ pessoas na casa (critério 2)
- CNPJ obrigatório quando MEI ou ME
- Validações de consistência básica (renda × faturamento)

---

## Navegação

- **Anterior:** [04-inscricao-dados-pessoais.md](04-inscricao-dados-pessoais.md) | **Próximo:** [06-inscricao-dados-programa.md](06-inscricao-dados-programa.md)
