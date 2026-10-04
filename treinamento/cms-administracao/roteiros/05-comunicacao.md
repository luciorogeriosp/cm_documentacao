# 05 — Comunicação (evento × mensagem)

**Objetivo:** Mostrar que a Gupshup guarda os textos e o CMS só liga o evento à mensagem.  
**Duração:** 5 a 8 minutos.  
**Abrir:** Comunicação → Pacotes. Fontes: [prototipo/cms/03-comunicacao-templates.md](../../../prototipo/cms/03-comunicacao-templates.md), [docs/jornadas/comunicacao.md](../../../docs/jornadas/comunicacao.md), [Casos de Uso v10.2 — UC88](../../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v10.2.md).

**UC:** UC88.

---

## Falas

**Abertura.** CMS modela. Gestor opera. Automação executa. Aplicativo realiza.

**O que faz.** Os textos oficiais moram na **Gupshup**. Esta tela **não** é editor de copy: só a relação **evento → mensagem**. Existe uma **tabela default**: todo evento já nasce com um modelo. Pacote ou edição só **troca o ponteiro**.

Dois blocos na mesma área:

- **Por tipo de atividade** — um recado para vídeo aula, um para tarefa, dois para Aula (presencial e ao vivo).
- **Momentos da jornada** — recebemos sua inscrição, você foi aprovada, **convite ao grupo da turma** (presencial ou híbrido, depois da aprovação), já está disponível envie OK, o programa acabou, **pesquisa após a formação** (dias definidos no CMS, padrão cerca de 30).

O e-mail (SendGrid) leva o **mesmo** recado. Recados chamam pelo **nome social**. Certificado e recibo usam o **nome completo**. Sem as variáveis obrigatórias, o envio não sai.

A edição **publicada grava um retrato**. Trocar o ponteiro depois **não** altera a edição que já está no ar — só a próxima.

**O que não faz.** Esta tela **não** edita o parágrafo da Gupshup — só o ponteiro. Encerramento **não** é um 12º tipo de atividade aqui. Texto de apoio ao vídeo e recado customizado ficam **no módulo**. No presencial ou híbrido, a gestora **edita o template sugerido na hora** do envio.

Esta aba **não** é a dos alertas. Alertas são a aba ao lado (os seis relógios).

**O que acontece depois.** Curso pela internet: a automação manda o recado. Presencial ou híbrido: a celebração e o convite ao grupo podem ir no **mesmo** envio pago; depois a gestora cola o texto no grupo da turma. A pesquisa após a formação o **backend** dispara — a gestora não tem tela de disparo como caminho principal.

---

## Erros comuns

- Editar o ponteiro e achar que a edição já publicada muda.
- Achar que o CMS (esta aba) edita o texto da Gupshup — o parágrafo fecha na Gupshup; no módulo entra texto próprio ou a escolha do modelo.
- Juntar “você foi aprovada” com o link do grupo — o convite ao grupo é evento próprio.
- Confundir a pesquisa (dias no CMS) com botão da gestora.

## Corte

“No próximo: a aba **Alertas** — o relógio de quem parou na ficha, que é outra fila.”
