# Módulos — acompanhar e liberar atividades

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/modulos` (ou seção na turma) |
| **Perfil** | Ambos |
| **UCs** | UC34, UC15, UC35, UC68 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §23 · [19-aula-unificada.md](19-aula-unificada.md) |

---

## Objetivo

**Hub de execução:** liberar (P/H), acompanhar e configurar atividades por módulo (accordion). Telas de Pendências (aprovações, presença, visitas) **abrem aqui** via `?atividade=`.

---

## Matriz por modalidade

| Tipo | P/H | Online |
| ---- | :-: | :----: |
| Aula, Visita Técnica | ✓ | — |
| Video Aula, Atividade, Faturamento, Tarefa, Download, Plano de Ação, Questionários, NPS | ✓ | ✓ |
| “+ conteúdo extra” (UC35) — não conta % | ✓ | — |

Online: sem data/hora/local na config; sem “Comunicar grupo WhatsApp” (UC50); liberação por temporizador (UC33).

---

## Cancelar / reativar liberação

- **Cancelar liberação** só se não houver chamada nem entregas.
- Badge **cancelada**; fora de adesão, totalizadores e Pendências.
- **Liberar novamente** reabre a configuração.
- Com registros: botão desabilitado + aviso.

---

## Wireframe (resumo)

```
┌──────────────────────────────────────────────────┐
│ Módulos — Turma A                    0/73        │
│ [+ Conteúdo extra] ← só P/H · não conta %        │
│ Módulo: Finanças (0/16)                       V  │
│   Liberada · Aula (presencial) …                 │
│   Liberada · Videoaula … [Cancelar liberação]    │
│   Cancelada · Tarefa …   [Liberar novamente]     │
│   Faturamento — Em aprovação                     │
│     Dificuldade turma: 😣🙁😐🙂😄 (resumo)         │
└──────────────────────────────────────────────────┘
```

---

## Regras

- P/H: gestor escolhe o que liberar (UC34); Online: só acompanha
- Prazo padrão D+2; atraso com penalidade de engajamento
- Calendário sincronizado com Cliente (UC68) quando aplicável
- **Aula** é um único tipo no módulo. **CMS** define natureza original + título + descrição; na **liberação** o gestor informa data/hora/local ou link, com natureza pré-preenchida e editável até ministrar — spec: [19-aula-unificada.md](19-aula-unificada.md) · CMS: [02-modulo-aula-evento.md](../../cms/02-modulo-aula-evento.md)
