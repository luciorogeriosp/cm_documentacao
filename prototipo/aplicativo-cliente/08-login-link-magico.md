# Entrada por link mágico

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/auth/magic?token=...&turma_id=&atividade_id=&acao=` |
| **Perfil** | Empreendedora |
| **UCs** | UC4, UC54, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Validar token e autenticar. Persiste **UUID** no localStorage (UC67). Deep links com `turma_id`, `atividade_id`, `acao` executam ação automaticamente se sessão válida.

## Regras

- UUID gravado/atualizado após auth (UC67)
- `acao=presenca` → UC40 automático
- Sessão ~30 dias; UUID opaco (não CPF)

---

## Navegação

- **Sucesso:** [09-home-programa.md](09-home-programa.md) ou atividade alvo
