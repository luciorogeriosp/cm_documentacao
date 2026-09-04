jul. 3, 2026

## **Reunião em 3 de jul. de 2026 às 14:00 GMT-03:00**

Registros da reunião [Transcrição](https://docs.google.com/document/d/1udVCSjfMI47Mz5Fh_0LhdgggVD0GlRZkykKeLHTpJfU/edit?usp=drive_web&tab=t.cokln2pnv65i) [Gravação](https://drive.google.com/file/d/1u1B9INfMelE_qC8cQDyLOkP8Kst5vHwp/view?usp=drive_web) 

### **Resumo**

O encontro abordou a nova plataforma digital para o consulado com definições técnicas, metodologias e conformidade legal.

**Arquitetura e jornada digital**  
O sistema substituirá controles manuais por uma plataforma digital focada em edições, turmas e gestão de aprendizagem. A jornada do usuário foi desenhada para priorizar interfaces simples e inclusivas devido à vulnerabilidade digital do público.

**Metodologias e gestão operacional**  
A plataforma suportará modelos híbridos com gestão de turmas e automações via WhatsApp para abordagens nacionais. Gestores terão painéis para monitorar indicadores, aprovar inscrições e registrar presenças em atividades presenciais ou remotas.

**Segurança de dados legal**  
Foi decidido utilizar criptografia de sentido único com chave SHA-256 para anonimizar dados históricos em conformidade com a Lei Geral de Proteção de Dados. O projeto seguirá com entregas incrementais planejadas para finalizar o produto funcional até o ano 2027\.

### **Próximas etapas**

- [ ] \[Yann Jaster, Vitor Figueiredo Marques\] Compatibilizar Login: Implementar os requisitos de segurança do consulado no login do Strap. Seguir as regras de senha, expiração e tamanho mínimo de 32 caracteres.

- [ ] \[Alexandre Notte\] Adicionar Ferramenta Unidade: Criar funcionalidade para permitir a alteração de unidade do empreendedor durante a etapa de inscrição. O recurso é necessário para casos de erros na seleção inicial pelo usuário.

- [ ] \[Alexandre Notte\] Criar Novo Módulo: Configurar o módulo de reuniões de chegada no CMS. Adicionar as aulas e testes necessários para estruturar esta etapa inicial do programa.

- [ ] \[Alexandre Notte\] Ajustar Modelo Dados: Remover a associação direta entre colaborador e unidade que se tornou obsoleta. Limpar a estrutura de dados do CMS para evitar redundâncias na gestão das edições.

- [ ] \[O grupo\] Configurar Certificado: Definir os valores necessários de participação para a geração automática de certificados. Determinar se esta configuração será feita no nível da edição ou da turma.

- [ ] \[Alexandre Notte\] Ajustar Painel: Modificar a interface da tela do gestor de unidade. Incluir as secoes em analise e recusado.

- [ ] \[O grupo\] Triangulacao Tecnica: Definir a integracao entre Mautic, o servidor backend e o Strapi. Estabelecer o fluxo de mensagens e automacoes para o programa.

- [ ] \[Dayvid Lima\] Validar Mautic: Avaliar a viabilidade técnica do uso do Mautic em relacao ao desenvolvimento proprio. Confirmar se a integracao atende aos requisitos de automacao do sistema.

- [ ] \[Alexandre Notte\] Implementar Botao: Desenvolver o botao de envio de mensagem para o grupo de WhatsApp em aulas ao vivo. Facilitar a operacionalizacao da comunicacao para o gestor.

- [ ] \[Mateus Welter\] Definir Mautic: Conversar com a equipe para definir os requisitos e a instalacao da ferramenta Mautic.

- [ ] \[Yann Jaster\] Ler documentacao: Realizar a leitura da especificacao tecnica sobre o armazenamento de seguranca de CPF e o modelo de relacionamento.

- [ ] \[Dayvid Lima\] Finalizar validacao: Concluir os testes e a validacao da infraestrutura do servidor Mautic e avisar a equipe sobre a conclusao.

### **Detalhes**

* **Visão geral do sistema e objetivos**: Alexandre Notte apresentou a proposta do sistema para o Consulado da Mulher, que visa substituir os controles manuais atuais por uma solução digital. A arquitetura engloba uma aplicação para o empreendedor (cliente), um portal de gestão para unidades e turmas, back-end para serviços de integração (comunicação, GPS, ferramentas de mensagem), um sistema de gestão de aprendizagem (LMS) para módulos educacionais, além de um BI e integração com o sistema de gestão de dados (Strap) e orquestrador de mensagens ([00:00:00](?tab=t.cokln2pnv65i#heading=h.hu4jkxtlhhqv)).

* **Tratamento de dados históricos**: A base de dados histórica será simplificada e utilizada apenas para consulta de referência, permitindo verificar se o usuário já participou de programas anteriores, sua certificação ou premiação ao inserir o CPF. A partir do novo sistema, haverá uma consulta dupla entre a base legada e a atual ([00:02:12](?tab=t.cokln2pnv65i#heading=h.mt3akzgmbxo)).

* **Jornada do usuário e início do processo**: A jornada começa no site institucional do Consulado da Mulher, que é gerido externamente. A responsabilidade da equipe começa quando o usuário clica no botão para participar, direcionando-o para a URL do sistema educacional dentro de uma edição específica de um programa ([00:05:34](?tab=t.cokln2pnv65i#heading=h.e97u2p6nz54m)).

* **Compatibilidade e interface**: O público-alvo possui vulnerabilidade digital, utilizando dispositivos com menor capacidade e internet limitada. Por isso, as interfaces devem ser leves, rápidas, diretas e simples. Será implementado um alerta de compatibilidade para navegadores (Chrome, Safari, Edge, Firefox, Samsung) caso o dispositivo do usuário esteja fora dos padrões homologados ([00:08:01](?tab=t.cokln2pnv65i#heading=h.4joohz4wohmv)).

* **Processo de pré-inscrição e cadastro**: Para minimizar a desistência de usuários em cadastros longos, haverá uma etapa de pré-inscrição coletando apenas nome, CPF/RNE, e-mail, telefone e escolha da unidade. Dados duplicados serão identificados e associados ao novo programa, enquanto cadastros novos seguirão para o cadastro completo, que separa os dados pessoais do empreendedor dos dados do empreendimento ([00:09:21](?tab=t.cokln2pnv65i#heading=h.wh0udd37qzod)).

* **Inscrição e aprovação**: Após o cadastro, o usuário entra no status de "aguardando". A inscrição é sempre vinculada a uma edição e exige aprovação de um gestor do Consulado para que o usuário prossiga para o programa. O usuário nunca se inscreve fora de uma edição ([00:13:40](?tab=t.cokln2pnv65i#heading=h.jbr5a7vdubkp)).

* **Home do usuário e histórico**: A interface do usuário logado exibirá os programas em que estão inscritos, com status de "aguardando", "ativos" (em curso), "finalizados com sucesso" ou "cancelados/desistentes". Esta página funcionará como um hub central para a jornada do empreendedor ([00:15:03](?tab=t.cokln2pnv65i#heading=h.krz8g769tafa)).

* **Modelo de cursos**: O formato dos cursos será similar ao modelo da Olis Academy, com blocos de vídeo seguidos por material de apoio, tarefas e atividades. As aulas terão estados definidos (concluído, disponível, indisponível/travado), controlados manualmente ou via temporizador ([00:16:22](?tab=t.cokln2pnv65i#heading=h.bacfldehz9ll)).

* **Requisitos de segurança e gestão do CMS**: Yann Jaster destacou a necessidade de implementar requisitos de segurança no Strap, como senhas com 32 caracteres e políticas de expiração. A página inicial do CMS será customizada para servir como um hub de gestão, apresentando estatísticas de projetos e links para outras aplicações ([00:19:30](?tab=t.cokln2pnv65i#heading=h.92x9guykblt1)).

* **Estrutura de dados e metodologia**: O sistema utiliza o conceito de "colaborador" (membro) e organizações associadas a programas. Existem duas metodologias: a híbrida (presencial e online, para o Empreende Mulher) e a online (para o Empreende no Zap). O Empreende Mulher conta com tutor individual, enquanto o Empreende no Zap é sequencial e massificado ([00:22:39](?tab=t.cokln2pnv65i#heading=h.hzsc3equ9eu)).

* **Hierarquia de edições e unidades**: A edição é a base de todas as configurações, incluindo ano de referência e slugs para localização. A hierarquia é definida como: Programa, Edição, Unidade e Turma. As unidades são agrupamentos geográficos, e as turmas são onde o curso acontece. Uma unidade pode ter várias turmas ([00:25:52](?tab=t.cokln2pnv65i#heading=h.ipxhb59udml2)).

* **Gestão de unidades e responsabilidades**: O sistema permitirá associar membros como gestores de unidades e turmas dentro de cada edição. Yann Jaster e Alexandre Notte discutiram a possibilidade de um colaborador ser responsável por múltiplas unidades ou edições ([00:29:04](?tab=t.cokln2pnv65i#heading=h.c4kg5ifi7qaj)).

* **Cronogramas e datas**: Cada edição terá datas configuráveis para abertura e encerramento de inscrições, início e fim da seleção, e duração do programa. O sistema validará se o usuário está tentando acessar dentro do período permitido ([00:33:38](?tab=t.cokln2pnv65i#heading=h.sz2gd2gzm4s0)).

* **Módulos educacionais e ordenação**: Os módulos podem ser criados e ordenados. Eles incluem atividades diversas como aulas presenciais, testes de conhecimento, registros de faturamento (renda, poupança, investimento), lives, lições de casa e upload de arquivos. A ordenação é crucial para a experiência do usuário ([00:35:15](?tab=t.cokln2pnv65i#heading=h.ng7l6f5ot4lm)).

* **Regulamentos e certificados**: Edições possuem regulamentos e critérios para certificação, baseados em metas de participação, beneficiamento e premiação. Alexandre Notte mencionou a necessidade de definir onde esses valores serão configurados ([00:41:51](?tab=t.cokln2pnv65i#heading=h.oegy0qxugbw0)).

* **Gestão de turma**: As inscrições são feitas na edição, mas a alocação do aluno em uma turma específica é realizada pelo gestor da unidade. Isso permite flexibilidade na formação de grupos após a aprovação inicial ([00:45:16](?tab=t.cokln2pnv65i#heading=h.b9ux8vgx83jl)).

* **Painel do gestor de unidade**: O gestor de unidade terá uma ferramenta para lidar com os pré-inscritos (CRM simples), permitindo exportação de leads para ações de marketing, como envio de e-mails ou mensagens via WhatsApp ([00:46:44](?tab=t.cokln2pnv65i#heading=h.mufrolr7mll6)).

* **Processo de aprovação e qualificação**: Na etapa de inscrição, os gestores de unidade analisarão os perfis dos candidatos (renda, escolaridade, localidade) para aprovar ou recusar a participação. A ferramenta deve permitir a mudança de unidade, caso o usuário tenha se inscrito no local incorreto ([00:51:08](?tab=t.cokln2pnv65i#heading=h.qjv96q7zhcsi)).

* **Gestão da fila de candidatos**: O gestor pode manipular o status dos candidatos entre "análise", "aprovado" e "reprovado" para cumprir metas de ocupação das turmas (ex: meta de 50 pessoas). A aprovação efetiva transfere o aluno para o gestor da turma, que conduzirá a operação ([00:55:02](?tab=t.cokln2pnv65i#heading=h.dtvgoahvhogd)).

* **Etapas futuras e gestão de turma**: Alexandre Notte planeja desenvolver as etapas de premiação (capital semente ou produtos) e mentoria. O gestor da turma precisará de funcionalidades adicionais, como registro de presença e gestão de grupos de comunicação, que serão integradas futuramente ([00:58:04](?tab=t.cokln2pnv65i#heading=h.nd2wj59maxwb)).

* **Integração com grupos de WhatsApp**: A equipe discutiu o uso de grupos de WhatsApp como ferramenta de interação entre a gestão da turma e os empreendedores, visando a construção de uma comunidade e a economia de recursos ao evitar disparos automáticos via Gupshup. Alexandre Notte explicou que a gestão pode registrar o grupo na plataforma inserindo o link de convite, o que possibilita o envio de convocações, materiais atrasados e links de contato individual direto para o WhatsApp do empreendedor ([00:59:17](?tab=t.cokln2pnv65i#heading=h.8ky0v8qaztxy)).

* **Processo de registro e engajamento**: Alexandre Notte detalhou que, após o cadastro do grupo, a gestão pode convidar os participantes da turma para entrarem, sendo esta possivelmente a primeira ação automatizada enviada pelo Gupshup. A equipe concordou com a dinâmica, e Alexandre Notte destacou a importância de monitorar o número de pessoas que ingressam no grupo para garantir que todos estejam na mesma página ([01:00:40](?tab=t.cokln2pnv65i#heading=h.8gowsmz29gpy)).

* **Definições de métricas do programa**: Foi discutida a gestão do programa, especificamente as métricas para a participação e certificação dos empreendedores. Alexandre Notte mencionou que o objetivo atual é exigir 50% de participação para que a pessoa se beneficie e 80% para a certificação, incluindo a entrega de atividades interativas como plano de marketing e faturamento, embora a mensuração exata destas informações ainda esteja em definição ([01:02:10](?tab=t.cokln2pnv65i#heading=h.rjq3hzn7nj8x)).

* **Gestão e flexibilidade de módulos**: Os módulos cadastrados na edição, como encontros de chegada e planejamento estratégico, são visualizados pelo gestor da turma, que possui autonomia para aplicar as aulas fora do roteiro padrão. Alexandre Notte exemplificou que, ao aplicar um módulo de encontro de chegada, a gestão define o local, a data e a hora da aula presencial, operacionalizando o envio dessa informação para o grupo de WhatsApp via integração ([01:03:39](?tab=t.cokln2pnv65i#heading=h.y0m75rrylixl)).

* **Operacionalização de aulas presenciais**: A gestão tem a flexibilidade de definir locais específicos (como coworkings ou paróquias) e horários para as aulas presenciais diretamente na plataforma, gerando mensagens preparadas para serem coladas no WhatsApp da turma. Alexandre Notte ressaltou que, após definir os detalhes, a ferramenta facilita a comunicação com os participantes através da cópia da mensagem para a área de transferência ([01:05:10](?tab=t.cokln2pnv65i#heading=h.awwjsf70p72i)).

* **Registro de presença em aulas presenciais**: Foi debatido o mecanismo de controle de presença. Alexandre Notte propôs o uso de QR Codes que, ao serem escaneados pelos participantes, registram a presença de forma automática e persistente ([01:07:52](?tab=t.cokln2pnv65i#heading=h.c1knvwb5q9)). Caso não haja conexão de internet ou disponibilidade técnica, o gestor da turma também pode utilizar uma lista manual de presença na plataforma para marcar quem compareceu ou faltou ([01:08:58](?tab=t.cokln2pnv65i#heading=h.v1y0ya2sg00z)).

* **Atividades extras e personalização**: O gestor da turma tem a liberdade de adicionar atividades extras, como uma aula de fotografia, que não fazem parte do roteiro oficial da edição ([01:10:04](?tab=t.cokln2pnv65i#heading=h.ju1ugp5qo4pa)). Essas atividades extras devem ser presenciais, e o gestor deve definir local e hora, mantendo a estrutura da plataforma atualizada com o aumento da quantidade de módulos e atividades realizadas ([01:11:29](?tab=t.cokln2pnv65i#heading=h.ea98cda6j116)).

* **Gestão de videoaulas**: As videoaulas podem ser enviadas ao grupo de WhatsApp ou, caso a gestão prefira, o envio pode ser cancelado. Alexandre Notte explicou que a plataforma registra o progresso dos empreendedores (ex: 98 de 125 participantes) com base nos dados herdados da situação de cada indivíduo na turma ([01:13:10](?tab=t.cokln2pnv65i#heading=h.kcks57f8i3hp)).

* **Execução de aulas ao vivo**: A plataforma integra links de aulas ao vivo (como YouTube) que são carregados dentro do ambiente do programa. Alexandre Notte esclareceu que, como o participante acessa a plataforma para assistir, o sistema registra automaticamente a presença, e o gestor pode determinar data e hora, enviando o link via WhatsApp ([01:14:30](?tab=t.cokln2pnv65i#heading=h.xyos0ebkkef)).

* **Testes de conhecimento**: A plataforma permite liberar testes de conhecimento e visualizar os resultados consolidados, como a quantidade de respostas por alternativa (A, B, C, D) e um gráfico de desempenho ([01:15:52](?tab=t.cokln2pnv65i#heading=h.j8ulqyflv7m2)). Alexandre Notte observou que, à medida que as atividades progridem, é possível visualizar quantos usuários estão participando e quantos já realizaram a tarefa ([01:17:28](?tab=t.cokln2pnv65i#heading=h.c3juu839r2nd)).

* **Registro de dados financeiros**: Os empreendedores devem enviar seus dados financeiros, e a plataforma disponibiliza uma interface para que o gestor aprove ou solicite ajustes ([01:17:28](?tab=t.cokln2pnv65i#heading=h.c3juu839r2nd)). Alexandre Notte explicou que é possível visualizar o histórico de meses anteriores, arquivos anexados (planilhas, PDFs) e que a gestão pode enviar mensagens via WhatsApp para o empreendedor caso haja pendências ([01:18:58](?tab=t.cokln2pnv65i#heading=h.rt6sbtgzyey3)).

* **Escopo de indicadores**: Embora o foco atual seja em faturamento, renda, poupança e investimento, Alexandre Notte mencionou que há espaço para expandir o sistema para 8 ou 12 indicadores, conforme sinalizado pela necessidade da gestão ([01:20:22](?tab=t.cokln2pnv65i#heading=h.4qau59svqnyb)).

* **Metodologia "Empreende no Zap"**: Alexandre Notte apresentou uma segunda metodologia, focada no online e denominada "Empreende no Zap", que é mais simplificada e baseada em automação de disparos de conteúdo via WhatsApp. Diferente da metodologia híbrida, esta abordagem é nacional, não exige divisão por turmas ou unidades, e o fluxo de conteúdo ocorre sem a intervenção direta de um gestor acompanhando individualmente o empreendedor ([01:21:51](?tab=t.cokln2pnv65i#heading=h.1kzuo17ms1a1)).

* **Fluxo de automação do "Empreende no Zap"**: A jornada do usuário no "Empreende no Zap" é disparada automaticamente após a aprovação da inscrição ([01:29:56](?tab=t.cokln2pnv65i#heading=h.mfeqvh2unvai)) ([01:35:23](?tab=t.cokln2pnv65i#heading=h.ez1mmifc64ow)). O sistema utiliza gatilhos de comunicação para enviar videoaulas e atividades em intervalos de tempo pré-determinados (dias ou horas), e o usuário precisa interagir (ex: responder "OK") para desbloquear conteúdos, incluindo arquivos MP3 de até 15MB ([01:33:49](?tab=t.cokln2pnv65i#heading=h.qa9wupis0hbt)) ([01:37:10](?tab=t.cokln2pnv65i#heading=h.j226gejg4mxe)).

* **Discussão técnica sobre gatilhos e automação**: A equipe debateu a viabilidade de utilizar uma ferramenta externa (Mautic) ou construir uma solução própria para gerenciar esses gatilhos de comunicação ([01:38:51](?tab=t.cokln2pnv65i#heading=h.6ml49bqrdkkb)). Yann Jaster e Dayvid Lima discutiram a necessidade de triangular informações entre o CMS, o banco de dados da plataforma e a ferramenta de automação para registrar se o usuário respondeu ou não aos disparos ([01:40:13](?tab=t.cokln2pnv65i#heading=h.htopxv1vwswx)) ([01:46:57](?tab=t.cokln2pnv65i#heading=h.24urpltfkdwy)).

* **Infraestrutura de automação**: Vitor Figueiredo Marques sugeriu o uso de Cron Jobs no AWS EventBridge para disparar e-mails e WhatsApp, evitando a criação de uma nova dependência. Yann Jaster argumentou que, se a necessidade da gestão for uma interface visual para criar funis (semelhante ao RD Station), a integração com o Mautic pode ser mais eficiente, desde que haja validação da integração com o banco de dados e a API da plataforma ([01:41:33](?tab=t.cokln2pnv65i#heading=h.1zkaqrdagx8p)) ([01:45:33](?tab=t.cokln2pnv65i#heading=h.4xba876j0311)).

* **Retorno de usuário e Webhooks**: Alexandre Notte ressaltou a importância de configurar webhooks para receber o retorno dos usuários e saber se a mensagem foi recebida ou se o usuário interagiu com o conteúdo ([01:46:57](?tab=t.cokln2pnv65i#heading=h.24urpltfkdwy)).

* **Refatoração do projeto Aliança**: A equipe discutiu o aproveitamento da base do projeto Aliança. Decidiram manter a autenticação, porém alterar a lógica de cursos e trilhas para um modelo baseado em "Edição", "Módulo" e "Atividade" ([01:50:03](?tab=t.cokln2pnv65i#heading=h.1fj6k4ij6cux)). Artigos e a relação curso-usuário deixarão de existir, sendo substituídos por uma estrutura onde a edição determina os módulos e atividades ([01:51:23](?tab=t.cokln2pnv65i#heading=h.3zdddqi3pip6)).

* **Lógica de dados de atividades**: Alexandre Notte expressou dúvida sobre como persistir os dados de atividades por turma, dado que cada turma pode ter uma sequência ou adição de atividades específica. Yann Jaster sugeriu que a solução envolve uma leitura triangular entre o CMS e o banco de dados, permitindo que a atividade seja lógica para o CMS, mas persistida no banco próprio da equipe ([01:52:24](?tab=t.cokln2pnv65i#heading=h.qjl0z1pvfjly)).

* **Implementação de DevOps**: Mateus Welter e Dayvid Lima discutiram a instalação do Mautic em um servidor (EC2 ou Docker/ECS), seguindo o padrão das outras aplicações da equipe ([01:53:51](?tab=t.cokln2pnv65i#heading=h.vfw2ogbfpi7m)).

* **Documentação**: Alexandre Notte reforçou a necessidade de consultar a pasta de documentação de engenharia, que contém o modelo de entidade-relacionamento (MER) e os casos de uso atualizados, apesar de a documentação ser considerada uma tarefa desafiadora ([01:56:22](?tab=t.cokln2pnv65i#heading=h.xnkzo48yqdey)).

* **Conformidade com a LGPD e Armazenamento de Dados**: Alexandre Notte introduz um problema relacionado à LGPD, que impede o armazenamento de dados de usuários após cinco anos, ao mesmo tempo em que a equipe precisa identificar participações históricas em programas. Para solucionar isso, propõe-se a conversão dos CPFs em um padrão de criptografia de sentido único (hash SHA-256 com chave), permitindo verificar se um usuário já participou de um programa sem reter o dado sensível original após o período permitido ([01:57:37](?tab=t.cokln2pnv65i#heading=h.jismbzpb9ow)).

* **Debate sobre a Técnica de Criptografia e Acesso aos Dados**: Vitor Figueiredo Marques, Yann Jaster e Alexandre Notte discutem a eficácia e a natureza da técnica de criptografia proposta. O grupo esclarece que o método é de sentido único (one-way), onde a chave é utilizada apenas para verificar se o hash foi gerado pelo sistema e prevenir ataques de força bruta, não permitindo a descriptografia dos dados ([02:02:08](?tab=t.cokln2pnv65i#heading=h.pd765e5ghfda)) ([02:05:21](?tab=t.cokln2pnv65i#heading=h.4diybol5nn1o)). Eduardo Magno reforça que a conformidade com a LGPD exige que o sistema não possua a capacidade de acessar os dados originais após cinco anos, e a equipe confirma que o sistema guardará apenas o hash associado a informações de participação, respeitando essa restrição legal ([02:04:17](?tab=t.cokln2pnv65i#heading=h.jnrty979klg)).

* **Objetivos Funcionais do Sistema de Histórico**: Alexandre Notte e Dayvid Lima detalham a finalidade do sistema, que é manter um registro anonimizado da trajetória do participante, incluindo informações como premiações, certificações ou desistências, sem armazenar dados pessoais como nome, e-mail, telefone ou endereço ([02:07:30](?tab=t.cokln2pnv65i#heading=h.pq18d03uunoe)). Quando um usuário insere seu CPF atual, o sistema realiza o hash do dado e verifica a existência de um correspondente na base legada, permitindo a exibição do histórico de participação do usuário ou gestor na interface sem expor a identidade original do usuário nos registros antigos ([02:08:37](?tab=t.cokln2pnv65i#heading=h.qxhfyx6hdpu7)).

* **Planejamento de Cronograma e Desenvolvimento**: Alexandre Notte apresenta o cronograma do projeto, prevendo a apresentação do protótipo na semana seguinte e a finalização da documentação durante o mês sete. O desenvolvimento do MVP está planejado para ocorrer nos meses oito, nove, dez e onze, com o objetivo de estar pronto para as edições de 2027 ([02:11:38](?tab=t.cokln2pnv65i#heading=h.39vq6ebjif9g)). A estratégia de desenvolvimento adotada será baseada em sprints de duas a três semanas, com entregas incrementais que ocorrerão de forma paralela para logins, interfaces de cliente e de gestor ([02:12:56](?tab=t.cokln2pnv65i#heading=h.1tl1mje79ryf)).

* **Status da Infraestrutura**: Mateus Welter confirma que o servidor e o banco de dados estão operacionais. Dayvid Lima reporta estar realizando as validações finais e enfrentando erros técnicos no ambiente, com a expectativa de concluir os ajustes necessários em breve ([02:12:56](?tab=t.cokln2pnv65i#heading=h.1tl1mje79ryf)).

*Revise as anotações do Gemini para checar se estão corretas. [Confira dicas e saiba como o Gemini faz anotações](https://support.google.com/meet/answer/14754931)*

*Como está a qualidade de **destas observações?** [Responda a uma breve pesquisa](https://google.qualtrics.com/jfe/form/SV_9vK3UZEaIQKKE7A?confid=_Lix9eU951srIyT6ZhG5DxIQOAIIigIgABgFCA&detailid=standard&screenshot=false) para nos dar seu feedback, incluindo o quanto as observações foram úteis para o que você precisa.*