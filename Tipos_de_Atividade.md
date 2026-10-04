# Tipos de Atividade dos Módulos

## 1. Introdução

Este documento descreve, em detalhe, cada tipo de atividade que pode compor os módulos dos programas do Consulado da Mulher. O **Administrador** monta a matriz no CMS; o **Gestor** libera e acompanha no **Aplicativo Gestor**; a **empreendedora** realiza no **Aplicativo Cliente**.

Escopo: o que o gestor configura antes de liberar, como a atividade é comunicada às participantes, como o gestor acompanha a realização e quais regras se aplicam a cada tipo.

Relação com outros documentos:

- [Casos de Uso - Consulado da Mulher_v8.md](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v8.md) — casos de uso completos (UC15, UC34, UC13, UC33, UC35, UC44, UC45, UC53, UC78, UC80 etc.).
- [prototipo/Aplicativo Gestor.md](prototipo/Aplicativo%20Gestor.md) — visão geral das telas e da navegação.

São **12 tipos** de atividade, definidos no catálogo de tipos de atividade (canônico com UC15). A reunião **24/ago.** unificou **Evento Presencial** e **Aula ao Vivo** no tipo **Aula**; a **natureza original** (presencial ou ao vivo) é definida no **CMS** (UC15) e operacionalizada na **liberação** do Gestor (UC34), com possibilidade de alteração até ministrar. A escuta do **programa** no módulo é o trio **chegada** (Questionário Inicial), **NPS** e **Encerramento** (cerca de 30 dias depois).

**Fora da enum** (não são tipos montáveis no módulo):

- **Temporizador** e **Texto aberto** — mecânica da jornada online (UC33).
- **Certificado** — emissão/consulta (UC55/UC63).
- **Conteúdo extra** (UC35) — item pontual além da matriz; **não** conta %/carga/beneficiamento.
- **Atividade de presença (palavra-chave)** pós-live de encerramento online — mecânica do funil UC38 (libera o Questionário Final); **não** é um tipo na matriz do módulo.

## 2. Tabela-resumo

| Tipo | Modalidades | Agenda exigida | Entrega/aprovação | Progresso medido por |
| ---- | ----------- | -------------- | ----------------- | -------------------- |
| Aula | Presencial, Híbrido | Presencial: data, hora e local · Ao vivo: data e hora | Não | Presentes ou compareceram / total |
| Vídeo Aula | Todas | Data-prazo | Não | Assistiram / não assistiram |
| Atividade | Todas | Data-prazo | Não | Fizeram / não fizeram |
| Tarefa de Casa | Todas | Data-prazo | Sim | Aprovadas ou em revisão / total |
| Registro de Faturamento | Todas | Data-prazo | Sim | Registros aprovados / total |
| Download de Conteúdo | Todas | Data-prazo | Não | Baixaram / não baixaram |
| Plano de Ação | Todas | Data-prazo | Não (gestão de metas) | Fizeram / não fizeram |
| Visita Técnica | Presencial, Híbrido | Agendamento individual (presencial ou online — UC78) | Sim (registro da visita) | Visitas realizadas / participantes |
| Questionário Inicial | Todas | Prazo no módulo (chegada) | Não | Responderam / não responderam |
| Questionário Final | Todas | Data-prazo | Não | Responderam / não responderam |
| NPS | Todas | Prazo no módulo (fim da formação) | Não | Responderam / não responderam |
| Encerramento | Todas | Atraso no módulo (cerca de 30 dias depois do fim da formação) | Não | Responderam / não responderam |

Em programas **online** não existem Aula nem Visita Técnica (ver seção 5). A Visita Técnica só existe em edição **presencial/híbrido**; o agendamento 1 a 1 pode ser presencial ou por videoconferência (UC78).

## 3. Ficha por tipo

### 3.1 Aula

**Descrição e finalidade.** Encontro síncrono da turma — **presencial** (local físico) ou **ao vivo** (Meet/plataforma). Unifica os antigos tipos “Evento Presencial” e “Aula ao Vivo” (reunião 24/ago.). É o principal momento de vínculo do programa presencial/híbrido (boas-vindas, oficinas temáticas, encerramento como **módulo obrigatório de carga** em P/H).

