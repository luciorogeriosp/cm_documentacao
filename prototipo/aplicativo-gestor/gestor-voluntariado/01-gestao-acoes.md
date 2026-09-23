# Gestão de ações

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/voluntariado/acoes` · detalhe `/gestor/voluntariado/acoes/[id]` |
| **Perfil** | Gestor de Voluntariado |
| **UCs** | UC90, UC73 |
| **Prioridade** | Especificado |

Substitui a operação que estava em [14-campanhas-voluntariado.md](../gestor-unidade/14-campanhas-voluntariado.md) (Unidade + `edicaoId`). Tipos de Ação continuam no **CMS**. Ação **pode existir sem edição**.

Nomenclatura: **ação** (não campanha). Modalidade no cadastro: **Ações**. **Sem** doação de sangue. Ao **concluir**, certificado genérico para todo o grupo `confirmado` (UC63 / UC90). Export ITG 2002 = planilha (sem valor de mercado).

Portal: [08-campanhas.md](../../aplicativo-voluntario/08-campanhas.md) · landing pública [01-cadastro.md](../../aplicativo-voluntario/01-cadastro.md) (`/voluntario/a/[slug]`).

---

## Lista — ativas e histórico

Abas: **Ativas** · Encerradas · Rascunho.

```
┌──────────────────────────────────────────────────┐
│ Gestão de ações                                  │
│ [ + Nova ação ]                                  │
│ [ Ativas ] [ Encerradas ] [ Rascunho ]           │
├──────────────────────────────────────────────────┤
│ Gravação de depoimentos · 10–20/09               │
│ Tipo: Gravação · Comunicação · 3/5 vagas         │
│ slug: /voluntario/a/gravacao-depoimentos  [Copiar]
│ 2 inscritos aguardando                           │
│ [ Editar ] [ Ver inscritos ] [ Convidar ]        │
└──────────────────────────────────────────────────┘
```

**Criar / editar:** título, período, tipo (CMS), áreas, `vagas`, texto-modelo de convite, beneficiária(s) opcional(is), vínculo **opcional** a programa/edição. Ao salvar, o sistema gera **`slug` automático** (editável). **[ Editar ]** na lista e no detalhe permite corrigir dados cadastrados.

---

## Convidar

- **Já na rede:** filtro tipo Ações / área / expertise; multi-seleção.
- **Procurar novos:** busca na rede ainda **sem** inscrição nesta ação; **ou** convite por e-mail para quem ainda não é voluntário → cadastro UC73 (`em_analise`) via slug.

Cada disparo: **texto personalizado** (campo livre, além do texto-modelo da ação) + link `/voluntario/a/[slug]`. No portal autenticado: a ação aparece em Em aberto com **Aceitar convite**.

```
┌──────────────────────────────────────────────────┐
│ Convidar — Gravação de depoimentos               │
│ Texto do convite *                               │
│ [________________________________]               │
│ (pré-preenchido com o modelo da ação)            │
│ [ Enviar ]                                       │
└──────────────────────────────────────────────────┘
```

---

## Inscritos na demanda

Inclui quem chegou pelo slug (já `inscrito`) e quem se inscreveu autenticado.

```
┌──────────────────────────────────────────────────┐
│ Ação — Gravação de depoimentos                   │
│ Ana Costa · Comunicação · inscrito · via slug    │
│ [ Confirmar ] [ Recusar ]                        │
├──────────────────────────────────────────────────┤
│ João Lima · confirmado · diário 90 min           │
└──────────────────────────────────────────────────┘
```

Confirmado: entra em “em atividade”. Recusado: vaga volta. Educador interno **não** entra na lista nem em pessoas únicas.

---

## Resultado operacional

Na ficha da ação (e resumo na lista): inscritos, confirmados, recusados, **horas** do diário, **pessoas únicas**, beneficiárias, vagas. [ Exportar ITG 2002 ]. Sem NPS de ação neste MVP.
