# Briefing IA — iniciar / atualizar o portal do voluntariado

Use este arquivo para o **portal do voluntariado** (nomenclatura canônica do app; não “portal do voluntário”). Next.js, mobile-first. Auth: **link mágico por e-mail — sem senha**. Não implemente Gestor nem Cliente.

**Ator:** Voluntário / Mentor.

**Produto:** Consulado da Mulher. Rede de voluntariado (cerne). Modalidades: individual, coletiva e **Ações**. Cadastro **único** e **individual**.

**Fora de escopo:** Elas no Território; “Outros”; Google Calendar; certificado de coletiva/ação; Canva; doação de sangue.

---

## Rotas

| Rota | Tela |
| ---- | ---- |
| `/voluntario/inscricao` | Cadastro público geral |
| `/voluntario/a/[slug]` | Landing + formulário da ação (associa já à iniciativa) |
| `/voluntario/login` | Link mágico |
| `/voluntario/mentorias` | Hub: Início (módulo CMS) + abas **Em aberto · Minhas · Encerradas** |
| `/voluntario/mentorias/[id]` | Card + pegar / operar |
| `/voluntario/acoes` | Ações + diário (alias `/voluntario/campanhas`) |
| `/voluntario/coletivas` | Aulas vinculadas |
| `/voluntario/certificados` | Certificados tipo **Mentoria** |

**Menu autenticado:** Mentorias · Ações · Aulas coletivas · Certificados · Sair.

`em_analise` → `ativo` / `inativo`. Só coletiva: esconde Mentorias. Só Ações: esconde Mentorias, mostra Ações.

---

## 1. Cadastro

Cadastro **único**. Duas origens:

- **Geral** (`/voluntario/inscricao`): três modalidades visíveis.
- **Via slug** (`/voluntario/a/[slug]`): ação em foco (já qualifica nela); demais frentes **abaixo, opcionais**, com texto explicativo. Não mostrar mentoria individual como CTA principal num plantio.

Falta de experiência **não** impede. Áreas não travam ação futura. Regulamento = link automático no rodapé.

- Nome, nome social, e-mail, WhatsApp, cidade/UF
- Como conheceu: indicação, convite, parceiro, site, outro
- Modalidades / interesse extra (conforme origem)
- Áreas de interesse e de expertise (CMS)
- Períodos; dados sensíveis + aceites

Via slug: `em_analise` na rede + `inscrito` na ação.

**Pendência 17/set:** campos extras por tipo de ação.

---

## 2. Login

Só e-mail. Sem senha. Título da tela: **Portal do voluntariado**.

---

## 3. Hub Mentorias — Início / treinamento

Deixa de ser “biblioteca de 3 vídeos”. Vira **módulo CMS** com os mesmos componentes do Cliente (videoaula, questionário, download, tarefa, etc.).

- **Pegar** em Em aberto fica bloqueado até o módulo concluído.
- Ações e coletivas também exigem o módulo.
- Alocação pelo Gestor: o caso **aparece em Minhas** sem exigir treino para ver. Líder só agenda/registra/encerra depois do treino. Acompanhante vê o card; NPS no encerramento.

Rota `/voluntario/biblioteca` **não** é item de menu (Início vive no hub).

---

## 4. Em aberto

**Duas origens**

1. Ele **pega** em Em aberto (vira líder, lote de 1) — card estado A até pegar.
2. O Gestor **aloca o lote** (1º = líder) — some de Em aberto para todos.

**P/H:** pedidos **sem lote**, cruzando interesse/expertise. **Card estado A** (só negócio + faturamento; sem nome/sócios/contato). **Pegar mentoria** → vira líder.

**Online:** pool `aberta` com `vagas` (decrementa no aceite).

---

## 5. Pegar

P/H: após pegar, **card estado B** (nome, sócios, WhatsApp, e-mail). Líder **contata** para agendar.  
Online: `wa.me` após aceite; diário próprio.

---

## 6. Minhas e Encerradas

| Aba | Conteúdo |
| --- | -------- |
| Minhas | Do lote dela; líder opera consultas; acompanhante só acompanha |
| Encerradas | Encerrada / NPS pendente / finalizada |

**Líder:** agenda 1ª consulta; registra ocorreu / como foi / minutos / haverá próxima; se não ocorreu: remarcar ou encerrar (motivo CMS); **Encerrar** = motivo CMS + **texto sobre a mentoria** + NPS plataforma + NPS mentorada.

**Acompanhante:** card completo; não agenda/encerra; quando o líder encerra: **texto** + mesmos dois NPSes (obrigatório). Horas e certificado **herdados**.

**Encerradas:** histórico, horas (registradas ou herdadas), certificado por pessoa × mentoria (P/H) ou × sessão (online).

---

## Card

Estado A / B — ver [prototipo/comum/card-mentoria.md](../prototipo/comum/card-mentoria.md). Nunca CPF, PIX, endereço.

---

## 7–8. Coletivas e ações

Coletiva: só leitura. Ações (UC90): inscrição no portal **ou** landing `/voluntario/a/[slug]`; **Gestor de Voluntariado** confirma (não a Unidade); diário; **sem** certificado; beneficiária opcional no lado gestor. Autenticado exige módulo CMS.

---

## Certificado

Liberado ao `finalizada` (por pessoa × mentoria P/H, ou × sessão online).  
`/voluntario/certificados`: tipo **Mentoria**. Sem certificado de coletiva/ação.

---

## Contratos

- P/H: gestor aloca lote **ou** você pega. Sem acrescentar mentor depois.
- Atendido pelo gestor **não** aparece nas suas abas.
- Export ITG 2002 é do Gestor de Voluntariado (planilha); você só registra minutos (líder).
