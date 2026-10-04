# Como a plataforma conversa com as empreendedoras

Este texto é para a equipe do Consulado da Mulher (comunicação, metodologia e voluntariado). Serve para entender **quando** cada pessoa recebe **o quê**, **por quê** e **por qual caminho** — e para revisar tom e materiais.

Fonte canônica: [Casos de Uso v10.2 — UC88](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v10.2.md). Este arquivo é a leitura operacional (quando / para quem / variáveis / o que a mensagem **não** faz). Os parágrafos oficiais ainda estão *a revisar* — os textos moram na **Gupshup**, não aqui.

Para **jogar** as duas jornadas (online e presencial ou híbrido, com desfechos) numa ferramenta à parte: [simulador-comunicacao/](../../simulador-comunicacao/README.md).

Quem nunca abriu o sistema deve conseguir ler daqui até o fim sem precisar de outro documento.

---

## Palavras que usamos aqui

- **CMS de Administração** — o lugar onde a equipe monta programas, edições e a **relação evento → mensagem**. O CMS **não** é editor de copy.
- **Gupshup** — repositório dos textos aprovados (modelos Meta). Cada evento aponta para **um** modelo.
- **Tabela default** — inventário obrigatório: todo evento de envio já nasce com um modelo padrão. Pacote ou edição só **troca o ponteiro**.
- **Edição** — a turma daquele ano de um programa, por exemplo “Empreende no Zap 2026” ou “Empreende Mulher 2026”.
- **Pela internet** — o curso acontece no WhatsApp e no aplicativo, no ritmo das aulas que o sistema libera.
- **Presencial ou híbrido** — há encontros ao vivo (sala ou tela). Depois da aprovação, o dia a dia da turma vai no **grupo da turma**.
- **Grupo da turma** — grupo de WhatsApp da turma (link cadastrado). O **convite ao grupo** é um evento próprio da jornada (depois de “você foi aprovada”). No presencial ou híbrido, o único disparo pago individual pode levar os dois eventos no mesmo envio.
- **Nome social** — é assim que chamamos a pessoa em **todo recado** e no aplicativo. Não existe variável “primeiro nome”. Se o nome social estiver vazio, o sistema preenche esse mesmo campo com o tratamento do cadastro (hoje: o primeiro nome do nome completo).
- **Nome completo** — só em **documento oficial**: certificado do programa, certificado da voluntária, recibo da doação.
- **OK** — a palavra (ou o botão) que a empreendedora manda no WhatsApp para **receber** o que já está pronto. Não significa que ela já fez a aula.
- **Lote** — o conjunto de recados e materiais que sai de uma vez depois do OK: tudo que já estava pronto e ela ainda não tinha recebido.
- **Link de acesso** — um endereço no WhatsApp ou no e-mail que abre o aplicativo **já autenticada**. Não existe senha. Não existe código de verificação por SMS.
- **Pré-inscrição** — ela deixou nome, telefone, e-mail e os aceites, mas **ainda não** terminou a ficha completa.
- **Gestora** — quem opera o programa na unidade ou na turma.

---

## 1. Como a conversa funciona

### Como o catálogo funciona

Os textos oficiais moram na **Gupshup**. O CMS **só liga o evento à mensagem**: escolhe qual modelo da Gupshup aquele momento usa.

Existe uma **tabela default** obrigatória. Todo evento de envio (inscrição, jornada, tipo de atividade, alerta, benefício, voluntariado, operação — inclusive o **convite ao grupo**) já nasce com um modelo padrão. Pacote ou edição só **troca o ponteiro**. Um texto por evento.

O e-mail (SendGrid) entrega o **mesmo** recado dos eventos oficiais. Não há segundo banco de copy para inscrição, seleção, alertas e benefícios.

No **módulo** dá para escrever texto direto — apoio ao vídeo, recado customizado daquela atividade — **ou** apontar um modelo da Gupshup no meio do módulo. Isso não substitui a tabela default dos eventos da jornada.

No presencial ou híbrido, a gestora da **unidade** ou da **turma** recebe o template sugerido e **pode editar na hora** do envio (vale só aquele disparo). O modelo na Gupshup **só envia** se as variáveis **obrigatórias** daquele evento estiverem preenchidas. Trecho com variável **opcional** vazia some do texto.

### Por onde a mensagem chega

- **WhatsApp automático** — o número do programa envia para a pessoa, no curso pela internet (e em alguns avisos de inscrição e seleção das duas modalidades).
- **Grupo da turma** — presencial ou híbrido, depois da aprovação. A gestora envia na mão.
- **E-mail** — o mesmo texto da Gupshup, quando o momento pede e-mail ou os dois caminhos.
- **Conversa um a um no WhatsApp** — a gestora ou a mentora abre o chat da pessoa. Esse papo **não** é texto da Gupshup.

### Horário dos envios automáticos

Segunda a sexta, das 8h às 20h. Sábado, das 8h às 16h. Domingo e feriado nacional **não** disparam. Se o horário passou, a mensagem espera o próximo período permitido. Se a entrega no WhatsApp falhar, o sistema tenta de novo **depois de 2 dias**.

### Quem sai da conversa automática

Quem desiste ou é desligada **sai** das mensagens automáticas e dos disparos manuais da jornada.

### O que a gestora **não** recebe

A gestora **não** recebe e-mail de “pendência do dia”. Ela só recebe e-mail quando **pede o link de acesso** ao sistema.

