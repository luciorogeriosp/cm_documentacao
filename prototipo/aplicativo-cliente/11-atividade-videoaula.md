# Atividade — Videoaula

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: videoaula) |
| **Perfil** | Empreendedora |
| **UCs** | UC36, UC37 |
| **Prioridade** | MVP |

---

## Objetivo

Assistir videoaula no YouTube e registrar progresso para conclusão e certificação.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Videoaula: Precificação   │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │   [Player YouTube]      │    │
│  └─────────────────────────┘    │
│  Progresso: ██████░░  65%       │
│  Meta para conclusão: 70%         │
├─────────────────────────────────┤
│  Descrição e materiais            │
│  [ PDF complementar ]           │
├─────────────────────────────────┤
│  [ Marcar como concluída ]      │  ← habilitado ao atingir meta
└─────────────────────────────────┘
```

---

## Regras

- Engajamento = conclusão da atividade (meta % configurável, ex. 70%)
- Ao concluir: desbloqueia próxima etapa (jornada online sequencial)
- Player embed YouTube responsivo
