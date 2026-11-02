# Simulador da jornada de comunicação

Ferramenta **à parte** para a equipe **ver e validar** a jornada que está montando no CMS, como se fosse a empreendedora. Não é tela do CMS, do Aplicativo Cliente nem do Gestor. Não altera o UC88. Não dispara WhatsApp.

Serve para:

- **Mostrar a jornada** de forma simples, **fase a fase** (online ou P/H).
- **Validar comunicação:** nenhuma atividade/passo de envio sem modelo; template ausente, genérico, reprovado na Meta ou corpo vazio = problema.
- **Validar variáveis:** `{{1}}` / `{nome}` sem valor não passam.
- **Validar passos, entregas e respostas:** o que o sistema manda (texto, vídeo, PDF do lote); o que ela responde no WhatsApp (“Oi, me inscrevi”, OK); e o que ela **faria no app** (assistiu, baixou, respondeu NPS, digitou a palavra-chave) — sem abrir o app de verdade, só o passo e a entrega.

As fichas canônicas continuam em [`docs/jornadas/comunicacao.md`](../docs/jornadas/comunicacao.md). Esta pasta só as percorre. Os **módulos** vêm da **edição real em homologação**, não de um roteiro inventado.

O app ainda **não** simula o passo no aplicativo (assistiu / baixou / respondeu / digitou a KW). A ideia já fica escrita aqui.

## Fases (capítulos separados)

Online e P/H compartilham as mesmas até a seleção. A entrevista só existe no P/H. A **finalização online** (workshop / palavra-chave / questionário) é capítulo próprio — não misturar com módulos nem com a pesquisa pós-curso (~30 dias, NPS).

1. **Pré-inscrição** — ficha incompleta; relógios de lembrete (ex. 1D / 3D). Nenhuma mensagem no ato de começar.
2. **Inscrição** — ficha pronta. Online: ela escreve e recebe “recebemos — aguarde”. P/H: o aguarde entra ao finalizar. **Ainda não** começa o curso.
3. **Seleção** — classificação. **Não** manda mensagem. Online: sem entrevista.
4. **Entrevista (só P/H)** — convite, presença, ausência/realocação (UC84).
5. **Aprovação / reprovação** — UC25. Aprovada: boas-vindas (online pede OK; P/H leva o link do grupo). Reprovada / não segue: recado negativo e **fim**.
6. **Módulos (homolog)** — sequência da edição no CMS. Gatilho, mensagem, lote, OK, entregas.
7. **Finalização** — depois de 100% das atividades (ou exceção registrada). Distinta do marcador Encerramento / bloco pós-curso.

A v2 de hoje junta isso em quatro rádios (não se inscreveu / se inscreveu / não segue / aprovada) e ainda **não** tem entrevista nem finalização à parte.

### Finalização: mensagem vs app

**P/H não tem esse funil** — doação é análise manual; encontros de encerramento são **Aula (tipo)** no grupo.

| Passo | É mensagem? | O que acontece |
| ----- | ----------- | -------------- |
| **Workshop / live** | Sim. Gestora dispara o convite (e-mail típico; WhatsApp com o mesmo texto se a edição ligar). Modelo `convite_live`. | Data, hora, link (Meet ou YouTube), prazo da KW, link de acesso. Assistir **não** libera doação. |
| **Palavra-chave** | Não. Sem modelo próprio na Gupshup. | Depois da live o **app** abre a presença. O convite (ou um recado com link) só lembra o prazo. Ela responde **no app**. |
| **Questionário final** | Sim — mensagem de atividade, **depois** da KW válida. | Link de acesso. Ela responde **no app**. 100% certo = degrau para a equipe **poder** doar; ela **não pede** doação. |

Auditar neste capítulo: convite sem modelo/variável; questionário final sem template; KW sem prazo.

## Como rodar

```bash
cd simulador-comunicacao
npm install
npm run dev
```

Abre em `http://localhost:3017` (publicado: [simulador-comunicacao.vercel.app](https://simulador-comunicacao.vercel.app)). Escolhe o **ano de referência**, depois a **edição**. Tipo, jornada, catálogo, datas e módulos vêm do CMS (homolog). A v1 (roteiro fixo) fica em `/v1`.

Copie `.env.example` para `.env.local` se quiser puxar templates aprovados na Meta via Gupshup (somente leitura). Sem credencial, o app usa as **intenções** das fichas.

Não commite `.env` / `.env.local`.

## Como se joga

Percorre as fases, nesta ordem:

1. Escolhe o **ano** e a **edição** de homologação. O simulador **audita** a sequência (template, variável, datas, módulos).
2. Escolhe a vista (WhatsApp ou e-mail).
3. **Pré-inscrição** — nenhuma mensagem. Opcional: lembretes de ficha incompleta.
4. **Inscrição** — finalizou. Online: ela escreve no número e recebe o aguarde. P/H: o aguarde entra ao finalizar.
5. **Seleção** — sem mensagem. **P/H:** entrevista (convite / presença / ausência) antes da decisão.
6. **Aprovação / reprovação** — aprovada segue; não segue encerra.
7. **Módulos** — Avançar / OK / lotes da edição real.
8. **Finalização (online)** — convite da live; passo da KW no app; recado + passo do questionário final.

Roteiros escritos: [roteiro-online.md](roteiro-online.md) · [roteiro-ph.md](roteiro-ph.md).

## O que isto não é

- Produto do Consulado para empreendedoras
- Aba do CMS `/admin/comunicacao`
- Envio real Gupshup / SendGrid
- Jornada da voluntária ou da gestora (seções 10–11 de `comunicacao.md`)