No curso pela internet, ela **pode ela mesma** mandar WhatsApp para quem está em risco de evasão. Isso é ação humana, não relógio.

```mermaid
flowchart LR
  Gupshup[Gupshup_repo_dos_textos]
  Default[Tabela_default_evento_e_mensagem]
  Edicao[Override_do_pacote_ou_edicao]
  Backend[Backend_resolve_e_envia]
  Gupshup --> Default
  Default --> Edicao
  Edicao --> Backend
```

---

## 2. Três tipos de gatilho

Um **gatilho** é o que faz a mensagem sair. São três famílias.

### A. Relógio

O tempo passa e, se a condição ainda for verdade, a plataforma manda o recado. Cada relógio **para sozinho** quando a pessoa faz o que faltava (termina a ficha, conclui a atividade, sai do risco).

A unidade pode **ligar, desligar ou ajustar** os prazos dos **seis alertas** daquela edição. Os números abaixo são o combinado típico. A pesquisa após a formação **não** entra nesta lista: os dias ficam no CMS (padrão cerca de 30); a automação executa.

| Relógio | O que espera | Quando manda | Quando para |
| ------- | ------------ | ------------ | ----------- |
| Ficha incompleta — 1º toque | Ela fez a pré-inscrição e não terminou a ficha | **1 dia** depois | Ela conclui a inscrição |
| Ficha incompleta — reforço | A mesma situação continua | **A cada 3 dias**, até o limite da edição | Ela conclui a inscrição |
| Prazo da atividade | Aula liberada, ainda não feita, com data limite | Algumas **horas antes** do prazo | Ela conclui, ou o prazo passa sem reenvio |
| Várias aulas paradas (backlog) | Muitos conteúdos já liberados e não feitos | Quando passa o limiar da edição | As pendências baixam do limiar |
| Fim do programa perto | Curso pela internet, ainda há pendência | **5 dias** antes do fim | Sem pendência, ou o programa acaba |
| Risco no curso curto | Aula já liberada e não feita | **10 dias** sem fazer | Ela faz a aula ou sai do estado de risco |
| Meio do curso | Formação curta (~um mês) | Por volta do **15º dia**, campanha de **3 a 5 dias** | Ela retoma, ou a janela fecha |

No presencial ou híbrido de vários meses, o sinal de **15 dias** de silêncio com atraso fica no acompanhamento da gestora e no **grupo da turma** — não é o sexto alerta automático do número do programa.

O relógio da aula nova (só internet) **não envia o conteúdo**. Só deixa a aula pronta e dispara o pedido de OK (item B). Não é um dos seis alertas.

A **pesquisa após a formação** usa os dias definidos no CMS (padrão cerca de 30). O backend dispara. A gestora **não** tem tela de disparo como caminho principal.

Cada aula pela internet tem o **próprio** relógio. Ele não espera ela terminar a aula anterior.

### B. Resposta dela: OK e o lote

Só no curso **pela internet**.

Quando a aula fica pronta, a plataforma **não** manda vídeo, exercício nem arquivo. Manda um recado: já está disponível; envie **OK** para receber.

O **OK** dela é o gatilho. Só então sai o **lote**: tudo que já estava pronto e ela ainda não tinha recebido — inclusive o que acumulou se ela demorou a responder.

Pedir OK **não** marca a aula como feita. Feito é no aplicativo, quando ela assiste, responde ou envia.

Juntar várias aulas e fazer depois (“maratonar”) é **esperado**. Não é atraso e **não** é, sozinho, risco de evasão.

No presencial ou híbrido **não existe** esse OK/lote: a gestora libera o encontro e cola o texto no grupo.

```mermaid
flowchart TD
  Relogio[Relogio_libera_aula]
  PedidoOK[Mensagem_pede_OK]
  Espera[Aguarda_resposta]
  Lote[Envia_lote_acumulado]
  Relogio --> PedidoOK --> Espera
  Espera -->|ela_responde_OK| Lote
  Relogio -->|outra_aula_fica_pronta| PedidoOK
```

### C. Ação manual da gestora

Só no curso **pela internet**.

Os relógios de risco **mostram** quem está em risco (10 dias sem fazer aula já liberada, ou 5 dias do fim ainda com pendência). A gestora da unidade ou da turma abre a lista, escolhe as pessoas e **confirma** o envio. Sem o clique dela, essa mensagem de resgate **não sai**.

Não substitui o pedido de OK. Não manda o lote. Não marca a aula como feita. Quem está juntando aulas e **ainda entra no aplicativo** não entra nessa lista de risco.

No mesmo gesto ela também pode mandar, cada um com texto próprio na Gupshup:

1. recado para quem **não fez uma atividade** que ela escolheu;
2. campanha curta no meio do curso (por volta do 15º dia).

No presencial ou híbrido **não existe** esse disparo do número do programa: a gestora escreve no grupo da turma.

```mermaid
flowchart LR
  Lista[Lista_risco_evasao]
  Gestora[Gestora_confirma]
  WhatsApp[WhatsApp_para_elas]
  Lista --> Gestora --> WhatsApp
```

---

## 3. Os dois caminhos, em ordem

### Pela internet

Ela encontra a página do programa e faz a pré-inscrição. Se parar no meio, o relógio de **1 dia** (e depois o de **3 dias**) pede que termine a ficha.

