# Processo de doação — portão diferente, processo igual

**Apps:** [Gestor](Aplicativo%20Gestor.md) e [Cliente](Aplicativo%20Cliente.md)  
**Telas:** [empreendimentos](aplicativo-gestor/gestor-turma/10-negocios-lista.md) (sugerir) · [Doação Unidade](aplicativo-gestor/gestor-unidade/06-aprovar-doacao.md) (aprovar) · [Cliente UC86](aplicativo-cliente/27-doacao-pix-recibo.md)  
**UCs:** UC57, UC86; portão online = UC38

O caminho **até** poder sugerir muda com a modalidade. A **sugestão**, a **aprovação** e o **pós-aprovação** são os mesmos nos dois apps e nas duas jornadas.

```
Portão (só isto muda)
  P/H     → qualquer empreendimento, a qualquer momento
  Online  → só liberada pelo funil UC38 (100% → live → KW → quiz 100%)

Processo (idêntico)
  Empreendimento: Iniciar doação     → status sugerida
  Tela Doação (só Unidade): Aprovar  → pop-up + digitar APROVAR
                         ou Recusar  → motivo *
  Cliente UC86                       → dinheiro ou material
  Status concluída
```

**Fora deste processo:** funil Live/KW (Encerramento online), módulo de encerramento P/H (carga), parecer capital semente (UC58), certificado (UC55).

---

## 1. Portão

| | P/H | Online |
| - | --- | ------ |
| **Iniciar doação** no negócio | Sempre (turma/unidade) | Só se **liberada para doação** (UC38) |
| Sem portão | — | CTA oculto / *Conclua o funil* |
| Funil Live/KW | Não existe aqui | Telas `/encerramento/live` e `/encerramento/funil` — **não** misturar na página Doação |

1 doação por empreendimento (coletivo = 1 processo). Tipos: **capital semente (dinheiro)** e **material**. Teto único em R$ da edição no CMS (UC9).

---

## 2. Quem vê o quê

| Onde | Turma | Unidade |
| ---- | ----- | ------- |
| Negócios — **Iniciar doação** | Sim (respeita o portão) | Sim |
| Negócios — Aprovar | **Não** | **Não** |
| Menu **Doação** `/doacao` | **Oculto** (sem rota) | Visível |
| Tela Doação — lista, totais, aprovar, recusar, Recibo, NF | — | Sim |

Se a Unidade também sugeriu, a aprovação continua **passo separado** (`sugerido_por` / `aprovado_por`), **só** na tela Doação.

Atalho na participante: **Iniciar / Ver** o processo do empreendimento — nunca aprovar.

A empreendedora **não** vê a sugestão. Faixa no Cliente só após `aprovada`.

---

## 3. Status

| Status | Gestor | Cliente |
| ------ | ------ | ------- |
| **Sugerida** | Linha na tela Doação (Unidade). Turma vê só no negócio (leitura) | Nada (não gerar expectativa) |
| **Aprovada** | Após pop-up + digitação; entra no **consumido**; abre UC86 | **Doação aprovada — aguarde** (sem datas) |
| **Recusada** | Motivo visível; negócio pode iniciar de novo | Sem faixa |
| **Concluída** | Recibo/aceites ok | **Recebeu doação** |

Sugerida **não** consome o teto. Aprovada entra mesmo sem recibo.

---

## 4. Gestor — sugerir no empreendimento

Modal no card/detalhe (Turma e Unidade). Sem seletor de pessoa. Sem [Aprovar].

```
┌─────────────────────────────────┐
│ Iniciar doação — Doces da Maria │
│ Tipo * (•) Capital semente      │
│        ( ) Material             │
│ Valor (R$) * [ 1500 ]           │
│ Justificativa * [________]      │
│ [ Cancelar ]  [ Enviar sugestão]│
└─────────────────────────────────┘
```

Com processo aberto: **Ver doação** — Turma = status só leitura no próprio negócio. Unidade = abre a **linha na tela Doação**.

---

## 5. Gestor — tela Doação (só Unidade)

Rota `/gestor/e/[edicaoId]/doacao`. Turma que acessar a URL: recusa / redirect para negócios.

Mesmo painel em P/H e online (online: só *liberadas*).

```
┌──────────────────────────────────────────────────┐
│ Doação — processos              (só Unidade)     │
│ Abas: [ Processos ] [ Recibo ] [ NF ]            │
│ Sugeridas  CS 4 · R$ 6.000 | Mat. 2 · R$ 3.200   │
│ Aprovadas  CS 8 · R$ 12.000 | Mat. 3 · R$ 4.500  │
│ Consumido  R$ 16.500 / R$ 40.000  (teto CMS)     │
├──────────────────────────────────────────────────┤
│ Doces da Maria · Dinheiro · R$ 1.500 · Sugerida  │
│   Ana sugeriu 20/03  [ Aprovar… ] [ Recusar ]    │
└──────────────────────────────────────────────────┘
```

### Pop-up — digitar APROVAR

Um único pop-up (substitui os 2 cliques em 2 modais).

```
┌──────────────────────────────────────────────────┐
│ Confirmar aprovação?                             │
│ Doces da Maria · Capital semente · R$ 1.500      │
│ Sugerido por Ana                                 │
│ ⚠ Não é garantia de pagamento/entrega imediata.  │
│ ⚠ A empreendedora verá “aguarde”. Sem datas.     │
│ ⚠ Consumido passará a R$ 18.000 / R$ 40.000      │
│                                                  │
│ Digite APROVAR para confirmar                    │
│ [________________________]                       │
│ [ Cancelar ]  [ Confirmar ]  ← desabilitado      │
└──────────────────────────────────────────────────┘
```

- Campo deve ser **APROVAR** (exato, maiúsculas). Botão **Confirmar** só habilita quando bate.
- Estouro de teto: aviso no mesmo pop-up; Unidade pode seguir.
- Só então status `aprovada` e valor no consumido.

**Recusar:** outro pop-up, motivo obrigatório — **sem** digitar APROVAR.

**Massa:** um pop-up com N empreendimentos + valor total; digitar **APROVAR** uma vez para o lote.

---

## 6. Cliente — só após aprovada

Faixa na home e `/app/doacao` **iguais** em P/H e online:

| Ordem | Faixa |
| ----- | ----- |
| 1 | *(vazia)* — sem processo, sugerida ou recusada |
| 2 | **Doação aprovada — aguarde orientações** (sem datas) |
| 3 | **Informe dados** (PIX/conta ou endereço + ponto de referência) |
| 4 | Dinheiro: **Assine o recibo** (725, **antes** do pagamento) · Material: **Confirme o recebimento** → depois **Assine o recibo** |
| 5 | **Recebeu doação** |

**“Liberada para doação”** = estado do **funil online**, não desta tela e **não** em P/H.

UC86 (igual):

- **Dinheiro:** nome/CPF readonly → conta/PIX → aceites → recibo 725 antes do pagamento.
- **Material:** endereço → Gestor NF 1:N → confirma recebimento → recibo libera → assina.