**Configuração CMS (UC15).** **Natureza original** (`presencial` ou `ao_vivo`); **título**; **descrição** (e dica/anexos metodológicos, quando previstos). **Sem** data, hora, local ou link — campos operacionais ficam no Gestor.

**Configuração Gestor (UC34 — liberação).** Data, hora e **endereço** (presencial) **ou** **link** Meet/plataforma (ao vivo). Natureza **pré-preenchida** conforme o CMS, **editável** até ministrar.

| Natureza | Obrigatório na liberação | Presença |
| -------- | ------------------------ | -------- |
| **Presencial** | Data, hora e **endereço** (não retroativos); anexos | QR Code + registro manual (UC40/UC41); relato “Como foi o encontro” (UC80) |
| **Ao vivo** | Data e hora; **link** Meet/plataforma | Compareceram / não; **sem** QR físico; replay opcional **não** conta nova presença (UC38) |

**Comunicação.** Template do **pacote UC88** conforme natureza: **`Aula_presencial`** (`{data}`, `{hora}`, `{local}`) ou **`Aula_ao_vivo`** (`{data}`, `{hora}`, `{link}`). Mesmo texto Meta/Gupshup usado no facilitador de grupo (UC50). **Gestor de Unidade** pode editar corpo antes de copiar (P/H).

**Acompanhamento.** Após a liberação, no mesmo acordeão:

- **Presencial:** campo **"Como foi o encontro"**; **QR Code**; **registro manual** com busca por nome ou CPF; indicador **presentes / total**.
- **Ao vivo:** listas **compareceram / não compareceram**, com percentual de adesão; pós-evento, link de replay.

**Regras específicas.** Uma vez registrada a chamada ou marcada qualquer presença (presencial), a liberação **não** pode mais ser cancelada. Conteúdo pontual além da matriz = **conteúdo extra** (UC35), **não** este tipo.

**Status no Gestor:** não liberada (cadeado); liberada com os dados da sessão; após realizada (presencial), exibe "Como foi o encontro".

### 3.2 Vídeo Aula

**Descrição e finalidade.** Conteúdo gravado, hospedado na plataforma educacional, que a participante assiste no seu tempo. Em programas online pode existir também **arquivo compatível com WhatsApp** (UC51); o consumo oficial para conclusão permanece na plataforma (UC37).

**Configuração pelo gestor.** Título, descrição, dica de realização e **data-prazo** (sugestão padrão **D+2**). O link na plataforma é gerado automaticamente.

**Comunicação.** Template **Vídeo Aula** do pacote UC88 — prazo e link (`{data_limite}`, `{link_atividade}`). Online: envio API (UC33/UC51); P/H: UC50.

**Acompanhamento.** Lista binária: **assistiram / não assistiram**, com contador e percentual.

**Regras específicas.** Não gera entrega nem fila de aprovação. Conclusão com **80%** assistido (padrão configurável). O vídeo pode ser visto a qualquer momento após a liberação.

Em **P/H**, concluir **dentro do prazo** favorece o indicador de engajamento (desempate em doação e mentorias — UC56/UC85). Em **online**, a jornada não penaliza por “atraso de calendário” (maratona esperada); o prazo serve sobretudo à operação presencial/híbrida.

**Status no Gestor:** não liberada (cadeado); liberada → vídeo no Cliente.

### 3.3 Atividade

**Descrição e finalidade.** Questionário **genérico** (perguntas de resposta simples, múltipla ou aberta), criado e configurado no **Administrador**, distinto de **Questionário Inicial**, **Questionário Final** e **NPS**. Liberado pelo gestor com data-prazo; comunicado com link para a plataforma. No Gestor: quem respondeu / quem não respondeu; consolidado (pizza) das questões objetivas; respostas abertas por empreendedora.

**Configuração pelo gestor.** Data-prazo (conteúdo do instrumento vem do Admin/CMS).

**Comunicação.** Mensagem com prazo e link do questionário.