Quando termina, o aplicativo mostra o **número WhatsApp do programa**. Ela **escreve** nesse número. Só então chega a confirmação: recebemos sua inscrição; agora é aguardar a seleção. Isso **ainda não** começa o curso.

A gestora comunica o resultado. Se ela segue, chega o pedido do **primeiro OK** (confirmar participação). Ela responde OK e recebe o primeiro lote (boas-vindas, salvar o número, materiais). A cada relógio de aula, de novo o pedido de OK; ela responde e recebe o lote acumulado.

Se a unidade ligou os relógios, chegam lembretes de prazo, de várias aulas paradas, de fim perto ou de risco. Quando a gestora decide, sai também a mensagem manual de resgate.

Quem fez tudo entra no convite da live (Meet **ou** YouTube + StreamYard, no canal que a gestora escolheu) e nos últimos passos. Pode haver mentoria, doação e certificado. Ela **não pede** doação: o aviso só sai **depois** da aprovação (dinheiro, insumo ou equipamento). Ao fim, o aviso de que o programa acabou. Os **dias** da pesquisa após a formação ficam no CMS (padrão cerca de 30); o backend dispara.

### Presencial ou híbrido

A inscrição é a mesma. A confirmação no WhatsApp do programa é **opcional** na edição: se a edição usar, ela também escreve no número e recebe o “recebemos sua inscrição”. O relógio da ficha incompleta é o mesmo.

Pode haver **entrevista de seleção**. A gestora só convida quem já está marcada numa sessão.

Quem é aprovada recebe a celebração **Você foi aprovada** (sem o link do grupo). Em seguida — ou no **mesmo envio pago**, se a turma já tiver o link — sai o **convite ao grupo da turma**. Quem não entra no grupo **ainda não** está com a participação efetivada. Quem não segue recebe o recado de não aprovação. Classificar no sistema **não** manda mensagem: só **comunicar o resultado** manda.

Dali em diante o dia a dia é o **grupo da turma**. A cada encontro a gestora cola o texto daquele tipo de atividade. Mentoria acontece **durante** o programa. Doação quando a equipe decidir — ela **não pede**; o aviso só depois da aprovação. A pesquisa após a formação usa os **dias do CMS**; o backend dispara, não um botão da gestora.

---

## 4. Como ler cada ficha

Todas as comunicações abaixo usam o mesmo bloco:

- **Quando** — o ponto da história e o gatilho
- **Para quem**
- **Por que enviamos**
- **Como chega**
- **O que esta mensagem não faz**
- **Variáveis obrigatórias** — sem elas o modelo na Gupshup **não envia**
- **Variáveis opcionais** — se vazias, o texto omite o trecho
- **Texto** — espaço para o Consulado fechar o parágrafo na Gupshup. Onde ainda não há texto oficial, há **intenção**. Não é o texto final.

Nomes das variáveis em português, iguais aos placeholders da Gupshup.

### Bloco comum (quase todo recado à empreendedora)

- **Obrigatórias em geral:** **nome social**; **nome do programa**.
- **Obrigatória quando o recado abre o app:** **link de acesso**.
- **Obrigatória em documento oficial** (certificado do programa, certificado da voluntária, recibo da doação): **nome completo**.
- **Opcionais em geral:** edição; unidade; turma.
- **Não usar:** variável “primeiro nome”.

O recado que **avisa** o certificado chama pelo **nome social**. O PDF do certificado (e o recibo) usam **nome completo**.

---

## 5. Inscrição e seleção

### Recebemos sua inscrição

**Quando:** ela escreveu a primeira mensagem no número WhatsApp do programa, depois de terminar (ou quase terminar) a ficha.

**Para quem:** quem acabou de se apresentar nesse número.

**Por que enviamos:** confirmar que o Consulado viu o interesse e que a seleção ainda vai acontecer.

**Como chega:** WhatsApp automático. E-mail com o mesmo texto, se a edição ligar os dois.

**O que esta mensagem não faz:** não começa o curso. Não pede OK. Não envia aula.

**Variáveis obrigatórias:** nome social; nome do programa.

**Variáveis opcionais:** edição; unidade; turma; quando a equipe volta a falar.

**Texto:** a revisar.

Intenção: alegria pelo interesse; “recebemos e agora é aguardar”; a próxima fala será por aqui, na época da seleção.

---

### Relógio: 1 dia sem terminar a ficha

**Quando:** **1 dia** depois da pré-inscrição, se a ficha completa ainda não foi enviada.

**Para quem:** quem parou no meio.

**Por que enviamos:** muita gente desiste no formulário longo; um toque cedo recupera o interesse.

**Como chega:** preferência por **e-mail** com link de acesso para retomar a ficha. WhatsApp automático é opcional na edição (custa mais). A gestora também pode mandar na mão, se quiser reforçar.

**O que esta mensagem não faz:** não a coloca em seleção. Não começa o curso.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso (para retomar a ficha).

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: “vimos que você começou”; um passo só — terminar a ficha; tom de convite, não de cobrança.

---

### Relógio: reforço a cada 3 dias

**Quando:** a ficha continua incompleta. **A cada 3 dias**, até o número máximo combinado na edição.

**Para quem:** a mesma pessoa do toque de 1 dia.

**Por que enviamos:** um único lembrete às vezes não basta; o relógio para no instante em que ela conclui.

