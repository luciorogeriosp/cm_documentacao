# Alocar em turma (Seleção — etapa 3)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/selecao/alocar` |
| **Perfil** | **Só Unidade** (não é ação do Gestor de Turma) |
| **UCs** | UC17, UC18 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §7 |

> Alocação ocorre na **seleção** após aprovação na **entrevista de seleção** (P/H). **Não dispara jornada** — quem libera é UC25 (faixa 2, com trava de turma).

---

## Objetivo

Após **aprovação na entrevista** (P/H): alocar aprovadas nas turmas da **unidade da candidata**. Painel de ocupação; lote; mover/remover. Listas com **Cidade/UF + Bairro**. **Não** altera status.

Turma única → vínculo automático. Online (turma única) → etapa omitida.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Seleção — Etapa 3/3 Alocar em turma              │
├──────────────────────────────────────────────────┤
│ Ocupação Unidade Centro                          │
│ Turma A 12/20  Turma B 6/20  ⚠ A perto do limite │
├──────────────────────────────────────────────────┤
│ Barra: [Sem turma] [Por unidade] [Distribuir auto]│
│ Aprovadas sem turma                              │
│ ☑ Maria · Joinville/SC  ☑ Joana · Gaspar/SC      │
│ Turma destino: [ A ▼ ]  [ Alocar em lote ]       │
├──────────────────────────────────────────────────┤
│ Já alocadas                                      │
│ Turma A: Maria · Joinville/SC… [Mover] [Remover] │
│ [ Remover selecionadas da turma ]                │
│ ℹ Status permanece aprovada → Comunicar (UC25)   │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Só **aprovadas** na entrevista entram na lista
- Sem alocação em turma → UC25 faixa 2 permanece bloqueada
- Distribuir automaticamente: equilibra vagas; prioriza período (manhã/tarde) quando o nome da turma indicar; toast de sobrantes
- Remanejamento entre unidades: UC18 / Gestor §8
