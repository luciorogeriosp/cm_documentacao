# Inserir dados em nome da participante

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/participantes/[id]/inserir` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC69, UC43, UC45, UC47 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar atividades ou dados quando a participante não consegue acessar o Aplicativo Cliente.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Inserir em nome de — Maria Silva                 │
├──────────────────────────────────────────────────┤
│ Tipo de registro *                               │
│ [ Tarefa de casa          ▼ ]                    │
│ Atividade * [ Módulo 2 — Tarefa 1 ▼ ]            │
├──────────────────────────────────────────────────┤
│ [ Formulário dinâmico conforme tipo ]            │
│ • Tarefa: upload de arquivos                     │
│ • Financeiro: campos mensais                     │
│ • Indicadores: questionário                      │
├──────────────────────────────────────────────────┤
│ Justificativa *                                  │
│ [ Participante sem smartphone... ]               │
├──────────────────────────────────────────────────┤
│ [ Cancelar ]  [ Registrar ]                      │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Log de auditoria: gestor, data, justificativa
- Mesmas validações do Aplicativo Cliente
- Entregas seguem fluxo de aprovação se aplicável