**Como chega:** o mesmo caminho do toque de 1 dia (mesmo texto-base da Gupshup, ou variante de reforço se o Consulado quiser duas peças).

**O que esta mensagem não faz:** não acumula cobrança depois que ela termina. Não inicia o curso.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: reforço curto; o prazo de inscrição, se ainda houver; o mesmo próximo passo.

---

### Convite à conversa de seleção

**Quando:** a gestora da unidade **escolhe e dispara**, só no presencial ou híbrido, para quem já está marcada numa sessão de entrevista.

**Para quem:** candidatas qualificadas com data, hora e local definidos.

**Por que enviamos:** marcar presença na entrevista. Sem essa conversa a aprovação presencial não acontece.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto. Se o automático não chegar, a gestora pode abrir o chat da pessoa.

**O que esta mensagem não faz:** não aprova. Não cria o grupo da turma. Não começa o curso.

**Variáveis obrigatórias:** nome social; nome do programa; data; hora; **um de:** local **ou** link do encontro.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: convite claro, com data e o que levar / como chegar.

---

### Você foi aprovada — boas-vindas

**Quando:** a gestora da unidade **comunica o resultado** de quem segue. Este recado **celebra** a entrada.

**Para quem:** aprovadas (presencial/híbrido: já na turma; pela internet: já vinculadas à unidade/turma).

**Por que enviamos:** dizer que ela entrou e o que acontece agora.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

No curso pela internet, o próximo passo é o **OK**. No presencial ou híbrido, o **convite ao grupo** é o evento seguinte (pode ir no mesmo envio pago). Este recado **não** carrega o link do grupo.

**O que esta mensagem não faz:** não envia o link do grupo. Na internet, não envia vídeo nem exercício. Classificar no sistema, sozinho, **não** dispara esta mensagem.

**Variáveis obrigatórias:** nome social; nome do programa.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: celebração curta; o próximo passo (responder OK **ou** esperar o convite ao grupo).

---

### Convite ao grupo da turma

**Quando:** presencial ou híbrido, **depois** de “você foi aprovada”, quando a turma já tem o link do grupo. Pode sair no **mesmo envio pago** que a celebração.

**Para quem:** aprovada já alocada numa turma com link cadastrado.

**Por que enviamos:** efetivar a participação. Quem não entra no grupo **ainda não** está com a participação efetivada.

**Como chega:** WhatsApp automático (e o mesmo texto no e-mail, se a edição ligar). Depois, o dia a dia é o grupo; a gestora cola os textos dos encontros.

**O que esta mensagem não faz:** não substitui a celebração. Não começa o conteúdo. Não existe no curso pela internet (lá o próximo passo é o OK).

**Variáveis obrigatórias:** nome social; nome do programa; **link do grupo**; **turma**.

**Variáveis opcionais:** edição; unidade; nome da gestora.

**Texto:** a revisar.

Intenção: “entre no grupo da turma”; um toque no link; a gestora confirma o ingresso.

---

### Desta vez não foi possível seguir

**Quando:** a gestora comunica quem **não** segue (não qualificada, não aprovada, ausente à entrevista, e situações parecidas).

**Para quem:** quem não entra nesta edição.

**Por que enviamos:** fechar o ciclo com respeito e deixar a porta aberta para outra edição, se o Consulado quiser.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não liga o curso. Não cria grupo.

**Variáveis obrigatórias:** nome social; nome do programa.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: agradecer o interesse; recado humano, sem jargão de “reprovada”; convite futuro só se a equipe quiser.

---

## 6. Durante o curso pela internet — OK e lote

### Já está disponível: envie OK

**Quando:** o relógio daquela aula chegou (ou, no primeiro dia, logo após a aprovação). A aula está **pronta**, ainda **não enviada**.

**Para quem:** empreendedora ativa no curso pela internet.

**Por que enviamos:** ela escolhe quando receber. Assim o conteúdo não chega no meio do expediente sem combinado.

**Como chega:** WhatsApp automático.

**O que esta mensagem não faz:** não entrega o material. Não marca a aula como feita.

**Variáveis obrigatórias:** nome social; nome do programa; **título da atividade**.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: “Já está disponível sua aula sobre [título]. Envie agora um OK para receber.”

---

### Ela respondeu OK — o lote sai

**Quando:** ela manda OK (ou toca o botão).

**Para quem:** quem acabou de responder.

**Por que enviamos:** entregar de uma vez tudo que já estava pronto e ela ainda não tinha recebido.

**Como chega:** WhatsApp automático. Cada item do lote usa o texto do **tipo** daquela atividade (fichas abaixo). Material para baixar traz o texto **e os arquivos**. Vídeo no WhatsApp só se a edição ligar essa opção; o mesmo conteúdo continua no aplicativo.

**O que esta mensagem não faz:** não conclui a atividade. Conclusão é no aplicativo.

**Variáveis obrigatórias:** as do tipo da atividade (abaixo). Sempre: nome social; título da atividade; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma; o que levar; canal (Meet ou YouTube).

**Texto:** cada tipo tem o próprio texto na Gupshup (abaixo).

---

### Primeiro lote — boas-vindas da jornada

**Quando:** o primeiro OK depois da aprovação.

**Para quem:** quem acabou de confirmar participação.

**Por que enviamos:** situar a jornada, pedir para salvar o número, apresentar a comunidade (se a edição tiver) e entregar os materiais de apoio iniciais.

