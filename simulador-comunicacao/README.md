# Simulador da jornada de comunicação

Ferramenta **à parte**. Não é tela do CMS, do Aplicativo Cliente nem do Gestor. Não altera o UC88. Não dispara WhatsApp.

Serve para a equipe (comunicação, metodologia, desenvolvimento) **ver com precisão** o que a empreendedora receberia em cada passo — jornada **online** ou **P/H**.

As fichas canônicas continuam em [`docs/jornadas/comunicacao.md`](../docs/jornadas/comunicacao.md). Esta pasta só as percorre.

## Como rodar

```bash
cd simulador-comunicacao
npm install
npm run dev
```

Abre em `http://localhost:3017`. A **v2** (edição CMS + fluxos) fica em `/v2`.

Copie `.env.example` para `.env.local` se quiser puxar templates aprovados na Meta via Gupshup (somente leitura). Sem credencial, o app usa as **intenções** das fichas.

Não commite `.env` / `.env.local`.

## Como se joga

1. Escolhe Online ou P/H e a vista (WhatsApp ou e-mail).
2. **Pré-inscrição** — nenhuma mensagem.
3. **Não finalizou em 1 dia** / **3 dias** (somem depois de usar) ou **Finalizou a inscrição**.
4. Online: ela escreve no WhatsApp e recebe na hora o “aguarde”. P/H: o aguarde entra ao finalizar.
5. **Não segue** ou **Aprovada**. Depois de aprovada, o resto do curso com Avançar.

Roteiros escritos: [roteiro-online.md](roteiro-online.md) · [roteiro-ph.md](roteiro-ph.md).

## O que isto não é

- Produto do Consulado para empreendedoras
- Aba do CMS `/admin/comunicacao`
- Envio real Gupshup / SendGrid
- Jornada da voluntária ou da gestora (seções 10–11 de `comunicacao.md`)
