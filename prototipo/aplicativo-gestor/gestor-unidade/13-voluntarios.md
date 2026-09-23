# Voluntários (recorte da edição)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/voluntarios` |
| **Perfil** | Unidade e Turma — atalho para **alocar mentoria** |
| **UCs** | UC73, UC70 |
| **Prioridade** | Especificado |

Menu **irmão** de Mentorias na edição. **Não** é o CRM da rede. Cadastro único; o `edicaoId` só filtra quem serve para o lote desta edição.

Rede nacional, aprovação `em_analise`, inativos e ações: **Gestor de Voluntariado** — [02-gestao-voluntarios.md](../gestor-voluntariado/02-gestao-voluntarios.md).

Canônico: [UC73](../../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md). Portal: [Aplicativo Voluntario.md](../../Aplicativo%20Voluntario.md).

---

## Recorte

Lista voluntários `ativo` com modalidade individual (e módulo CMS, para operar) filtráveis por **área**, para montar o lote. Unidade **e** Turma (P/H, própria turma) **alocam**.

```
┌──────────────────────────────────────────────────┐
│ Voluntários desta edição                         │
│ Tipo [ Individual ▼]  Área [ Finanças ▼]         │
│ ☑ Só expertise     Busca [____________]          │
├──────────────────────────────────────────────────┤
│ Ana Costa · Indiv. · ativo · treino ✓            │
│ Expertise: Finanças                              │
│ [ Abrir ficha ] [ Alocar no lote → ]             │
└──────────────────────────────────────────────────┘
```

## Ficha

Ver horas/sessões · abrir **card** das mentorias em curso nesta edição · **Vincular a aula coletiva** da turma (modalidade coletiva + expertise). **Não** aprova cadastro nem abre ação aqui.

Fallback “vincular” exige perfil UC73; **não** lista colaborador interno.