**Como chega:** WhatsApp automático, em sequência, como parte do lote. E-mail com o mesmo texto, se a edição ligar.

**O que esta mensagem não faz:** não substitui o aplicativo. Não marca módulo como concluído.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; link da comunidade.

**Texto:** a revisar.

Intenção: acolher; “salve este número”; materiais para consultar sempre; um primeiro passo concreto no aplicativo.

---

### Textos por tipo de atividade (o lote escolhe o tipo)

Cada tipo abaixo é **um** texto na Gupshup. Pela internet, sai no lote depois do OK. No presencial ou híbrido, a gestora cola **o mesmo** texto no grupo quando libera aquele encontro.

Variáveis comuns de todo tipo: **obrigatórias** — nome social; **título**; **link de acesso da atividade**. Se for encontro: também **data** e **hora**, e **um de:** local **ou** link do encontro. Se tiver prazo: também **data limite**. **Opcionais** — edição; unidade; turma; o que levar; canal (Meet ou YouTube).

**O que nenhum desses textos faz:** marcar a atividade como feita.

#### Encontro presencial

**Quando:** encontro em sala, na data combinada.

**Como chega:** internet = lote após OK. Presencial/híbrido = grupo da turma.

**Variáveis obrigatórias:** nome social; título; data; hora; **um de:** local **ou** link do encontro; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma; o que levar.

**Texto:** a revisar. Intenção: data, hora, endereço; o que levar; presença conta.

#### Encontro ao vivo

**Quando:** encontro na mesma hora, pela tela (não confundir com o curso inteiro pela internet). Canal: **Meet** ou **YouTube + StreamYard**, o que a gestora escolheu.

**Como chega:** igual ao encontro presencial.

**Variáveis obrigatórias:** nome social; título; data; hora; **um de:** local **ou** link do encontro; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma; canal (Meet ou YouTube).

**Texto:** a revisar. Intenção: data, hora, link da sala; como entrar.

#### Videoaula

**Quando:** vídeo liberado, com prazo típico de uns dois dias (a edição pode mudar).

**Como chega:** lote após OK; no grupo, se for presencial/híbrido. Arquivo de vídeo no WhatsApp só se a edição ligar.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: do que a aula trata; prazo; link de acesso para assistir no aplicativo (a conclusão oficial é lá, com boa parte do vídeo vista).

#### Exercício

**Quando:** atividade prática no aplicativo.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: o desafio em uma frase; link de acesso.

#### Tarefa de casa

**Quando:** tarefa para fazer no negócio e devolver no aplicativo.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: o pedido concreto; prazo; link de acesso.

#### Saúde financeira

**Quando:** hora de registrar números do negócio (preço, faturamento, etc.).

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: por que aquele número importa; link de acesso; sem tom de auditoria.

#### Material para baixar

**Quando:** PDF, guia ou anexo de apoio.

**Como chega:** texto **e os arquivos** no WhatsApp (internet, após OK). Os mesmos arquivos ficam no aplicativo. No grupo, a gestora manda o texto; os arquivos podem ir anexos na mão.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: o que é cada arquivo; “salve para consultar”.

#### Plano de ação

**Quando:** ela escreve o plano do negócio.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade. Se houver prazo: data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: o que o plano precisa ter; link de acesso.

#### Visita técnica

**Quando:** visita um a um, combinada pela equipe.

**Variáveis obrigatórias:** nome social; título; data; hora; **um de:** local **ou** link do encontro; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: data, o que esperar; não confundir com mentoria.

#### Questionário de chegada

**Quando:** no começo do programa, para conhecer o ponto de partida.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: “queremos te conhecer”; link de acesso; respostas são dela, não do negócio inteiro.

#### Questionário final

**Quando:** no encerramento (pela internet, depois da live e da palavra-chave, quando a edição usar esse funil).

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: fechar o aprendizado; pela internet, acertar o questionário é um dos passos para a equipe **poder** doar — ela **não pede** doação; a equipe ainda sugere e aprova.

#### Pesquisa de satisfação

**Quando:** ao final do ciclo de formação, no aplicativo.

**Variáveis obrigatórias:** nome social; título; link de acesso da atividade.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar. Intenção: opinião sincera; poucos minutos; link de acesso.

---

## 7. Ação manual da gestora (só pela internet)

### Risco de evasão

**Quando:** a lista mostra quem está em risco — **10 dias** sem fazer aula já liberada **ou** **5 dias** do fim ainda com pendência — e a gestora **confirma** o envio.

**Para quem:** só as pessoas que ela selecionou nessa lista.

**Por que enviamos:** resgate humano. O relógio sozinho não manda este texto.

**Como chega:** WhatsApp automático, depois do clique. E-mail com o mesmo texto, se a edição ligar.

**O que esta mensagem não faz:** não envia o lote. Não pede OK no lugar da aula. Não inclui quem está juntando conteúdo e ainda usa o aplicativo.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; prazo ou título da atividade; quantidade pendente; data de encerramento.

**Texto:** a revisar.

Intenção: preocupação, não bronca; um próximo passo único e leve.

---

### Quem não fez uma atividade escolhida

**Quando:** a gestora escolhe uma atividade e dispara para quem ainda não concluiu.

**Para quem:** a lista operacional daquela atividade.

**Por que enviamos:** lembrar sem tratar o atraso como evasão (ela pode estar juntando para fazer depois).

