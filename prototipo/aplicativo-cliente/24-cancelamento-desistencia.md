# Cancelamento / Desistência

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/desistencia` (empreendedora) |
| **Perfil** | Empreendedora (quando habilitado) |
| **UCs** | UC30, UC29 |
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
│  Tipo *                         │
│  ( ) Desistência                │
│  ( ) Cancelamento               │
│  Motivo *                       │
│  [ Selecione           ▼ ]      │
│  Observações                    │
│  [________________________]     │
├─────────────────────────────────┤
│  [ Voltar ]  [ Confirmar ]      │
└─────────────────────────────────┘
```

---

## Regras

- Atualiza status para descontinuada/desistente (UC29)
- Interrompe liberações e lembretes automáticos (Mautic)
- Notifica gestor de turma
- Gestor também registra via [09-cancelamento-desistencia.md](../aplicativo-gestor/gestor-turma/09-cancelamento-desistencia.md)
