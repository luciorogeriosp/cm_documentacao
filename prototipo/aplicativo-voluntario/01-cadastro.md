# Cadastro do voluntário

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/voluntario/inscricao` (geral) · `/voluntario/a/[slug]` (ação) |
| **Perfil** | Visitante → Voluntário |
| **UCs** | UC73, UC90 |
| **Prioridade** | Especificado |

Cadastro **único** para todas as edições e **individual** mesmo em grupo (aceite LGPD **por pessoa**). O voluntariado é o **cerne**; mentoria é uma ação. Copy em tom **leve** (placeholder até texto Caroline/Daniele). Falta de experiência **não** impede.

**Duas origens** (não fragmentar em vários cadastros):

| Origem | Rota | O que muda no form |
| ------ | ---- | ------------------ |
| Geral | `/voluntario/inscricao` | Três modalidades visíveis (multi) |
| Ação | `/voluntario/a/[slug]` | Ação **em foco** (já qualifica nela); outras frentes **abaixo, opcionais**, com texto explicativo |

Landing da ação: título, período, tipo, vagas, texto da iniciativa. Regulamento = **link automático** no rodapé.

**17/set (fechado):** MVP **sem** campos extras por tipo. No slug **não** aparece “Como você quer atuar?”; períodos e experiência ficam no form geral (ou no perfil depois). Frentes extras = bloco **opcional** abaixo (copy Sandra / Daniele). Canônico: UC73.

---

## Wireframe — geral (`/voluntario/inscricao`)

```
┌──────────────────────────────────────────────────┐
│  Voluntariado — Consulado da Mulher              │
│  [placeholder] Texto de boas-vindas: o foco é    │
│  auxílio básico, não especialização sênior.      │
├──────────────────────────────────────────────────┤
│  Nome *   Nome social                            │
│  E-mail *  WhatsApp *  Cidade/UF *               │
├──────────────────────────────────────────────────┤
│  Como conheceu o Consulado? *                    │
│  ( ) Indicação  ( ) Convite  ( ) Parceiro        │
│  ( ) Site  ( ) Outro                             │
├──────────────────────────────────────────────────┤
│  Como você quer atuar? *  (multi)                │
│  ☐ Mentoria individual                           │
│     [parágrafo: sessão 1 a 1, 2h, negócio]       │
│  ☐ Mentoria coletiva                             │
│     [parágrafo: live, oficina, workshop]         │
│  ☐ Ações                                         │
│     [parágrafo: palestra, gravação, oficina      │
│      pontual — tipos no CMS; sem doação de       │
│      sangue]                                     │
├──────────────────────────────────────────────────┤
│  Áreas de interesse *  (multi — catálogo CMS)    │
│  ☐ Finanças ☐ Marketing ☐ Vendas                 │
│  ☐ Gestão ☐ Comunicação ☐ Formalização           │
│  ☐ Saúde e bem-estar ☐ Tecnologia                │
│  “Me sinto confortável em atender sem ser        │
│   especialista.”  (cadastro agnóstico: não trava │
│   numa ação futura)                              │
│  Áreas de expertise (multi — mesmo catálogo)     │
│  “Falo com autoridade; posso conduzir aula       │
│   coletiva.”                                     │
├──────────────────────────────────────────────────┤
│  Tempo de experiência                            │
│  [placeholder] Falta de experiência não impede.  │
│  Períodos *  ☐ Manhã 8–12  ☐ Tarde 12–18         │
│              ☐ Noite 18–21  ☐ Finais de semana   │
├──────────────────────────────────────────────────┤
│  Dados sensíveis (padrão empreendedoras)         │
│  Raça/cor, deficiência, etc.                     │
│  ( ) informar  ( ) Prefiro não responder         │
│  ☐ Aceite específico de dados sensíveis *        │
│  ☐ Aceites LGPD *                                │
│  Regulamento (link automático)                   │
│  [ Enviar inscrição ]                            │
└──────────────────────────────────────────────────┘
```

---

## Wireframe — via ação (`/voluntario/a/[slug]`)

Quem chega pelo plantio **não** vê mentoria individual como CTA principal. O Consulado abre mais mentorias do que ações “mão na massa”; o bloco opcional existe para conversão futura.

```
┌──────────────────────────────────────────────────┐
│  Mutirão de plantio · Parque Ibirapuera          │
│  19–20/09 · 50 vagas · Saúde e bem-estar         │
│  Você está se inscrevendo nesta ação.            │
├──────────────────────────────────────────────────┤
│  Nome *  E-mail *  WhatsApp *  Cidade/UF *       │
│  (demais dados do cadastro único)                │
├──────────────────────────────────────────────────┤
│  [texto explicativo — captação de outras         │
│   frentes, sem obrigar]                          │
│  Também tenho interesse em:  (opcional)          │
│  ☐ Mentoria individual                           │
│  ☐ Mentoria coletiva                             │
│  ☐ Outras ações / áreas: Finanças, Marketing…    │
├──────────────────────────────────────────────────┤
│  Aceites + regulamento (link automático)         │
│  [ Enviar inscrição ]                            │
└──────────────────────────────────────────────────┘
```

Após envio: `em_analise` na rede. Via slug: também `inscrito` na ação. Aprovação do cadastro e confirmação da ação no **Gestor de Voluntariado**. Login (UC89) mostra tela de aguardo até `ativo`. Anonimização segue UC76 (“Prefiro não responder” grava “não informado” e não entra no BI).
