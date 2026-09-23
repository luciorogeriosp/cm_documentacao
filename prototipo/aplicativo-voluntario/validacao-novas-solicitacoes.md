# Portal do voluntariado — o que implementar para validar as novas solicitações

Fatia **só do portal** (não Gestor de Voluntariado, não Cliente). Serve para a sessão de teste em **homologação** das decisões da [16/set](../../reunioes/Meeting%20started%202026_09_16%2013_58%20GMT-03_00%20-%20Notes%20by%20Gemini.md) e da [17/set](../../reunioes/Meeting%20started%202026_09_17%2014_01%20GMT-03_00%20-%20Notes%20by%20Gemini.md) (gravadas no v7).

Wireframes-fonte: [01-cadastro.md](01-cadastro.md), [02-login.md](02-login.md), [03-treino-materiais.md](03-treino-materiais.md), [08-campanhas.md](08-campanhas.md). UCs: UC73, UC89, UC90.

Copy ainda é placeholder (Sandra / Daniele). Paleta e nomes públicos **não** entram nesta fatia.

---

## Fora desta fatia

Não implementar agora para esta validação:

- Gestão de ações / voluntários / mentorias no Aplicativo Gestor
- Campos extras por tipo de ação (plantio, gravação, etc.) — **MVP sem extras** (17/set)
- Hub completo de mentorias (pegar, card A/B, NPS, certificados)
- Aulas coletivas, certificados de coletiva/ação
- Google Calendar, Canva, doação de sangue

O shell autenticado (menu + tela de aguardo + Início do módulo) precisa existir **só o bastante** para provar os bloqueios depois do cadastro.

---

## 1. Cadastro geral — `/voluntario/inscricao`

Implementar o form único visível (funil de mentoria).

| Bloco | Obrigatório | Notas |
| ----- | ----------- | ----- |
| Nome, nome social, e-mail, WhatsApp, cidade/UF | sim (nome social opcional) | Cadastro **individual** mesmo em grupo |
| Como conheceu | sim | Indicação, convite, parceiro, site, outro |
| Como você quer atuar? (3 modalidades) | sim (multi) | Mentoria individual, coletiva, Ações — com parágrafo em cada |
| Áreas de interesse e expertise | sim (interesse) | Catálogo CMS; copy de “não precisa ser especialista” |
| Tempo de experiência | não | Falta de experiência **não** impede envio |
| Períodos | sim | Manhã 8–12, tarde 12–18, noite 18–21, finais de semana |
| Dados sensíveis | sim o bloco | Informar **ou** “Prefiro não responder” + aceite específico |
| Aceites LGPD | sim | Por pessoa |
| Regulamento | — | **Link automático** no rodapé; o visitante não cola URL |

CTA: **Enviar inscrição**. Um cadastro, não vários formulários.

Após envio: pessoa na rede com `em_analise`. Sem associação a ação.

---

## 2. Landing + form da ação — `/voluntario/a/[slug]`

Slug vem da ação criada no GV (já existe no gestor; o portal **consome**).

**Topo (ação em foco)** — não é CTA de mentoria:

- Título, período, tipo, vagas, texto da iniciativa
- Frase: “Você está se inscrevendo nesta ação.”

**Formulário (sempre)**

| Bloco | No slug |
| ----- | ------- |
| Nome, nome social, e-mail, WhatsApp, cidade/UF | sim |
| Como conheceu | sim |
| Dados sensíveis + aceites + regulamento automático | sim |
| “Como você quer atuar?” com as 3 modalidades iguais ao geral | **não aparece** |
| Períodos e tempo de experiência | **não** nesta fatia (só no geral / depois no perfil) |

**Abaixo, opcional** — texto explicativo (placeholder até copy da Daniele):

```
[texto: captação de outras frentes, sem obrigar]
Também tenho interesse em:  (opcional)
☐ Mentoria individual
☐ Mentoria coletiva
☐ Outras ações / áreas: Finanças, Marketing…
```

Quem chega pelo plantio **não** vê mentoria individual como CTA principal.

Slug inválido / ação encerrada: página de indisponível, sem form.

---

## 3. O que o envio grava (portal)

| Origem | Rede (UC73) | Ação (UC90) |
| ------ | ----------- | ----------- |
| `/voluntario/inscricao` | `em_analise` | — |
| `/voluntario/a/[slug]` | `em_analise` | `inscrito` **imediato** |

Frentes opcionais marcadas no slug viram interesse no cadastro único (não abrem segundo cadastro).

E-mail já na rede que reabre o slug: **não** duplica pessoa; só associa `inscrito` na ação (se ainda não estiver).