**Como chega:** WhatsApp automático após o clique. Mesmo texto no e-mail, se ligado.

**O que esta mensagem não faz:** não marca risco. Não envia o lote.

**Variáveis obrigatórias:** nome social; nome do programa; título da atividade; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; data limite.

**Texto:** a revisar.

Intenção: “essa atividade ainda está com você”; prazo; link.

---

### Campanha de meio de curso

**Quando:** a gestora dispara a campanha curta (por volta do **15º dia**, por **3 a 5 dias**), para quem desacelerou.

**Para quem:** o recorte que ela escolher nessa campanha.

**Por que enviamos:** um empurrão no meio da formação curta, diferente do risco de 10 dias ou dos 5 dias do fim.

**Como chega:** WhatsApp automático após o clique. Mesmo texto no e-mail, se ligado.

**O que esta mensagem não faz:** não substitui o OK do conteúdo.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: incentivo; o que ainda dá tempo de fazer; tom de parceria.

---

## 8. Relógios de lembrete (se a unidade ligar na edição)

Estes textos são **outros** eventos da tabela default. Podem coexistir com o disparo manual da gestora: o relógio manda sozinho; o manual só sai com o clique.

### Horas antes do prazo

**Quando:** a atividade tem data limite, ainda não foi feita, e faltam as horas combinadas na edição.

**Para quem:** quem ainda não concluiu aquela atividade.

**Por que enviamos:** o prazo está perto.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não prorroga o prazo. Não envia o lote.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso; título da atividade; data limite.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

---

### Várias aulas já liberadas e não feitas

**Quando:** a quantidade de conteúdos prontos e não feitos passa o limiar da edição.

**Para quem:** quem está com a fila grande.

**Por que enviamos:** lembrar que o acúmulo é normal, mas o programa tem fim.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não classifica como evasão. Maratonar continua saudável.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; quantidade pendente.

**Texto:** a revisar.

---

### 5 dias do fim, ainda com pendência

**Quando:** curso pela internet; faltam **5 dias** para o término e ainda há atividade não feita.

**Para quem:** quem tem pendência.

**Por que enviamos:** o calendário está acabando.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não abre prazo extra.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; data de encerramento.

**Texto:** a revisar.

---

### 10 dias sem fazer aula já liberada

**Quando:** curso curto pela internet; uma aula pronta está sem conclusão há **10 dias**.

**Para quem:** quem entrou no estado de risco. Quem acessou o aplicativo há pouco e só está juntando **não** entra.

**Por que enviamos:** sinal de que ela pode estar saindo do curso — o relógio avisa; o resgate mais falado ainda pode ser o **manual** da gestora (ficha da seção 7).

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto, se este relógio estiver ligado.

**O que esta mensagem não faz:** não é o mesmo que 15 dias de silêncio do programa longo presencial.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; título da atividade parada.

**Texto:** a revisar.

---

### Por volta do 15º dia de curso

**Quando:** janela automática de **3 a 5 dias** no meio da formação curta, se a unidade ligou este relógio.

**Para quem:** quem desacelerou nessa janela.

**Por que enviamos:** o mesmo espírito da campanha manual de meio de curso, sem esperar o clique da gestora.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não mistura com o filtro de 10 dias / 5 dias do fim.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

---

### Programa longo: 15 dias de silêncio

**Quando:** presencial ou híbrido (formação de vários meses); **15 dias** sem participação relevante **e** muita coisa atrasada (faltas, tarefas paradas).

**Para quem:** a gestora vê o sinal no acompanhamento.

**Por que enviamos:** o programa longo não usa o WhatsApp automático de risco do curso curto. A cobrança é no **grupo da turma**, com o texto que a equipe escolher na Gupshup (ou um recado humano no grupo).

**Como chega:** grupo da turma (mão da gestora). Não é o número do programa disparando sozinho.

**O que esta mensagem não faz:** não envia lote. Não usa a regra de 10 dias do curso pela internet. Não é um dos seis alertas automáticos.

**Variáveis obrigatórias:** nome social (se o recado for individual); nome do programa.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

---

## 9. Depois da formação

### Convite da live e últimos passos

**Quando:** pela internet, o negócio fez **todas** as atividades. A gestora dispara o convite da live. Canal: **Meet** ou **YouTube + StreamYard**, o que ela escolheu.

**Para quem:** só quem chegou a 100%.

**Por que enviamos:** a live, a palavra-chave de presença e o questionário final são os últimos degraus antes da equipe **poder** doar.

**Como chega:** e-mail é o caminho típico; WhatsApp com o mesmo texto, se a edição ligar. Depois da live, o aplicativo pede a palavra-chave e o questionário — isso pode ir também num recado da Gupshup com link de acesso.

**O que esta mensagem não faz:** assistir à live, sozinha, não libera doação. Ela **não pede** doação. Doação **nunca** é automática: a equipe ainda sugere e aprova.

**Variáveis obrigatórias:** nome social; nome do programa; data; hora; link da transmissão; prazo da palavra-chave; link de acesso.

**Variáveis opcionais:** edição; unidade; turma; canal (Meet ou YouTube).

**Texto:** a revisar.

---

### Mentoria disponível

**Quando:**

- Pela internet: no encerramento, quando a equipe abre a mentoria para quem chegou ao fim / teve doação aprovada. Ela preenche um diagnóstico no aplicativo.
- Presencial ou híbrido: durante o programa, quando ela pede ou a gestora inclui.