**Acompanhamento.** Lista **fizeram / não fizeram**; nas que fizeram, acesso às respostas abertas. **Sem** fila de aprovação.

### 3.4 Tarefa de Casa

**Descrição e finalidade.** Exercício prático aplicado ao próprio negócio e/ou ao conteúdo, realizado entre encontros (presencial ou online), com entrega obrigatória na plataforma. Escopo tipicamente de **empreendimento**.

**Configuração.** Título, descrição, dica e arquivos de referência vêm **pré-carregados do CMS** (somente leitura para o gestor). O gestor define **apenas** a data-prazo (padrão D+2) e a comunicação com a turma.

**Comunicação.** Mensagem com prazo e link para enviar a tarefa. No online, o envio WhatsApp segue o OK da empreendedora para o bloco de conteúdos (UC33).

**Acompanhamento (fila de aprovação).** A entrega entra na fila do gestor. Opções:

- **Aprovada** — concluída com sucesso;
- **Revisar** — solicita ajustes com orientação (UC44).

Histórico com canal de comentários entre gestor e empreendedora.

**Regras específicas.** Entrega **nunca é reprovada**. Em **P/H**, entrega após o prazo continua válida para beneficiamento, com **engajamento menor**. Em **online**, registra **realizado / não realizado** sem penalidade de prazo da jornada.

### 3.5 Registro de Faturamento

**Descrição e finalidade.** Reporte periódico ao programa da evolução econômica do negócio (UC45) — **não** é fluxo de caixa pessoal da empreendedora. Preenchimento **pela empreendedora** no Aplicativo Cliente. **Um registro por competência e empreendimento.**

**Campos mensais:** faturamento; renda pessoal; despesas fixas; número de clientes; número de produtos vendidos; investimento; poupança. **Anexo obrigatório** (planilha, foto ou print — reunião 24/ago.). **Seletor de dificuldade** obrigatório (5 níveis com rostos).

**Configuração pelo gestor.** Mês de referência, data-prazo e comunicação.

**Comunicação.** Mensagem com prazo e link do formulário.

**Acompanhamento.** Fila **aprovar** ou **revisar**; consulta a meses anteriores; **gráfico evolutivo** da turma e por participante.

**Regras específicas.** O progresso considera apenas registros **aprovados** — pendentes ou em revisão não contam. Valor **0** em faturamento ou renda exige **observação/justificativa obrigatória** (reunião 20/ago.). Sem anexo o envio é bloqueado.

### 3.6 Download de Conteúdo

**Descrição e finalidade.** Material de apoio para uso autônomo (caderno, planilha, checklist, kit de artes etc.).

**Configuração pelo gestor.** Título, descrição, anexos e data-prazo sugerida.

**Comunicação.** Template **Download** do pacote UC88 (`{titulo}`, `{data_limite}`, `{link_atividade}`). **Online:** após o **OK** da empreendedora, o backend envia o template **e os arquivos do material** no WhatsApp dela (UC33/UC51) — não é só o link. Os **mesmos documentos** ficam disponíveis no Aplicativo Cliente. **P/H:** o mesmo template vai para o clipboard do grupo (UC50); os arquivos permanecem no Cliente. O envio dos documentos no WhatsApp da online **não** depende do checkbox de videoaula (UC9).

**Acompanhamento.** Lista **baixaram / não baixaram**.

**Regras específicas.** Não gera entrega nem fila de aprovação. Conclusão oficial = baixou / marcou no **Aplicativo Cliente**. Receber o arquivo no WhatsApp **não** conclui a atividade por si só.

### 3.7 Plano de Ação

**Descrição e finalidade.** Definição das metas do empreendimento para o período (plano inicial, metas de 90 dias, formalização etc.).

**Configuração pelo gestor.** Título, orientação e data-prazo.

**Comunicação.** Mensagem com prazo e link do plano na plataforma.

**Acompanhamento.** Lista **fizeram / não fizeram**. Ao abrir o plano, o gestor pode **criar metas**, **Revisar** (com observação) e **alterar o status** de cada meta. **Histórico de edições preservado**; **sem exclusão destrutiva** de metas (reunião 20/ago.). Status pode ir para análise das gestoras.

