# Atividade — Aula ao vivo / Live de encerramento

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` |
| **Perfil** | Empreendedora |
| **UCs** | UC38 |
| **Prioridade** | MVP |

> **Palavra-chave de doação** não fica nesta tela. Online pós-live: [26-presenca-palavra-chave.md](26-presenca-palavra-chave.md).

---

## Variante A — Aula (P/H)

Sessão **aula** presencial ou Meet (gestor define link **ou** endereço). Presença no acesso / QR. **Não** há KW de doação.

```
┌─────────────────────────────────┐
│  [←]  Aula — Oficina de vendas  │
├─────────────────────────────────┤
│  📍 Local: Rua X, 100           │
│  [ Abrir no mapa ]              │
│  — ou —                         │
│  🔗 [ Abrir Meet ]              │
│  [ WhatsApp da educadora ]      │
├─────────────────────────────────┤
│  Instruções do encontro         │
│  [ Marcar presença / Abrir ]    │
└─────────────────────────────────┘
```

---

## Variante B — Live de encerramento (online)

Gate do funil de doação. Só liberada se **100%** das atividades. Stream **fora** da plataforma (YouTube). **Sem** campo de palavra-chave aqui.

```
┌─────────────────────────────────┐
│  [←]  Live de encerramento      │
│  Empreende no Zap 2027          │
├─────────────────────────────────┤
│  ✓ Você concluiu 100% — pode    │
│    assistir a live              │
│  📅 20/08 · 19h                 │
│  [ Assistir no YouTube ]        │
│  ℹ Depois que a live terminar,  │
│    abre a presença (palavra)    │
│  (sem botão “já terminei”)      │
└─────────────────────────────────┘
```

### Bloqueada (&lt; 100%)

```
┌─────────────────────────────────┐
│  Live de encerramento           │
│  🔒 Conclua 100% das atividades │
│  Progresso: 18/22               │
│  [ Ver pendências ]             │
└─────────────────────────────────┘
```

---

## Estados

| Estado | UI |
| ------ | -- |
| Agendada | Data/hora + link quando liberado |
| Ao vivo / disponível | Abrir YouTube ou Meet / local |
| Encerrada | Replay se houver; funil online segue para KW |
| Bloqueada online | Mensagem 100% obrigatório |

**Visita técnica (Cliente).** Mesma ideia visual: data, hora, local ou link, **Abrir no mapa**, WhatsApp da educadora. Tag **Agendada / Realizada** só leitura — ela não marca realizada.

**Legado removido:** KW embutida na live + avaliação 0–100 / 24h.