**Para quem:** quem está nesse recorte.

**Por que enviamos:** avisar que a conversa de mentoria existe e qual o próximo passo (preencher o diagnóstico, esperar combinação, ou ver o horário).

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto, quando for aviso da plataforma. O combinado fino com a mentora pode ser conversa um a um — **fora** da Gupshup.

**O que esta mensagem não faz:** não marca a sessão como feita. Não substitui o treino da voluntária.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

---

### Doação aprovada — dados de recebimento

**Quando:** a gestora da unidade **aprovou** a doação. Este é o **único** aviso de doação: ela **não pede**. Três tipos: dinheiro, insumo ou equipamento.

**Para quem:** a empreendedora (e sócias do mesmo negócio, quando for o caso).

**Por que enviamos:** pedir conta ou PIX (dinheiro) ou endereço com ponto de referência (insumo/equipamento), e os aceites. A tela do aplicativo mostra **aguarde** — sem data prometida de pagamento ou entrega.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto, com link de acesso. O preenchimento é no aplicativo.

**O que esta mensagem não faz:** não promete dia de crédito. Não é o comprovante final. Não existe pedido dela no aplicativo.

**Variáveis obrigatórias:** nome social; nome do programa; tipo da doação; link de acesso. No dinheiro, **valor real** se o aviso mostrar valor.

**Variáveis opcionais:** edição; unidade; turma; itens (sem valor estimado).

**Texto:** a revisar.

Intenção: alegria contida; o tipo (dinheiro, insumo ou equipamento); o que ela precisa informar; “aguarde a educadora”; sem data.

---

### Recibo da doação

**Quando:** o aplicativo libera o recibo — **antes** do pagamento, se for dinheiro; **depois** que ela confirma o recebimento, se for produto.

**Para quem:** quem tem recibo para assinar.

**Por que enviamos:** formalizar o recebimento.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto, com link de acesso para assinar.

**O que esta mensagem não faz:** não substitui a conferência da equipe.

**Variáveis obrigatórias:** **nome completo**; tipo da doação; link de acesso (assinatura no app).

**Variáveis opcionais:** edição; unidade; turma. O recado que avisa o recibo chama pelo **nome social**.

**Texto:** a revisar.

---

### Certificado do programa

**Quando:** o **negócio** atinge o percentual da edição (em geral, boa parte das atividades feitas). Todas as sócias daquela edição recebem.

**Para quem:** cada sócia vinculada.

**Por que enviamos:** reconhecer a conclusão.

**Como chega:** WhatsApp automático (PDF). E-mail com o mesmo texto, se a edição ligar. O certificado também fica no aplicativo.

**O que esta mensagem não faz:** não é o certificado da mentoria (esse é outro, por sessão). Não é o certificado da voluntária.

**Variáveis obrigatórias do PDF:** **nome completo**; tipo; carga horária, se houver.

**Variáveis obrigatórias do recado que avisa:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: parabéns; o PDF; guardar e compartilhar se quiser.

---

### O programa acabou

**Quando:** a edição encerra o ciclo de formação.

**Para quem:** quem participou e não desistiu.

**Por que enviamos:** fechar a conversa automática da jornada e avisar o que ainda pode acontecer (pesquisa, mentoria em andamento).

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto.

**O que esta mensagem não faz:** não apaga o acesso ao aplicativo. Não dispara a pesquisa após a formação (isso são os dias do CMS).

**Variáveis obrigatórias:** nome social; nome do programa.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

---

### Pesquisa após a formação (dias no CMS)

**Quando:** passaram os **dias definidos no CMS** depois do fim da formação (padrão cerca de 30). O backend dispara. A gestora **não** tem tela de disparo como caminho principal.

**Para quem:** as participantes da edição.

**Por que enviamos:** acompanhar o negócio depois da formação. É o terceiro momento de escuta: chegada, NPS no fim da formação, e esta pesquisa.

**Como chega:** WhatsApp automático e/ou e-mail, mesmo texto, com link de acesso. Ela responde no aplicativo (UC82).

**O que esta mensagem não faz:** não reabre o curso. Não é o Questionário Final da live. Não é o módulo de encontros de encerramento presencial ou híbrido. Não é um dos seis alertas.

**Variáveis obrigatórias:** nome social; nome do programa; link de acesso.

**Variáveis opcionais:** edição; unidade; turma.

**Texto:** a revisar.

Intenção: “e o seu negócio agora?”; poucos minutos; tom de cuidado, não de prova.

---

### Novo link de acesso

**Quando:** ela pede para entrar de novo no aplicativo (empreendedora), ou o recado da jornada já traz um link para uma atividade específica.

**Para quem:** a pessoa que pediu ou o destino daquele recado.

**Por que enviamos:** não existe senha. O link é a chave.

**Como chega:** WhatsApp ou e-mail, mesmo texto da Gupshup para “seu acesso”.

**O que esta mensagem não faz:** não é código de verificação. Link vencido pede um novo.

**Variáveis obrigatórias:** nome social; **link de acesso** (às vezes já apontando para a aula certa).

**Variáveis opcionais:** edição; unidade; turma; nome do programa.

**Texto:** a revisar.

Intenção: “é só tocar para entrar”; validade curta; se não funcionar, peça de novo.

---

## 10. Voluntárias

