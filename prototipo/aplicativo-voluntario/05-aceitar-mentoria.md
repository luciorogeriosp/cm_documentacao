# Pegar / ver mentoria

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/voluntario/mentorias/[id]` |
| **Perfil** | Voluntário |
| **UCs** | UC70 |
| **Prioridade** | Especificado |

## P/H — pegar em Em aberto

Card estado A. **Pegar mentoria** (só com módulo CMS concluído) → ela vira líder; demanda some de Em aberto; vai para **Minhas** com card estado B (nome, sócios, WhatsApp, e-mail).

```
┌──────────────────────────────────────────────────┐
│  ←  Em aberto · Finanças                         │
│  [ card estado A — só negócio ]                  │
│  [ Pegar mentoria ]                              │
└──────────────────────────────────────────────────┘
          ↓
┌──────────────────────────────────────────────────┐
│  Você é a líder                                  │
│  [ card estado B — contato visível ]             │
│  [ WhatsApp ] [ E-mail ]                         │
│  Entre em contato para agendar a 1ª consulta.    │
│  [ Ir a Minhas ]                                 │
└──────────────────────────────────────────────────┘
```

Se o **gestor** já alocou o lote, esta tela não aparece em Em aberto — só em **Minhas** para quem está no lote (líder ou acompanhante). Treino pendente: vê o card; líder não agenda ainda.

## Online

Campo **`vagas`**. Aceite decrementa; pool aberto até completar. Card sem telefone até o aceite; depois `wa.me`. Diário próprio.
