# Comunicação WhatsApp

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/comunicacao` |
| **Perfil** | Gestor de Turma (Gestor de Unidade em seleção) |
| **UCs** | UC49, UC50, UC51, UC54 |
| **Prioridade** | MVP |

---

## Objetivo

Disparar mensagens **individuais** via Gupshup (UC49, UC51, UC54) ou **facilitar comunicação manual em grupo WhatsApp** (UC50).

---

## Wireframe — Mensagem individual (UC49)

Ver [Aplicativo Gestor de Turma.md](../../Aplicativo%20Gestor%20de%20Turma.md) — seção Comunicação WhatsApp.

---

## Wireframe — Comunicar para Grupo (UC50)

- Botão **"Comunicar para Grupo"**
- Campos variáveis (local, data, hora, etc.)
- Pré-visualização da mensagem
- Ao confirmar: **copia para clipboard** + **abre link do grupo** (UC16/UC66) em nova aba

---

## Regras

- **Individual (UC49):** Gupshup + templates Meta + link mágico (UC54).
- **Grupo (UC50):** manual — sem Gupshup; sem confirmação de entrega pelo sistema.
- Mautic (UC52/UC53): apenas UC49/UC54.
