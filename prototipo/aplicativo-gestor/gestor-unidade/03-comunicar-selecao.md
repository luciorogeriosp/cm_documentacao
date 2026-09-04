# Comunicar resultado da seleção

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/selecao/comunicar` |
| **Perfil** | **Só Unidade** |
| **UCs** | UC25, UC76, UC33, UC84 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §6 · v6 UC25 |

---

## Objetivo

Disparo **manual** (WhatsApp template Gupshup e/ou e-mail). UI com **somente três faixas** — sem grupos soltos (“em análise”, “qualificadas genéricas”, etc.).

| Faixa | Público | Libera jornada? | Trava |
| ----- | ------- | --------------- | ----- |
| **1 — Convite à entrevista** | Qualificadas **alocadas em sessão** (UC84) | Não | Sem alocação em sessão → lista vazia / enviar desabilitado |
| **2 — Liberação / início** | **P/H:** aprovadas **+ turma** (+ link grupo WA). **Online:** qualificadas + vínculos | **Sim** | Sem turma (P/H) ou sem vínculos (online) → bloqueia |
| **3 — Não qualificada / não aprovada** | Não qualificadas, não aprovadas, **ausentes** (auto), demais | Não | — |

P/H sem API: fallback **`wa.me` individual**. Contador de jornadas liberadas + histórico. Anonimiza CPF não aprovadas 1 dia após fim da seleção (UC76).

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Comunicar resultado da seleção                   │
│ Jornadas liberadas nesta edição: 22              │
├──────────────────────────────────────────────────┤
│ Faixa: ( ) 1 — Convite à entrevista              │
│        (•) 2 — Liberação / início do programa    │
│        ( ) 3 — Não qualificada / não aprovada    │
│                                                  │
│ Lista (só quem passa na trava): 18 pessoas       │
│ ⚠ Sem alocação em turma → enviar bloqueado       │
│                                                  │
│ Canal: [ WhatsApp API ▼ ] [ E-mail ]             │
│ Template * [ Boas-vindas + grupo ▼ ]             │
│ P/H liberar: exige turma + código grupo WA       │
│ Fallback: [ Abrir wa.me individual ]             │
├──────────────────────────────────────────────────┤
│ [ Enviar individual ] [ Enviar em lote ]         │
│ Histórico de envios…                             │
└──────────────────────────────────────────────────┘
```

**Faixa 1 (exemplo):**

```
│ Faixa: (•) 1 — Convite à entrevista              │
│ Lista: 12 alocadas em sessão (Cidade/UF · Bairro)│
│ Template * [ Convite entrevista — 12/03 14h ▼ ]  │
│ ℹ Nunca envia convite sem sessão atribuída       │
```

**Faixa 3 (exemplo):**

```
│ Faixa: (•) 3 — Não qualificada / não aprovada    │
│ Inclui ausentes (auto não aprovadas na UC84)     │
│ Template * [ Agradecimento — não segue ▼ ]       │
```

---

## Regras

- Disparo via backend + Gupshup / SendGrid
- Templates Meta aprovados
- Retry em falhas (EC1 UC25)
- **Nunca** convite de entrevista sem alocação em sessão (etapa 2)
- **Nunca** comunicar liberação / “aprovada” sem alocação em **turma**
- Online: faixa 1 oculto; faixa 2 = qualificada + turma única → UC33
- Ausentes da entrevista entram na faixa 3 (já **não aprovadas**)
