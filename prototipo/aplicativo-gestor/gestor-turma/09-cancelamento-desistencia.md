# Cancelamento / Desistência (gestor)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/participantes/[id]/cancelamento` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC30, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar cancelamento ou desistência pela gestão com motivo padronizado.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Registrar cancelamento/desistência               │
│ Participante: Maria Silva                        │
├──────────────────────────────────────────────────┤
│ Tipo * ( ) Cancelamento ( ) Desistência          │
│ Motivo * [ Selecione                    ▼ ]      │
│ Manter como beneficiada parcial? ( ) Sim ( ) Não │
│ Observações                                      │
│ [________________________________]               │
├──────────────────────────────────────────────────┤
│ [ Cancelar ]  [ Confirmar registro ]             │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Atualiza status UC29
- Interrompe jornada Mautic e lembretes
- Motivos padronizados para indicadores qualitativos
