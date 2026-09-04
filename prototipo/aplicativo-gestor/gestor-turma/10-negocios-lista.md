# Lista de negócios

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/negocios` |
| **Perfil** | **Unidade** e **Turma** (Turma = só a própria turma) |
| **UCs** | UC31, UC32, UC57 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §21 |

---

## Objetivo

Listar negócios (individual ou coletivo), cadastrar e **agrupar** empreendimentos duplicados (ex.: duas sócias informais com o mesmo nome fantasia cadastradas em registros distintos). Cada inscrição cria **1 empreendimento**; **não** há merge automático por nome.

**Doação:** o processo **inicia aqui** (CTA no card) em P/H e online (online só se *liberada*). **Não há Aprovar** nesta tela. A Unidade aprova em [Doação](../gestor-unidade/06-aprovar-doacao.md). Canônico: [doacao-processo-unificado.md](../../doacao-processo-unificado.md).

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Negócios — [ Turma A ▼ | Todas ▼ ]               │
│ Filtro: [ Recebeu doação ▼ ]                     │
│ [ + Novo negócio ]  [ Agrupar ]                  │
├──────────────────────────────────────────────────┤
│ ☐ Doces da Maria                                 │
│   Coletivo | Sem CNPJ | 2 empreendedoras         │
│   Maria, Ana · Doação: —                         │
│   [ Detalhe ]  [ Iniciar doação ]                │
│ ─────────────────────────────────────────────    │
│ ☐ Cooperativa Artesanato                         │
│   Coletivo | CNPJ ***.***.***/****-** | 4 sócias │
│   Doação: sugerida R$ 2.000                      │
│   [ Detalhe ]  [ Ver doação ]                    │
│ ─────────────────────────────────────────────    │
│ ☐ Ateliê Sul                                     │
│   Individual | 1 empreendedora                   │
│   Doação: aprovada R$ 1.500                      │
│   [ Detalhe ]  [ Ver doação ]                    │
└──────────────────────────────────────────────────┘
```

**Modal Agrupar** — selecionar **≥ 2** negócios:

```
┌──────────────────────────────────────────────────┐
│ Agrupar empreendimentos                          │
│ Qual negócio permanece? Os demais serão apagados.│
│ ( ) Doces da Maria (Maria)                       │
│ ( ) Doces da Maria (Ana)                         │
│ [ Cancelar ]  [ Confirmar ]                      │
└──────────────────────────────────────────────────┘
```

Vínculos das N empreendedoras passam ao sobrevivente. Demais linhas da tabela **empreendimento** são **apagadas**. Bloqueia (toast) se algum a apagar já tiver faturamento, tarefa, presença ou plano.

---

## Formulário novo negócio

| Campo | Obrigatório |
| ----- | ----------- |
| Nome | Sim |
| Tipo (individual/coletivo) | Sim |
| CNPJ | Opcional (obrigatório se MEI/ME) |
| Segmento | Opcional |
| Empreendedoras associadas | Sim (≥1) |

---

## Regras

- Turma só vê/agrupa negócios da própria turma; Unidade vê a unidade
- Mover **uma** pessoa sem apagar o negócio de origem = UC32 (detalhe)
- BI: 1 negócio com 2 sócias = **2** beneficiadas / certificadas / ativas e **1** doação
- **Iniciar doação:** modal no próprio negócio (tipo, valor, justificativa) → status `sugerida`. P/H sempre; online só *liberada*. Turma e Unidade; Turma só as suas. **Sem** botão Aprovar.
- **Ver doação:** Turma = status só leitura neste card. Unidade = abre a **linha em** `/doacao` (onde aprova).
- Recusada permite iniciar de novo. Coletivo: **1 processo** para o empreendimento, não por sócia.