---

## 4. Login e aguardo — `/voluntario/login`

- Só e-mail. Sem senha. Título: **Portal do voluntariado**.
- Link “Ainda não sou da rede” → `/voluntario/inscricao`.
- `em_analise`: entra na **tela de aguardo** (sem menu operacional, sem pool, sem outras ações).
- `ativo`: shell autenticado.
- `inativo` (UC74): mensagem genérica, sem sessão.

Tela de aguardo (mínimo para validar):

```
Cadastro em análise.
Você receberá um e-mail quando for aprovado.
```

Quem veio pelo slug: na tela de aguardo, mostrar também a ação em que já está `inscrito` (“Mutirão de plantio — inscrito, aguardando confirmação”). Ainda **não** vê o pool nem a lista de outras ações.

---

## 5. Depois de `ativo` — bloqueio do módulo CMS

Implementar só o **Início** do hub (`/voluntario/mentorias`): lista de atividades do módulo CMS (pode ser 1–3 itens mocados).

Enquanto o módulo **não** está concluído:

- Em aberto (mentorias): aviso + link para Início, **sem** lista
- `/voluntario/acoes`: aviso + link para Início, **sem** inscrição
- Coletivas: fora desta fatia

Concluído o módulo: libera Ações (e, se a modalidade tiver, mentorias — fora desta fatia).

Menu autenticado mínimo: **Mentorias** (Início) · **Ações** · Sair.

Só modalidade Ações (sem mentoria marcada): esconde Mentorias, mostra Ações — ainda exige o módulo para inscrever.

---

## 6. Ações autenticadas — `/voluntario/acoes`

Abas: **Em aberto · Minhas · Encerradas**.

| Aba | O que mostra |
| --- | ------------ |
| Em aberto | Ações ativas no período em que ainda **não** está inscrito. CTA **Inscrever-me**. Convite do GV: CTA **Aceitar convite** |
| Minhas | `inscrito` (“aguardando confirmação”) e `confirmado` (diário) |
| Encerradas | `recusado` e ação encerrada |

Quem já entrou pelo slug aparece em **Minhas** como `inscrito`, não precisa se inscrever de novo.

**Diário** (só `confirmado`): data *, minutos *, descrição * + Registrar. Certificado de ação **não** entra nesta fatia de homologação (emana ao concluir a ação — UC63/UC90; tela [09-certificados.md](09-certificados.md)).

Link do e-mail de convite = `/voluntario/a/[slug]`:

- Visitante → form público (item 2)
- Já autenticado `ativo` + módulo ok → a ação em Em aberto com **Aceitar convite**
- `em_analise` → tela de aguardo com a ação associada

---

## Roteiro de teste (homologação)

Pré-requisito no GV (já especificado; não faz parte deste arquivo): uma ação de teste com slug, ex. mutirão de plantio, 50 vagas.

1. Abrir `/voluntario/inscricao`. Conferir as 3 modalidades visíveis, regulamento no rodapé, enviar. Conferir `em_analise` e **sem** ação.
2. Abrir `/voluntario/a/[slug]` do plantio. Conferir topo da ação, **ausência** de “Como você quer atuar?”, bloco opcional abaixo, regulamento automático. Enviar.
3. Conferir a mesma pessoa: `em_analise` + `inscrito` na ação.
4. Login com o e-mail do passo 2: tela de aguardo + nome da ação.
5. (GV aprova cadastro — fora do portal.) Login de novo: Início do módulo; Ações ainda bloqueadas.
6. Concluir o módulo (mocado). Abrir `/voluntario/acoes` → Minhas com o plantio `inscrito`.
7. Em aberto: outra ação; **Inscrever-me**. Convite: **Aceitar convite**.
8. Confirmar no portal o diário só depois que o GV marcar `confirmado` (passo no gestor).
9. Reabrir o mesmo slug com o mesmo e-mail: não duplica cadastro; não cria segunda inscrição.
10. Slug inexistente / ação encerrada: sem form.

Dados fictícios só em homologação.

---

## O que esta fatia **não** resolve sozinha

| Item | Dono | Efeito no portal |
| ---- | ---- | ---------------- |
| Copy do bloco opcional + mensagens automáticas | Sandra / Daniele | Placeholder até chegar o texto |
| Formulário unificado de satisfação mentoria/ação | Heitor / Sandra | Fora desta fatia |
| Data da sessão de teste | Sandra, Alexandre, Daniele | Roteiro acima |

**Já no v7 (não reabrir aqui):** MVP sem campos extras; períodos/experiência só no geral; `inscrito` imediato + `em_analise` na rede.
