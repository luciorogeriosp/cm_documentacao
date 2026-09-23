# Login — Aplicativo Gestor (link mágico)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/login` · callback `/gestor/auth/callback?token=…` |
| **Perfil** | Gestor de Unidade, Gestor de Turma, Gestor de Voluntariado |
| **UCs** | UC3 (link mágico — sem senha) |
| **Prioridade** | MVP |

> Fonte completa: [Aplicativo Gestor.md §1](../../Aplicativo%20Gestor.md#1-login-link-mágico).

---

## Objetivo

Autenticar gestores **somente por link mágico**: o usuário informa o e-mail, recebe o link e entra direto na aplicação.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [Logo]  Aplicativo Gestor      │
│  Consulado da Mulher            │
├─────────────────────────────────┤
│  Informe seu e-mail para        │
│  receber o link de acesso       │
│  E-mail *                       │
│  [________________________]     │
├─────────────────────────────────┤
│  [ Enviar link de acesso ]      │
└─────────────────────────────────┘
```

---

## Pós-login

- **Gestor de Voluntariado:** entra **direto** em `/gestor/voluntariado` (home + menu contextual). **Não** há página de edições neste perfil.
- **Unidade / Turma:** **Dashboard de edições** (`/gestor`) → ao selecionar uma edição, home operacional + menu (Unidade = todas **sem Campanhas**)

---

## Regras

- Sem senha / sem “esqueci minha senha”
- Token de uso único e curta validade; sessão com timeout
- Mensagem genérica se o e-mail não existir (não enumerar usuários)
