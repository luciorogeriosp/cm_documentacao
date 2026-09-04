# Detalhe da turma

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/turmas/[id]` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC16, UC17 |
| **Prioridade** | MVP |

---

## Objetivo

Visão completa da turma: participantes, cronograma, gestor e ações operacionais.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ [←] Turma A — Programa Empreenda 2027            │
│ Abas: [Participantes] [Cronograma] [Config]      │
├──────────────────────────────────────────────────┤
│ Participantes (18)                               │
│ [ Alocar selecionadas ] [ Transferir ]           │
│ Nome          Status        Progresso  Ações     │
│ Maria Silva   Em assessoria  85%      [···]      │
│ Ana Costa     Em assessoria  72%      [···]      │
├──────────────────────────────────────────────────┤
│ [ Sequência de atividades ] [ Presença ]         │
│ [ Comunicar turma ]                              │
└──────────────────────────────────────────────────┘
```

---

## Ações por participante (menu ···)

- Ver detalhe
- Editar dados (UC27)
- Inserir dados em nome (UC69)
- Transferir turma (UC18)
- Cancelamento/desistência (UC30)
