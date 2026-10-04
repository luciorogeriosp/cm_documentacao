# Home — Programa e módulos

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app` ou `/app/edicao/[id]` |
| **Perfil** | Empreendedora |
| **UCs** | UC36, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Duas camadas: **lista de programas** (rodapé Programas) e **home da edição** (módulos, Continue daqui, faixas).

---

## Wireframe — lista de programas

```
┌─────────────────────────────────┐
│  [≡]  Olá, Maria!        [👤]   │
│  2 em curso · 1 aguardando      │
├─────────────────────────────────┤
│  Empreende Mulher               │
│  Edição 2027 · Centro · Turma A │
│  4 de 9 atividades              │
│  Próxima: Videoaula 3           │
│  [ Continue daqui ]             │
├─────────────────────────────────┤
│  Empreende no Zap               │
│  Edição ago · turma única       │
│  8 de 8 · [ Continue daqui ]    │
├─────────────────────────────────┤
│  🔒 Programa (ex.: Mulheres do  │
│     Nosso Bairro)               │
│  Aguardando seleção             │
│  (sem CTA)                      │
│ Programas · Certificados · Ajuda│
└─────────────────────────────────┘
```

O nome do card bloqueado é **exemplo** de estado, não catálogo.

## Wireframe — home da edição

```
┌─────────────────────────────────┐
│  [←]  Programa X — Edição 2027  │
│  Unidade: Centro | Turma: A     │
│  Status: Ativa                  │
│  ████████░░  4 de 9             │
├─────────────────────────────────┤
│  ⚠ Doação — informe os dados    │
│    [ Continuar → ]              │
├─────────────────────────────────┤
│  Continue daqui                 │
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
│  │ Mentoria                 │
│  │ Ir ao hub →              │
│  └─────────────────────────┘    │
└─────────────────────────────────┘
```

---

## Elementos

- Badge de status humanizado (UC29): **inscrita / aguardando seleção (ou entrevista) / aprovada / ativa / concluída / desistente** — evitar “matriculada”
- Frases curtas; WhatsApp = canal principal
- Cards de atividade com ícone por tipo (UC15)
- Indicador **em revisão** (não “reprovada”) nas entregas (UC44)
- Online sequencial; após live: **KW** → **questionário final 100%** ([26](26-presenca-palavra-chave.md), [13b](13b-questionario-final-doacao.md))
- Faixa doação **só após aprovada**: *aprovada — aguarde* / *informe dados* / *confirme recebimento* / *assine o recibo* → [27-doacao-pix-recibo.md](27-doacao-pix-recibo.md). Sem faixa se só sugerida. “Liberada para doação” = funil **online**, não esta faixa. **Sem** CTA de solicitar doação — ela nunca pede no Cliente.
- **Sem** datas de pagamento na home
- **Mentoria:** card na home da edição aponta para o hub [29-mentorias-hub.md](29-mentorias-hub.md). **Não** está no rodapé. Online: o card só depois do lote de encerramento.
- **Continue daqui** = próxima atividade liberada (não “próxima aula” genérica).
- Após o quiz 100% (online): copy **elegível ≠ ganhou / agora é torcer** — ainda não é a faixa de doação aprovada.

---

## Navegação

- Cada atividade → tela específica (11–20, 26–27)
- Calendário → menu do header [10-calendario-atividades.md](10-calendario-atividades.md)
- Mentoria → [29-mentorias-hub.md](29-mentorias-hub.md) (pelo programa)
- Rodapé: Programas · Certificados · Ajuda IA
