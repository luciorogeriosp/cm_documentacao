# Briefing IA — Aplicativo Gestor (mentoria + voluntariado)

Use este arquivo para **atualizar o Aplicativo Gestor já existente**. Não crie o portal do voluntariado nem altere o Cliente aqui.

**Produto:** Consulado da Mulher. App único: Unidade + Turma + **Gestor de Voluntariado**. Auth: **link mágico por e-mail**.

**Não confundir:** mentoria ≠ visita técnica (UC78) ≠ conteúdo extra (UC35). **P/H** = caso com N consultas (sem slot 2h). **Online** = sessão 2h no encerramento. **Não** mexer em doação/PIX nem capital semente.

---

## Dois shells

**Unidade / Turma** — rotas `/gestor/e/[edicaoId]/…` após Dashboard de edições.

| Área | Rota | O que é |
| ---- | ---- | ------- |
| **Mentorias** | `/gestor/e/[edicaoId]/mentorias` | Fila da edição: alocar lote / Atendido pelo gestor |
| **Voluntários** | `/gestor/e/[edicaoId]/voluntarios` | Recorte para escolher mentor (não CRM) |

**Gestor de Voluntariado** — rotas `/gestor/voluntariado/…`. **Não tem** Dashboard de edições: o login abre direto a home com o **menu contextual**. Perfil CMS (UC1/UC5).

| Área | Rota | O que é |
| ---- | ---- | ------- |
| **Gestão de ações** | `/gestor/voluntariado/acoes` | Criar, editar, slug, convites (texto), inscritos, resultado (UC90) |
| **Gestão de voluntários** | `/gestor/voluntariado/voluntarios` | Rede nacional: filtros, em atividade, inativos, em mentoria |
| **Gestão de mentorias** | `/gestor/voluntariado/mentorias` | Consulta: abertas / em andamento / finalizadas + abertas há muito tempo |

Unidade/Turma **perdem Campanhas**. Gestor de Voluntariado **não** vê a página de edições.

**Permissões (edição)**

| Ação | Unidade | Turma | GV |
| ---- | :-----: | :---: | :-: |
| Alocar lote, recusar, Atendido pelo gestor, `wa.me` | sim | sim (própria turma) | não |
| Consultar lista/card da edição | sim | sim | nacional |
| Abrir ação / confirmar inscrição / aprovar cadastro | não | não | sim |

---

## Catálogo e formulário

**Área (CMS):** Finanças, Marketing, Vendas, Gestão, Comunicação, Formalização, Saúde e bem-estar, Tecnologia.

**Formulário:** área + motivo + dificuldade + o que resolver + períodos. **Sem slot.**

---

## Mentorias — online (encerramento)

Inalterado no desenho de 2h / `vagas`: abrir lote → diagnóstico no Cliente → pool; vincular vários no timeout 72h; educador interno fora da métrica.

---

## Mentorias — P/H (edição)

Abas: **Lista** · **Solicitações**. **Sem** Minha agenda.

Solicitações (veio do app):

1. **Alocar mentores** — lote único; 1º = líder; some de Em aberto; não acrescenta depois.
2. **Atendido pelo gestor** — fecha **sem** BI.
3. **Recusar** — motivo.

**Comunicar WhatsApp** (`wa.me`) a cada mentor do lote.

---

## Gestão de ações (GV)

Criar / **editar** (edição opcional), `slug` automático, ativas, convidar da rede ou e-mail com **texto personalizado** + link do slug (UC73), inscritos `inscrito`/`confirmado`/`recusado` (inclui quem veio pelo slug), diário, resultado (horas, pessoas únicas, beneficiárias), export ITG 2002 (planilha, sem valor de mercado). Sem certificado. Sem doação de sangue.

---

## Card

Dois estados P/H: Abertas = só negócio (+ faturamento); Ativas = nome, sócios, WhatsApp, e-mail. Gestor vê contato sempre. Sem CPF/PIX/endereço.

---

## Contratos

- Cliente P/H: hub Mentoria; NPS+texto ao encerrar.
- Portal do voluntariado: Em aberto / Minhas / Encerradas; só o líder registra; módulo CMS bloqueia Pegar.
- Acesso mocado (UC69): “Acessar como” com log — se já existir inserir-em-nome, mantenha os dois.
