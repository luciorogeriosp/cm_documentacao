# Doação — processos (só Gestor de Unidade)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/doacao` |
| **Perfil** | **Só Unidade** (Turma não vê o menu nem a rota) |
| **UCs** | UC57, UC85 (auxiliar), UC14, UC86 |
| **Prioridade** | MVP |
| **Canônico** | [doacao-processo-unificado.md](../../doacao-processo-unificado.md) |

> Pacote: [encerramento-doacao-mentoria.md](../encerramento-doacao-mentoria.md) · NF: [11-notas-fiscais.md](11-notas-fiscais.md)  
> Sugerir: [10-negocios-lista.md](../gestor-turma/10-negocios-lista.md) — **nunca** aprovar no empreendimento.

---

## Objetivo

Painel dos **processos de doação** já sugeridos nos empreendimentos. Aqui a Unidade **aprova** (pop-up + digitar **APROVAR**) ou **recusa**. Turma não acessa esta tela.

O **portão** muda; o **processo** não:

| Modalidade | Quem entra na lista |
| ---------- | ------------------- |
| **P/H** | Qualquer processo sugerido — a qualquer momento |
| **Online** | Só empreendimentos ***liberada para doação*** (funil UC38) |

Copy: *“Liberada / elegível não garante o recebimento. A doação só vale após aprovação da Unidade.”*

Doação = **1 por empreendimento**. Funil Live/KW **não** fica nesta página.

---

## Painel (P/H e online — mesmo chrome)

```
┌──────────────────────────────────────────────────┐
│ Doação — processos              (só Unidade)     │
│ Abas: [ Processos ] [ Recibo ] [ NF ]            │
│ [ Lote auxiliar A–D ]  (opcional)                │
│ [ Doação em massa… ]                             │
│ ℹ Elegível ≠ garantia · teto cadastrado no CMS   │
├──────────────────────────────────────────────────┤
│ Sugeridas                                        │
│   Capital semente  4  R$ 6.000                   │
│   Material         2  R$ 3.200                   │
│ Aprovadas                                        │
│   Capital semente  8  R$ 12.000                  │
│   Material         3  R$ 4.500                   │
│ Consumido / disponível                           │
│   R$ 16.500 / R$ 40.000   41%  ████░░░░  saldo R$ 23.500 │
├──────────────────────────────────────────────────┤
│ Filtro: [ Tipo ▼ ] [ Status ▼ ] [ Turma ▼ ]      │
│ Empreendimento     Tipo     Valor    Status      │
│ Doces da Maria     Dinheiro 1.500    Sugerida    │
│   Ana sugeriu 20/03  [ Aprovar… ] [ Recusar ]    │
│ Cooperativa Art.   Material 2.000    Aprovada    │
│   → Recibo / NF                                  │
│ Ateliê Sul         Dinheiro 1.500    Concluída   │
│ Padaria Centro     Material 800      Recusada    │
│   motivo: carência D                             │
└──────────────────────────────────────────────────┘
```

Online: totalizadores e lista **só** de processos cujo empreendimento está *liberado*. Link **Ver funil** no header da edição online (não nesta lista).

**Teto ausente no CMS:** *“Teto não cadastrado na edição”* — não bloqueia. Unidade vê o aviso.

Turma que abrir `/doacao`: redirect para `/negocios`.

### Totalizadores

| Faixa | O que conta | O que não conta |
| ----- | ----------- | --------------- |
| **Sugeridas** (qtd + R$ por tipo) | Status `sugerida` | Recusadas, aprovadas, concluídas |
| **Aprovadas** (qtd + R$ por tipo) | Após pop-up + **APROVAR**, com ou sem recibo/NF | Sugeridas, recusadas |
| **Consumido / disponível** | `soma(aprovadas.valor) / teto_cms` | Sugeridas **não** consomem. Teto = R$ único da edição (UC9) |

Tipos: **capital semente (dinheiro)** e **material**. Barra de consumo **única**.

### Status

| Status | Quem age |
| ------ | -------- |
| **Sugerida** | Unidade aprova (digitação) ou recusa (motivo *) **nesta tela** |
| **Aprovada** | UC86 (PIX/recibo ou NF) |
| **Recusada** | Motivo visível; negócio pode **Iniciar doação** de novo |
| **Concluída** | Recibo/aceites ok |

---

## Pop-up — digitar APROVAR

Substitui o rito de dois cliques em dois modais. Um único pop-up.

```
┌──────────────────────────────────────────────────┐
│ Confirmar aprovação?                             │
│ Doces da Maria · Capital semente · R$ 1.500      │
│ Sugerido por Ana                                 │
│ ⚠ Não é garantia de pagamento/entrega imediata.  │
│ ⚠ A empreendedora verá “aguarde”. Sem datas.     │
│ ⚠ Consumido passará a R$ 18.000 / R$ 40.000      │
│                                                  │
│ Digite APROVAR para confirmar *                  │
│ [________________________]                       │
│ [ Cancelar ]  [ Confirmar ]  ← só se APROVAR     │
└──────────────────────────────────────────────────┘
```

- Texto **APROVAR** exato, maiúsculas. Botão desabilitado até bater.
- Estouro (`consumido + valor > teto`): aviso no mesmo pop-up; Unidade **pode seguir**. Faixa: *“X% acima do teto”*.
- Só então status `aprovada` e valor no **consumido**.

**Recusar:** pop-up separado, motivo obrigatório — **sem** digitar APROVAR.

---

## Doação em massa

Seleção de **empreendimentos** (não de pessoas). Online: só *liberadas*.

```
┌──────────────────────────────────────────────────┐
│ Doação em massa                                  │
│ ☐ Doces da Maria  ☐ Cooperativa  ☐ Ateliê Sul    │
│ Modalidade: [Capital semente ▼] [Material ▼]     │
│ Valor (R$): ____                                 │
│ [ Sugerir lote ]  ou  [ Aprovar lote… ]          │
└──────────────────────────────────────────────────┘
```

Aprovar lote: um pop-up com N nomes + valor total; digitar **APROVAR** **uma** vez.

---

## Regras

| Quem | Pode |
| ---- | ---- |
| Turma | **Sugerir** no empreendimento; consultar status no negócio. Sem tela Doação |
| Unidade | Sugerir no empreendimento; **aprovar / recusar só aqui**; Recibo, NF, lote |

- Aprovar **nunca** no card/detalhe do negócio.
- Após aprovar → UC86 (dados + recibo conforme tipo).
- Parecer **Capital semente UC58** é outra tela — não misturar.