### 3.8 Visita Técnica

**Descrição e finalidade.** Atendimento do gestor à empreendedora (diagnóstico ou acompanhamento), **individual**, não coletivo. Em P/H o agendamento pode ser **presencial** (local do negócio/residência) ou **online** (videoconferência) — UC78.

**Configuração pelo gestor.** A liberação abre a **agenda de visitas técnicas**, com calendário e agendamento por participante: data, hora e endereço (ou link/canal se online).

**Apoio logístico.** A agenda **agrupa endereços próximos** (raio aproximado de **2 km**) e **detecta conflitos** de horário na mesma data.

**Acompanhamento.** Painel de visitas pendentes por turma e registro do que foi observado na visita.

**Regras específicas.** **Não existe** em programas online (edição 100% online).

### 3.9 Questionário Inicial

**Descrição e finalidade.** Chegada — diagnóstico de entrada da empreendedora e do negócio, no início da jornada. Primeira das **três escutas do programa** no módulo (chegada, NPS e Encerramento). Instrumento distinto do tipo **Atividade** (genérico) e do Questionário Final da live.

**Configuração no módulo (UC15).** Prazo ou data e o recado do pacote de comunicação da edição — sem texto solto. A automação dispara a partir dessa programação.

**Acompanhamento.** Lista de respondentes e **gráfico de pizza** com a distribuição das respostas e a adesão da turma (UC39).

### 3.10 Questionário Final

**Descrição e finalidade.** Instrumento do **funil pela internet** (prova depois da palavra-chave). **Não** é o Encerramento de cerca de 30 dias nem o módulo de encontros de encerramento presencial ou híbrido.

**Configuração e acompanhamento.** Data-prazo e comunicação; lista de respondentes e pizza (UC39).

**Funil de doação (UC38):** após a live (YouTube + StreamYard, fora da plataforma), o sistema libera a **atividade de presença** para informar a **palavra-chave** (sem diferenciar maiúscula, minúscula ou acento; prazo rígido; marca o instante). **Somente com a palavra válida** o Questionário Final é liberado; **somente 100% de acerto** deixa a empreendedora **liberada para doação**. Regra canônica = **uma palavra-chave** no fim da live (várias palavras = em discussão).

**Módulo de encerramento presencial ou híbrido:** encontros de **carga obrigatória** (≠ funil pela internet e ≠ esta prova); doação por análise manual a qualquer momento (UC57).

### 3.11 NPS

**Descrição e finalidade.** Satisfação com o programa no **fim da formação**. Segunda das três escutas do módulo (chegada, NPS e Encerramento). Máscara única para o curso pela internet, presencial e híbrido.

**Configuração no módulo (UC15).** Prazo e o recado do pacote — sem texto solto.

**Acompanhamento.** Lista de respondentes e gráfico por faixa (**promotoras**, **neutras**, **detratoras**).

### 3.12 Encerramento

**Descrição e finalidade.** Questionário de acompanhamento enviado **cerca de 30 dias depois** do fim da formação. Terceira escuta do programa no módulo. A empreendedora responde (UC82); o backend envia no dia combinado; o painel de dados vê as respostas.

**Não é** o Questionário Final da live (prova de 100% certo para doação). **Não é** o módulo de encontros de encerramento presencial ou híbrido (carga obrigatória).

**Configuração no módulo (UC15).** Atraso (ex.: 30 dias após o fim da formação), canal e recado do pacote da edição. O gestor **não dispara** e **não** escolhe edição na hora do envio. Sem formulário paralelo no CMS.

**Acompanhamento.** Lista de respondentes e pizza no detalhe da atividade (UC34); consolidação no painel de dados.

## 4. Regras transversais

