# Atividade — Presença via QR Code ou Deep Link

| Campo | Valor |
| ----- | ----- |
| **Rota** | `?turma_id=&atividade_id=&acao=presenca` |
| **Perfil** | Empreendedora |
| **UCs** | UC40, UC67, UC54 |
| **Prioridade** | MVP |

---

## Objetivo

Com **UUID + sessão válidos** (UC67), abrir link/QR registra presença **automaticamente** (UC40). Caso contrário, autentica (UC4) e registra.

## URL exemplo

`/app/...?turma_id=abc&atividade_id=xyz&acao=presenca`

QR Code do gestor codifica a mesma URL (UC54).