Mesmo formato. Os textos desta rede também entram na tabela default (Gupshup), ligados às ações e ao portal. O CMS só aponta o evento para o modelo.

### Cadastro recebido

**Quando:** ela envia a inscrição no portal (pelo programa geral ou por uma ação pontual).

**Para quem:** a recém-inscrita.

**Por que enviamos:** confirmar que o pedido chegou e que a equipe ainda analisa.

**Como chega:** e-mail (caminho típico). WhatsApp só se o Consulado ligar para a rede.

**O que esta mensagem não faz:** não libera o pool de mentorias. Não substitui a aprovação.

**Variáveis obrigatórias:** nome social.

**Variáveis opcionais:** título da ação (se veio de uma ação); período.

**Texto:** a revisar.

---

### Cadastro aprovado e convite ao treino

**Quando:** a gestora de voluntariado aprova o cadastro.

**Para quem:** voluntária agora ativa na rede, ainda com o módulo de treino pela frente.

**Por que enviamos:** abrir o portal e pedir o treino. Sem o treino ela não vê demandas nem outras ações.

**Como chega:** e-mail, com link de acesso.

**O que esta mensagem não faz:** não a coloca numa mentoria.

**Variáveis obrigatórias:** nome social; link de acesso.

**Variáveis opcionais:** título da ação; período.

**Texto:** a revisar.

---

### Link de acesso da voluntária

**Quando:** ela pede para entrar no portal (informa o e-mail cadastrado).

**Para quem:** cadastro existente (mesmo em análise: o link abre a tela de aguardo).

**Como chega:** **só e-mail**.

**O que esta mensagem não faz:** não confirma senha — não há senha.

**Variáveis obrigatórias:** nome social; **link de acesso**.

**Variáveis opcionais:** nenhuma.

**Texto:** a revisar.

---

### Convite para uma ação pontual

**Quando:** a gestora de voluntariado convida alguém da rede — ou uma pessoa nova — para uma palestra, gravação ou oficina.

**Para quem:** o recorte que ela escolheu.

**Por que enviamos:** a ação pode existir até sem um programa de empreendedoras.

**Como chega:** **e-mail** (não há WhatsApp automático pago nesta rede). O texto-modelo da ação está na Gupshup; cada disparo pode ganhar um parágrafo personalizado, com o link daquela iniciativa.

**O que esta mensagem não faz:** não confirma a vaga. A gestora ainda confirma ou recusa a inscrição.

**Variáveis obrigatórias:** nome social; título da ação; período.

**Variáveis opcionais:** link da página da ação.

**Texto:** a revisar.

---

### Ação confirmada ou recusada

**Quando:** a gestora de voluntariado decide sobre a inscrição.

**Para quem:** quem se inscreveu naquela ação.

**Como chega:** e-mail, mesmo modelo da Gupshup, com dois textos (sim / não).

**O que esta mensagem não faz:** a confirmação ainda não emite certificado (o certificado sai quando a ação **termina**, para todo o grupo confirmado).

**Variáveis obrigatórias:** nome social; título da ação.

**Variáveis opcionais:** período.

**Texto:** a revisar.

---

### Mentoria combinada

**Quando:** a sessão foi alocada ou aceita.

**Para quem:** a voluntária (e, se a equipe quiser um eco na Gupshup, a empreendedora — ver ficha “Mentoria disponível”).

**Como chega:** e-mail opcional da Gupshup. O WhatsApp um a um entre mentora e mentorada **não** é texto da Gupshup.

**O que esta mensagem não faz:** não registra horas. Não emite certificado da sessão.

**Variáveis obrigatórias:** nome social; link de acesso.

**Variáveis opcionais:** título da ação; período.

**Texto:** a revisar.

---

### Certificado da voluntária

**Quando:** a mentoria individual termina (um certificado por pessoa e por sessão) **ou** a ação pontual se encerra (certificado de participação para todas as confirmadas). Mentoria coletiva **não** gera este certificado.

**Para quem:** quem concluiu aquele papel.

**Como chega:** e-mail; o PDF também fica no portal.

**Variáveis obrigatórias do PDF:** **nome completo**; tipo (mentoria ou ação); carga horária, se houver.

**Variáveis obrigatórias do recado que avisa:** nome social.

**Variáveis opcionais:** período; data.

**Texto:** a revisar.

---

## 11. Quem opera o sistema

### Link de acesso da gestora

**Quando:** ela pede para entrar no aplicativo de gestão.

**Para quem:** gestora de unidade, de turma ou de voluntariado.

**Como chega:** **só e-mail**.

**O que esta mensagem não faz:** não é mala direta de operação. Não avisa pendência de empreendedora.

**Variáveis obrigatórias:** **link de acesso**.

**Variáveis opcionais:** nome social (se a gestora tiver cadastro com esse campo).

**Texto:** a revisar.

Intenção: “toque para entrar”; sem relatório junto.

---

## 12. O que este documento pede à equipe

Para cada ficha em **texto: a revisar**, o Consulado fecha o parágrafo **na Gupshup** (e o assunto do e-mail, se quiser — o **corpo** é o mesmo).

A tabela default da UC88 já lista todos os eventos com as mesmas colunas (obrigatórias / opcionais). No CMS, conferir se **todo evento** aponta para um modelo. Pacote ou edição só troca o ponteiro — e só então mudar o modelo na Gupshup para o ano seguinte.
