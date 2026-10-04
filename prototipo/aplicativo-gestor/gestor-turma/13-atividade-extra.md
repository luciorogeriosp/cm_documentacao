# Conteúdo extra

| Campo | Valor |
| ----- | ----- |
| **Rota** | Modal em sequência de atividades |
| **Perfil** | Gestor de Turma |
| **UCs** | UC35 |
| **Prioridade** | MVP |

---

## Objetivo

Adicionar **conteúdo extra** (encontro / material pontual) sem alterar a estrutura central do módulo/edição. **Não** conta % de conclusão, carga nem beneficiamento (reunião 24/ago.).

---

## Wireframe

```
┌─────────────────────────────────┐
│ Novo conteúdo extra             │
├─────────────────────────────────┤
│ Título *                        │
│ [ Oficina de fotografia    ]    │
│ Natureza: (•) Presencial ( ) Ao vivo │
│ Local * (se presencial)         │
│ [________________________]      │
│ Link * (se ao vivo)             │
│ [________________________]      │
│ Data * [__/__/____]             │
│ Hora * [__:__]                   │
│ Descrição                       │
│ [________________________]      │
│ [ ] Notificar participantes     │
│ [ Reagendar existente ]         │
│ ℹ Não entra no % / carga        │
├─────────────────────────────────┤
│ [ Cancelar ]  [ Adicionar ]     │
└─────────────────────────────────┘
```

---

## Regras

- Fora do catálogo de tipos de atividade; não impacta certificação, percentual nem beneficiamento
- Notificação via WhatsApp opcional (UC50)
- Aparece no calendário da turma (UC68)
- **Reagendar:** nova data/local/link + aviso no grupo
- **Alterar natureza:** troca presencial ↔ ao vivo **livre até ministrar** (mesma trava da Aula da matriz). Ao vivo não pede local; presencial não pede Meet. Depois da primeira presença, a natureza trava. Detalhe: [19-aula-unificada.md](19-aula-unificada.md) §8
- Só P/H (não existe em edição online)
