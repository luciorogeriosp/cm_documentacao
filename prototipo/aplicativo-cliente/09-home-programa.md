# Home — Programa e módulos

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app` ou `/app/edicao/[id]` |
| **Perfil** | Empreendedora |
| **UCs** | UC36, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Tela principal após autenticação: visão do programa, módulos, progresso geral e atividades liberadas. Inclui atalhos de **doação / recibo** quando aplicável.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [≡]  Olá, Maria!        [📅]   │
├─────────────────────────────────┤
│  Programa X — Edição 2027       │
│  Unidade: Centro | Turma: A     │
│  Status: Ativa                  │
│  ████████░░  72% concluído      │
│  ℹ WhatsApp = canal principal   │
├─────────────────────────────────┤
│  ⚠ Doação aprovada — aguarde    │
│    orientações da educadora     │
│    [ Dados / recibo → ]         │
├─────────────────────────────────┤
│  Próxima atividade              │
│  ┌─────────────────────────┐    │
│  │ 📹 Videoaula 3          │    │
│  │ Liberada — Iniciar →    │    │
│  └─────────────────────────┘    │
├─────────────────────────────────┤
│  Módulos                        │
│  ▼ Módulo 1 — Fundamentos  ✓    │
│  ▼ Encerramento online (ex.)    │
│    • Live YouTube           ✓   │
│    • Presença (KW)          →   │
│    • Questionário final     🔒  │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ Mentoria (se online + lote) │
│  │ Ir à área Mentoria →    │
│  └─────────────────────────┘    │
│  [ Calendário ]  [ Meu perfil ] │
└─────────────────────────────────┘
```

---

## Elementos

- Badge de status humanizado (UC29): **inscrita / aguardando seleção (ou entrevista) / aprovada / ativa / concluída / desistente** — evitar “matriculada”
- Frases curtas; WhatsApp = canal principal
- Cards de atividade com ícone por tipo (UC15)
- Indicador **em revisão** (não “reprovada”) nas entregas (UC44)
- Online sequencial; após live: **KW** → **questionário final 100%** ([26](26-presenca-palavra-chave.md), [13b](13b-questionario-final-doacao.md))
- Faixa doação **só após aprovada**: *aprovada — aguarde* / *informe dados* / *confirme recebimento* / *assine o recibo* → [27-doacao-pix-recibo.md](27-doacao-pix-recibo.md). Sem faixa se só sugerida. “Liberada para doação” = funil **online**, não esta faixa.
- **Sem** datas de pagamento na home
- **Mentoria (online + lote):** card na home aponta para o hub [29-mentorias-hub.md](29-mentorias-hub.md). P/H: item no menu inferior, sem card obrigatório na home.

---

## Navegação

- Cada atividade → tela específica (11–20, 26–27)
- Calendário → [10-calendario-atividades.md](10-calendario-atividades.md)
- Mentoria → [29-mentorias-hub.md](29-mentorias-hub.md) (menu inferior; card na home se online + lote)
