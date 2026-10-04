# Meu perfil

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/perfil` |
| **Perfil** | Empreendedora |
| **UCs** | UC27, UC79 |
| **Prioridade** | MVP |

---

## Objetivo

Perfil: progresso geral, atalho para Meus dados, desistência e **Sair da conta**. Meus dados edita cadastro, exceto CPF.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meu perfil                │
│  Progresso geral  4 de 9  44%   │
│  (anel)                         │
├─────────────────────────────────┤
│  [ Meus dados → ]               │
│  Nome, nome social, e-mail,     │
│  telefone, endereço             │
│  CPF 🔒 não edita nem aparece   │
│  como campo                     │
├─────────────────────────────────┤
│  [ Solicitar desistência ]      │
│  [ Sair da conta ]              │
└─────────────────────────────────┘
```

---

## Regras

- Meus dados: nome, nome social, e-mail, telefone, endereço. **CPF não edita.**
- Unidade / turma: somente gestor altera
- **Sair da conta** encerra a sessão; novo acesso = outro link mágico
- **Mentoria** não fica no perfil — entra pelo programa: [29-mentorias-hub.md](29-mentorias-hub.md)