- **Beneficiamento.** Toda atividade **da matriz** liberada conta para classificar a empreendedora como beneficiada (UC13). **Conteúdo extra** (UC35) **não** conta %/carga/beneficiamento.
- **Validação da liberação.** A data é obrigatória e não pode ser retroativa; Aula presencial exige endereço; Aula (ambas as naturezas) exige horário.
- **Cancelamento e reativação.** Liberação só pode ser cancelada enquanto **não** houver presença registrada nem entrega submetida. Cancelada, a atividade some para as participantes e **não** conta no beneficiamento; o gestor pode reativá-la.
- **Aprovação sem reprovação (UC44).** Entregas resolvidas como **aprovada** ou **revisar**, com comentários entre gestor e empreendedora.
- **Conteúdo extra (UC35).** Em presencial/híbrido, o gestor de turma pode adicionar item pontual além da matriz (presencial ou ao vivo); **não** altera a enum; **não** conta %/carga; enquanto não liberado, pode ser excluído.
- **Comunicação.** Textos centralizados no **pacote de comunicação** (UC88). **Um recado por tipo** (aula presencial e aula ao vivo são dois). Chegada, NPS e Encerramento, no módulo, apontam o recado do pacote e o quando (prazo ou atraso) — sem texto solto. No presencial ou híbrido: a gestora cola no grupo (UC50); a gestora de unidade pode ajustar o corpo antes de enviar. No curso pela internet: a automação envia depois da aprovação (UC33); no tipo **Download**, o lote leva o recado **e os arquivos** no WhatsApp, e os mesmos documentos ficam no Cliente. Alertas (evasão, atraso, resgate) na **mesma área CMS** (UC87).

### Risco de evasão — dois níveis

| Perfil | Modalidade típica | Duração | Regra de risco |
| ------ | ----------------- | ------- | -------------- |
| **Longa duração** | Presencial / híbrido | **6–12 meses** | Silêncio ≥ **15 dias** sem feedback/participação relevante **e** represamento alto (faltas a encontros / atividades liberadas pendentes). Acompanhamento no Gestor (UC56); sem a mesma automação WhatsApp do online. |
| **Curta duração** | Online | **~1 mês** | Atividades liberadas **não realizadas há mais de 10 dias** **ou** a **5 dias do término** ainda há pendências → mensagens de alerta/incentivo (UC53). Maratona com acesso recente (**represada ativa**) **não** é risco. |

## 5. Modalidade online

Na jornada 100% online (ex.: Empreende no Zap):

- Não existem **Aula** nem **Visita Técnica**; também não há controle de presença de encontro físico (exceto a **atividade de presença/KW** do funil de encerramento — UC38).
- O gestor **não libera** atividades manualmente. Após **Comunicar aprovação** (UC25), a **automação por temporizador** (UC33) libera cada conteúdo na ordem dos módulos, com intervalo configurado no módulo (padrão **3 dias** entre liberações).
- Tipicamente **um módulo por vez**, duração de cerca de **1 mês**.
- Cada atividade exibe o passo da régua e a data prevista (“agendada”) ou o status “liberada pela automação”.
- O conteúdo é entregue pelo **WhatsApp**: a participante responde **"OK"** para receber o próximo lote. No tipo **Download**, o lote inclui o template **e os arquivos**; os mesmos documentos ficam no Aplicativo Cliente. Não há grupo de turma para comunicação em massa.
- Unidade e turma são únicas; não há seleção de turma nas telas.
- No Aplicativo Cliente: atividades ainda não liberadas aparecem com **cadeado**; ao serem liberadas, ficam disponíveis. Se a empreendedora concluir na plataforma uma atividade já liberada, a automação **não** precisa reenviar essa atividade pelo WhatsApp.
- **Encerramento / doação:** 100% das atividades → live YouTube+StreamYard → presença/KW → Questionário Final 100% certo → liberada para doação (UC38/UC57).

## 6. Matriz de módulos

A cada edição, módulos e atividades são planejados de novo: temas podem mudar e, em cada módulo, entram quaisquer dos **12 tipos** permitidos pela modalidade.

### 6.1 Presencial e híbrido

Edições costumam ter **vários módulos** e duração **mais longa** (tipicamente **6–12 meses**). Risco de evasão = perfil **longo** (seção 4). Encerramento como **módulo obrigatório de carga** (≠ funil online).

### 6.2 Online

Edições costumam ter **um módulo** por vez e duração de cerca de **1 mês**. Risco de evasão = perfil **curto** (seção 4).
