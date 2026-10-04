# Gestão de voluntários

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/voluntariado/voluntarios` |
| **Perfil** | Gestor de Voluntariado |
| **UCs** | UC73, UC74, UC70, UC90 |
| **Prioridade** | Especificado |

Visão **nacional** da rede (não “nesta edição”). Unidade, na edição, vê só o recorte para **alocar mentoria** — [13-voluntarios.md](../gestor-unidade/13-voluntarios.md).

Aprovar cadastro em análise mora **aqui**.

---

## Filtros e recortes

Filtros combináveis: tipo **Individual | Coletiva | Ações**; área (interesse ou expertise; chip só expertise); nome; status em análise / ativo / inativo; módulo CMS.

Recortes:

- **Em atividade** — mentoria `aceita`/em andamento, coletiva vinculada ou ação confirmada
- **Inativos há mais tempo** — inativo **ou** sem diário/aceite além do limiar CMS (default **90 dias**)
- **Atuando em mentorias** — no lote de alguma mentoria aberta/em andamento

```
┌──────────────────────────────────────────────────┐
│ Gestão de voluntários                            │
│ [ Em atividade ] [ Inativos há mais tempo ]      │
│ [ Atuando em mentorias ] [ Em análise ]          │
│ Tipo [ Ações ▼]  Área [ Comunicação ▼]           │
│ ☑ Só expertise     Busca [____________]          │
├──────────────────────────────────────────────────┤
│ Ana Costa · Indiv. + Ações · ativo ✓             │
│ Interesse: Gestão · Expertise: Finanças          │
│ Última atuação: 12/07 (88 dias)                  │
│ [ Abrir ficha ]                                  │
└──────────────────────────────────────────────────┘
```

## Ficha

Aprovar · Inativar · Horas/sessões e diário · Cards de mentorias em curso · Ações confirmadas · **Convidar para ação**. **Não** lista colaborador interno como voluntário.
