# CMS — Alertas / Automações (aba Comunicação)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/admin/comunicacao/alertas` · `/admin/comunicacao/alertas/nova` · `/admin/comunicacao/alertas/[id]` |
| **Perfil** | Administrador do Sistema / Administrador de Programa |
| **UCs** | UC87, UC52, UC88 |
| **Prioridade** | MVP (núcleo) / Fase 2 (tipos avançados) |
| **Fonte** | [Casos de Uso v7 — UC87/UC88](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) |
| **Hub** | [03-comunicacao-templates.md](03-comunicacao-templates.md) |

> **Mautic removido.** Alertas de engajamento/resgate ficam na **mesma área CMS** que os pacotes de jornada (UC88). Templates Meta/Gupshup vêm do **catálogo unificado**.

---

## Objetivo

Criar **N alertas** de forma amigável: escolher tipo de gatilho → preencher parâmetros → canais/templates → cadência → condição de saída. Sem editor de fluxos livres.

---

## Lista

```
┌──────────────────────────────────────────────────────────────┐
│ Alertas / Automações                    [ + Nova regra ]     │
├──────────────────────────────────────────────────────────────┤
│ Filtro: [Tipo ▼] [Canal ▼] [Ativas ▼]   Busca: [________]    │
├──────────────────────────────────────────────────────────────┤
│ Nome                    Tipo              Canais   Edições   │
│ Inscrição incompleta    inscription_…     ✉ WA     3  [●]    │
│ Prazo em 4h             activity_dead…    ✉        2  [●]    │
│ Maratone o backlog      backlog_liber…    WA       1  [○]    │
│ Fim do curso            edition_ending…   ✉ WA     2  [●]    │
│ Risco curto online      risk_short_…      WA       2  [●]    │
│ Check-point D+15        checkpoint_…      ✉        1  [○]    │
└──────────────────────────────────────────────────────────────┘
```

---

## Criar / editar regra

Linguagem: **Quando… / Espere… / Envie… / Pare quando…**

```
┌──────────────────────────────────────────────────────────────┐
│ Nova regra de alerta                                         │
├──────────────────────────────────────────────────────────────┤
│ 1. Quando (tipo de gatilho) *                                │
│    (•) Inscrição incompleta                                  │
│    ( ) Prazo de atividade se aproximando                     │
│    ( ) Backlog de conteúdos liberados (online)               │
│    ( ) Fim da edição com pendências                          │
│    ( ) Risco de evasão curto (online)                        │
│    ( ) Check-point no meio do curso                          │
├──────────────────────────────────────────────────────────────┤
│ 2. Espere / parâmetros                                       │
│    Atraso inicial: [ 2 ] dias                                │
│    Reforço a cada: [ 3 ] dias   Máx. envios: [ 2 ]           │
│    ℹ Campos mudam conforme o tipo escolhido                  │
├──────────────────────────────────────────────────────────────┤
│ 3. Envie                                                     │
│    Canais: [☑ E-mail] [☑ WhatsApp]                           │
│    Template e-mail: [ Lembrete inscrição ▼ ] [ Editar ]      │
│    Template Meta WA: [ lead_incompleta_v1 ▼ ]                │
│    Placeholders: {nome} {edicao} {link_magico} {prazo} …     │
├──────────────────────────────────────────────────────────────┤
│ 4. Pare quando                                               │
│    (•) Inscrição completa                                    │
│    ( ) Atividade concluída / ( ) Saiu do estado / …          │
├──────────────────────────────────────────────────────────────┤
│ Audiência: modalidade [ Todas ▼ ]  Escopo [ Programa ▼ ]     │
│ Janela comercial WA: [☑ Respeitar]                           │
│ [ Simular audiência na edição… ]  [ Enviar teste ]           │
│ [ Salvar rascunho ]  [ Ativar ]                              │
└──────────────────────────────────────────────────────────────┘
```

### Params por tipo (resumo)

| Tipo | Campos do formulário |
| ---- | -------------------- |
| `inscription_incomplete` | delayDays, repeatDays, maxSends |
| `activity_deadline_soon` | hoursBeforeDeadline |
| `backlog_liberated` | minLiberatedPending |
| `edition_ending_pending` | daysBeforeEnd |
| `risk_short_online` | herda limiares da edição (UC9) |
| `checkpoint_midcourse` | dayFromStart, windowDays |

---

## Regras de UX

- Não expor AND/OR arbitrários nem nós de fluxo.
- WhatsApp exige template Meta aprovado.
- Simular audiência antes de ativar em produção.
- Histórico de edições da regra (auditoria).
