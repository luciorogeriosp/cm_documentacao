# Pré-cadastro

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/pre-cadastro` |
| **Perfil** | Lead |
| **UCs** | UC19, UC20, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Capturar lead mínimo (nome, telefone, e-mail) e consentimentos antes do formulário completo de inscrição.

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●○○○○  Etapa 1 de 5            │
├─────────────────────────────────┤
│  Pré-cadastro                   │
│  Preencha para começar sua      │
│  inscrição no programa.         │
├─────────────────────────────────┤
│  Nome completo *                │
│  [________________________]     │
│  Telefone (DDD) *               │
│  [(__) _____-____]              │
│  E-mail *                       │
│  [________________________]     │
├─────────────────────────────────┤
│  [bloco termos UC20]            │
├─────────────────────────────────┤
│  [ Continuar ]                  │
└─────────────────────────────────┘
```

---

## Validações

- Nome: mínimo 3 caracteres
- Telefone: formato BR com DDD
- E-mail: formato válido

---

## Pós-ação

- Grava lead "pré-cadastro concluído"
- Persiste identificador no **localStorage**
- Redireciona para inscrição completa (UC21)

---

## Navegação

- **Anterior:** [01-landing-edicao.md](01-landing-edicao.md)
- **Próximo:** [04-inscricao-dados-pessoais.md](04-inscricao-dados-pessoais.md)
