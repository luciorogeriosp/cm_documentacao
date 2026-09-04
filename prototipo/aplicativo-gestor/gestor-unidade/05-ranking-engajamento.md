# Ranking e engajamento

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/unidade/engajamento` |
| **Perfil** | Gestor de Unidade |
| **UCs** | UC56 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar indicadores de engajamento por turma/edição para apoiar decisão de doação (UC57). Filtro **recebeu doação**. **Casos de sucesso** (flag + formulário).

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Ranking e engajamento — Edição 2027              │
│ Filtros: [Turma ▼] [Módulo ▼] [Período ▼]       │
│          [Recebeu doação ▼]                      │
├──────────────────────────────────────────────────┤
│ #  Nome           Conclusão  Prazo  Frequência   │
│ 1  Maria Silva    95%        ✓      100%  ★      │
│ 2  Ana Costa      88%        ✓      90%          │
│ 3  Joana Lima     72%        ⚠      75%          │
├──────────────────────────────────────────────────┤
│ ℹ Engajamento = conclusão de atividades          │
│ Ranking não determina doação automaticamente     │
│ [ Ir para doação ]  [ Caso de sucesso ]          │
└──────────────────────────────────────────────────┘
```

---

## Métricas

- Taxa de conclusão de atividades (não só visualização de vídeo)
- Entregas no prazo
- Frequência presencial
- Pontuação interna de testes (opcional, não exibida à participante)
