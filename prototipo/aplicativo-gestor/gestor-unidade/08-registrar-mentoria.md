# Gestão de Mentorias (UC70)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/mentorias` |
| **Perfil** | Unidade e Turma operam o P/H da própria turma; Unidade opera o online |
| **UCs** | UC70, UC73, UC89 |
| **Prioridade** | Especificado |

> **Não é** visita técnica (UC78) nem conteúdo extra (UC35).  
> Canônico: [Casos de Uso v7 UC70](../../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md).  
> Rede: [13-voluntarios.md](13-voluntarios.md). Card: [card-mentoria.md](../../comum/card-mentoria.md).  
> Cliente: [28-solicitar-mentoria.md](../../aplicativo-cliente/28-solicitar-mentoria.md).

A **modalidade da edição** escolhe o layout da mesma rota.

| | **Online** | **P/H** |
| - | ---------- | ------- |
| Menu | Encerramento (etapa **final**) | Programa regular |
| Origem | Lote → diagnóstico no Cliente | Pedido no Cliente (ou Unidade cria) |
| Mentor | Voluntário (`vagas` N) | Lote de voluntários (1º = **líder**) |
| Agenda 2h | — | **Não existe** |

**Área (CMS):** Finanças, Marketing, Vendas, Gestão, Comunicação, Formalização, Saúde e bem-estar, Tecnologia.

**Formulário canônico:** área + 4 perguntas Caroline + períodos. **Sem slot.**

---

## Permissões

| Ação | Unidade | Turma |
| ---- | :-----: | :---: |
| Alocar lote, recusar, Atendido pelo gestor, `wa.me` | ✓ | ✓ (própria turma) |
| Consultar lista, ficha e card | ✓ | ✓ (escopo da turma) |
| Online: lote, vincular `vagas`, timeout | ✓ | consulta |

---

## 1. Online — encerramento

Copy: **etapa final da jornada**. Colunas: sem diagnóstico / aberta no pool (`vagas`) / matches aceitos / pendente.

```
┌──────────────────────────────────────────────────┐
│ Mentorias — etapa final da jornada               │
│ [ Abrir lote: finalistas / doação aprovada ]     │
│ Filtro: [ Diagnóstico | Aberta | Aceita | Pendente ]│
├──────────────────────────────────────────────────┤
│ Maria Silva — Área: Marketing · Aberta no pool   │
│ Vagas: 2 restantes                               │
│ [ Card ] [ Vincular voluntário… ]                │
└──────────────────────────────────────────────────┘
```

Timeout `prazo_match_horas` (padrão 72h). Cada vinculado na base UC73. Educador interno **não** aparece como voluntário.

---

## 2. P/H — programa regular

Abas: **Lista** · **Solicitações** (badge). **Sem** Minha agenda / slots.

### 2.1 Lista

```
┌──────────────────────────────────────────────────┐
│ Mentorias  ⚠ 2 solicitações                      │
│ [ Lista ] [ Solicitações (2) ]                   │
│ Doces da Maria · Finanças · Ativa                │
│ Líder: Ana Costa · +2 acompanhantes              │
│ Próx. consulta 18/09 14:00                       │
│ [ Card ] [ Comunicar WhatsApp ]                  │
└──────────────────────────────────────────────────┘
```

Status: aberta · ativa · encerrada / NPS pendente · finalizada · atendida pelo gestor · recusada.

### 2.2 Solicitações (veio do app)

1. **Alocar mentores** — lote único; o **primeiro** da lista é o líder; some de Abertas; não se acrescenta depois.
2. **Atendido pelo gestor** — fecha **sem** BI (sem horas, certificado, pessoa voluntária).
3. **Recusar** — motivo obrigatório (Cliente vê).

**Comunicar no WhatsApp** (`wa.me`) para cada mentor do lote — antes ou depois da consulta; não é o mecanismo de alocar.

```
┌──────────────────────────────────────────────────┐
│ Pedido — Maria Silva          veio do app        │
│ [ card — negócio; gestor vê contato ]            │
│ Mentores *  (1º = líder)                         │
│ 1. Ana Costa  ★ líder                            │
│ 2. João Lima                                     │
│ [ + Adicionar da rede ]                          │
│ [ Recusar… ] [ Atendido pelo gestor ]            │
│ [ Alocar mentores ]                              │
│ [ Comunicar WhatsApp ]                           │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Mentoria ≠ visita técnica ≠ conteúdo extra.
- Todo mentor do lote existe na base UC73.
- Turma **aloca** na própria turma (override 09/set). Multiplica por Elas = telas de Turma.
- Atendido pelo gestor **não** conta mentoria no BI.
