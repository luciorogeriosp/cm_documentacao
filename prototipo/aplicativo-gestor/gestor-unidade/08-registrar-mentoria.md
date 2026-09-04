# Gestão de Mentorias

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/mentorias` |
| **Perfil** | Gestor de Unidade (Turma consulta) |
| **UCs** | UC70, UC73 |
| **Prioridade** | Especificado (MVP × Fase 2 a revisar) |

> Pacote completo: [encerramento-doacao-mentoria.md](encerramento-doacao-mentoria.md).  
> Consolidado: [Aplicativo Gestor.md §11.3](../../Aplicativo%20Gestor.md#11-encerramento--workshop-doação-mentorias).

---

## Objetivo

Painel de mentorias: status, match mentorada ↔ voluntário, repositório de documentos/feedbacks e histórico de evolução.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Mentorias — Edição 2027                          │
│ Filtro: [ A iniciar | Em andamento | Concluída | Pendente ]│
├──────────────────────────────────────────────────┤
│ Maria Silva — Mentor: Ana Voluntária             │
│ Status: Em andamento  [ Abrir ficha ]            │
├──────────────────────────────────────────────────┤
│ Ficha / Match                                    │
│ Mentorada * [▼]  Mentor * [▼ UC73]  [ Vincular ] │
│ Repositório: relatórios · feedbacks · devolutivas│
│ [ + Upload ]                                     │
│ Histórico de evolução (negócio / impacto)        │
│ [ Salvar status ]                                │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Mentores cadastrados no CMS (UC73); **não** acessam o sistema
- Preferir finalistas (UC85) ou quem recebeu doação (UC57)
- Distinto da doação (UC57) e do recibo (UC86)
