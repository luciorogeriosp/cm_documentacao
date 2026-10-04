# Cancelamento / Desistência

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/desistencia` (empreendedora) |
| **Perfil** | Empreendedora (quando habilitado) |
| **UCs** | UC79, UC30, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar solicitação de cancelamento ou desistência com motivo padronizado.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Desistir do programa      │
├─────────────────────────────────┤
│  Tem certeza? Esta ação encerra │
│  sua participação ativa.        │
├─────────────────────────────────┤
│  Motivo *                       │
│  [ Selecione           ▼ ]      │
│  Falta de tempo                 │
│  Dificuldades no negócio        │
│  Problemas pessoais ou saúde    │
│  Expectativas                   │
│  Mudança de rotina              │
│  Outro programa                 │
│  Outro                          │
│  Conte um pouco *               │
│  [________________________]     │
├─────────────────────────────────┤
│  [ Voltar ]  [ Confirmar ]      │
└─────────────────────────────────┘
```

---

## Regras

- Motivo da lista **e** detalhe obrigatório (UC79)
- Atualiza status para desistente (UC29); sai das filas de jornada e de alertas
- Notifica gestor de turma
- Gestor também registra via [09-cancelamento-desistencia.md](../aplicativo-gestor/gestor-turma/09-cancelamento-desistencia.md)
