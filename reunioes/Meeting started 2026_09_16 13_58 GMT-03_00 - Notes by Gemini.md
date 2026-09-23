set. 16, 2026

## **Reunião em 16 de set. de 2026 às 13:58 GMT-03:00**

Registros da reunião [Transcrição](https://docs.google.com/document/d/1jdkIU-7gTUunBudwdpOw_03S6-865ra1Fzp8s0x_lfY/edit?usp=drive_web&tab=t.4zqjs3890o2e) [Gravação](https://drive.google.com/file/d/1tFz38CKJ-keGap0bStlCpVBpZgS7ok_E/view?usp=drive_web) 

### **Resumo**

Reunião alinhou cronograma de desenvolvimento, fluxos de automação de formulários e definições da plataforma de voluntariado.

**Configuração de formulários automáticos**  
A integração automática do regulamento nos formulários garante o cumprimento dos requisitos legais. Testes técnicos são conduzidos em ambiente de homologação para preservar a integridade dos dados oficiais.

**Gestão e interface voluntariado**  
A arquitetura permite visibilidade de ações ativas através de links exclusivos para inscrições diretas. Design de interface foi postergado para concentrar esforços nas regras de negócio funcionais.

**Cronograma e estruturação dados**  
Ficou estabelecido que a entrega final do sistema ocorrerá até 30 de outubro. O modelo de formulário integrado permitirá captar interesses variados dos usuários em um único cadastro.

### **Decisões**

## Precisa de mais conversa

* **Estrutura do formulário de cadastro de voluntários** A proposta de utilizar um cadastro vinculado a uma ação específica com opção de extensão para outros projetos permaneceu em aberto para ser concluída na reunião seguinte.

## Alinhada

* **Realização de testes no ambiente de homologação** Ficou alinhado que todos os testes do sistema devem ser realizados exclusivamente no ambiente de homologação.

* **Data de lançamento e abertura das inscrições** Ficou acordado que o lançamento oficial e a abertura das inscrições do programa ocorrerão em 15 de novembro.

* **Prazo limite para entrega e parametrização do sistema** Estabeleceu-se o dia 30 de outubro como prazo limite para a entrega do sistema pronto para parametrização.

* **Criação do perfil de gestor de voluntariado** Aprovou-se a criação de um perfil específico de gestor de voluntariado dentro do aplicativo de gestão.

### **Próximas etapas**

- [ ] \[Sandra, Alexandre, Daniele\] Agendar testes: Agendar uma reunião para a realização dos primeiros testes do sistema de forma acompanhada.

- [ ] \[Alexandre\] Criar documento de validação: Elaborar um documento contendo todos os textos e layouts dos objetos para a posterior validação da equipe.

- [ ] \[O grupo\] Validar textos e layout: Analisar e validar os textos e o layout da plataforma após o recebimento do documento preparado.

- [ ] \[Sandra, Daniele\] Definir comunicação: Desenvolver os textos das mensagens automáticas de comunicação para o sistema.

- [ ] \[Alexandre Notte\] Implementar edição: Adicionar um botão de edição na interface de gestão de ações para permitir correções de dados cadastrados.

- [ ] \[Alexandre Notte\] Gerar slugs: Desenvolver a funcionalidade de geração automática de slugs para cada nova ação criada no sistema.

- [ ] \[Alexandre Notte, Heitor N Cruz, Sandra\] Projetar formulário: Definir a lógica do formulário dinâmico de inscrição para voluntários. Incluir campos adaptáveis de acordo com a ação selecionada e opções para demonstrar interesse em outros programas.

- [ ] \[Alexandre Notte\] Configurar convites: Incluir o campo de texto personalizado nas ferramentas de convite para garantir que a comunicação seja específica para cada ação.

- [ ] \[Daniele Cavichio\] Alterar Horário Reunião: Atualizar o convite da reunião para o novo horário das 14:00 até as 16:00 e enviar a notificação para todos os participantes.

### **Detalhes**

* **Obrigatoriedade e Automação do Regulamento no Cadastro**: A representante Daniele Cavichio expressou receio de que as pessoas participantes pudessem criar cadastros e esquecer de incluir o link do regulamento obrigatório. O desenvolvedor Alexandre Notte esclareceu que o regulamento será inserido automaticamente como um link na parte inferior do formulário, garantindo que o requisito seja cumprido de forma sistemática ([00:00:00](?tab=t.4zqjs3890o2e#heading=h.hu70o3mpu23y)).

* **Ferramenta de Desenvolvimento e Geração de Dados de Teste**: O desenvolvedor Alexandre Notte apresentou a ferramenta de desenvolvimento que permite gerar dados fictícios rapidamente em todo o formulário durante a fase de testes. Foi sugerido que a equipe utilize essa facilidade apenas no ambiente de homologação, enquanto as pessoas usuárias reais preencherão seus próprios dados em produção ([00:01:12](?tab=t.4zqjs3890o2e#heading=h.fe7p61rjmtav)).

* **Formulários Específicos e Necessidade de Criação de Edição**: O desenvolvedor Alexandre Notte demonstrou o formulário específico do programa sobre negócios e disponibilidade. A representante Daniele Cavichio questionou se seria necessário montar o módulo do programa para testar, ao que o desenvolvedor Alexandre Notte respondeu que o módulo completo só será exigido em janeiro para a liberação de atividades, embora seja obrigatório criar previamente uma edição associada para definir prazos de abertura e fechamento ([00:02:32](?tab=t.4zqjs3890o2e#heading=h.wipfjpejayfj)).

* **Diferenciação entre Ambiente de Homologação e Produção**: A representante Daniele Cavichio sugeriu realizar testes diretamente no ambiente de produção para consolidar a edição correta, como a "Empreende Mulher 2027". O desenvolvedor Alexandre Notte argumentou que os testes devem ocorrer estritamente em homologação para que a equipe aprenda a usar a ferramenta, evitando poluir a base de produção com dados de teste, e destacou que retardar a subida para produção evita custos desnecessários com infraestrutura antes de novembro ([00:04:04](?tab=t.4zqjs3890o2e#heading=h.enmv119coc2c)) ([00:17:19](?tab=t.4zqjs3890o2e#heading=h.yztwxlf4h191)).

* **Definição do Cronograma de Lançamento do Empreende Mulher 2027**: A gestora Sandra Vale e a representante Daniele Cavichio discutiram o cronograma para o programa "Empreende Mulher 2027", alinhando o encerramento do planejamento para outubro e a abertura oficial em 15 de novembro ([00:10:19](?tab=t.4zqjs3890o2e#heading=h.bmq9t69mqhuk)). O desenvolvedor Alexandre Notte propôs inicialmente a entrega para 30 de setembro e depois para 30 de outubro para mitigação de riscos, ficando acordada a data limite de 30 de outubro para a entrega do sistema pronto pelo desenvolvedor Alexandre Notte ([00:13:04](?tab=t.4zqjs3890o2e#heading=h.odyk32ex2gii)).

* **Evidências de Cadastro e Conferência de Registros**: O desenvolvedor Alexandre Notte exibiu a tela interna de gestão para comprovar os registros recentes gerados no sistema, demonstrando o cadastro bem-sucedido de um usuário de teste associado à edição do "Empreende Mulher 2027" com status de revisão e aprovação ([00:15:03](?tab=t.4zqjs3890o2e#heading=h.o45e6dgy3h27)).

* **Links de Acesso e Validação de Mensagens Automáticas**: O desenvolvedor Alexandre Notte demonstrou o envio de links de acesso por e-mail e WhatsApp, simulando o redirecionamento automático para a aplicação logada ([00:18:18](?tab=t.4zqjs3890o2e#heading=h.pjos3g7oh6e1)). A gestora Sandra Vale questionou sobre a validação dos textos automáticos, e o desenvolvedor Alexandre Notte confirmou que a equipe criará as mensagens e receberá um documento completo contendo todos os objetos para revisão de texto e layout ([00:19:35](?tab=t.4zqjs3890o2e#heading=h.rw617kp7312a)).

* **Ajustes de Design, Cores e Funcionalidade da Interface**: A representante Daniele Cavichio e a gestora Sandra Vale apontaram que a interface atual possui um visual muito sóbrio e apagado com fundos brancos, solicitando a aplicação de cores mais alegres e alinhadas à paleta institucional do consulado baseada em tons de laranja ([00:22:06](?tab=t.4zqjs3890o2e#heading=h.nzex82h050fe)). O desenvolvedor Alexandre Notte argumentou que o foco principal no momento é a validação funcional dos campos e regras de negócio, ressaltando que a paleta de cores e o design podem ser ajustados posteriormente a qualquer momento ([00:27:45](?tab=t.4zqjs3890o2e#heading=h.97yqhc31fny8)).

* **Estruturação de Domínios e Nomenclatura da Plataforma**: O desenvolvedor Alexandre Notte explicou a criação do domínio técnico provisório "consuladeduca.com.br" e do botão "meu consulado educa" ([00:29:38](?tab=t.4zqjs3890o2e#heading=h.bb00yrwbv74k)) ([00:31:38](?tab=t.4zqjs3890o2e#heading=h.jm2bklhvsxgi)). A representante Daniele Cavichio pontuou que o nome técnico não deve ser exposto publicamente aos usuários finais, devendo refletir a identidade macro da plataforma ou o nome do programa, com o que o desenvolvedor Alexandre Notte concordou, afirmando que os rótulos de botões e URLs são flexíveis ([00:30:38](?tab=t.4zqjs3890o2e#heading=h.kt92v1pqn9dp)) ([00:32:24](?tab=t.4zqjs3890o2e#heading=h.m1w8wtgz8jry)).

* **Gestão de Voluntariado e Perfis de Acesso Operacional**: O desenvolvedor Alexandre Notte apresentou a arquitetura para o módulo de voluntariado no CMS administrativo, propondo a criação de um perfil de colaborador específico para a gestão de voluntariados atribuído ao participante Heitor N Cruz. A representante Daniele Cavichio aprovou a estrutura, que permitirá ao participante Heitor N Cruz visualizar um painel geral com ações ativas, mentorias e cadastros em análise ([00:33:19](?tab=t.4zqjs3890o2e#heading=h.swcscif7xnhk)).

* **Cadastro e Criação de Ações de Voluntariado**: O desenvolvedor Alexandre Notte demonstrou a criação de uma ação de voluntariado de teste (mutirão de plantio de árvores no Parque do Ibirapuera para os dias 19 e 20, com 50 vagas e classificação em saúde e bem-estar) ([00:36:15](?tab=t.4zqjs3890o2e#heading=h.bynid6w365lp)). A representante Daniele Cavichio e o desenvolvedor Alexandre Notte discutiram os campos descritivos da ação, o vínculo opcional com programas e a exibição da iniciativa no portal dedicado de voluntariado ([00:37:13](?tab=t.4zqjs3890o2e#heading=h.riab7sk4qvrg)).

* **Vinculação de Formulários Específicos para Ações de Voluntariado**: A representante Daniele Cavichio levantou a necessidade de gerar links de inscrição direcionados para captar voluntários para uma ação específica, em vez de depender apenas de um cadastro geral ([00:41:26](?tab=t.4zqjs3890o2e#heading=h.t79nz0amrfk7)) ([00:44:21](?tab=t.4zqjs3890o2e#heading=h.c3oy7sj3759o)). O desenvolvedor Alexandre Notte explicou que o sistema utilizará um "slug" exclusivo para gerar uma página e formulário específicos para cada ação, permitindo o cadastro direto e a associação imediata da pessoa participante à respectiva iniciativa ([00:45:04](?tab=t.4zqjs3890o2e#heading=h.rfc7hncdnn9j)) ([00:48:21](?tab=t.4zqjs3890o2e#heading=h.kb2lq4hh9xbp)).

* **Segmentação de Voluntários e Ajustes nos Formulários de Cadastro**: A representante Daniele Cavichio expressou desconforto quanto à exibição de opções genéricas de atuação (como mentoria individual) em formulários criados para ações pontuais, como o plantio de árvores ([00:50:22](?tab=t.4zqjs3890o2e#heading=h.lm2ykb8hqeg7)) ([00:53:11](?tab=t.4zqjs3890o2e#heading=h.bfrqqpsqw898)). O participante Heitor N Cruz e o desenvolvedor Alexandre Notte ponderaram sobre a importância de manter uma base de dados unificada para conversão futura de voluntários em mentores, e o desenvolvedor Alexandre Notte concluiu que será avaliado o dinamismo dos blocos do formulário para adequar a experiência de inscrição conforme a ação escolhida ([00:52:10](?tab=t.4zqjs3890o2e#heading=h.2nvs8fx3kb9v)) ([00:54:55](?tab=t.4zqjs3890o2e#heading=h.szy3s7i7h7q)).

* **Alinhamento sobre Campanhas de Mentoria e Ações Práticas**: Discute-se a divergência de foco nos cadastros de voluntariado em relação ao volume de mentorias versus ações práticas. Daniele Cavichio pontua que o consulado abre muito mais inscrições para mentorias do que para ações práticas de cunho "mão na massa", sendo estas últimas bastante escassas ([00:58:38](?tab=t.4zqjs3890o2e#heading=h.r8hj9z2o60ji)). Alexandre Notte aborda a importância de coletar dados abrangentes dos voluntários no momento do cadastro ([00:59:41](?tab=t.4zqjs3890o2e#heading=h.yw3j9fr4vu7p)). Daniele Cavichio e Heitor N Cruz debatem se os formulários em desenvolvimento refletem o cenário atual sem sistema ou as exigências do novo sistema, com Alexandre Notte reforçando que a prioridade deve atender às necessidades operacionais da nova plataforma. O consenso é reconhecer a predominância das campanhas de mentoria e direcionar a coleta de dados para o formato do sistema ([00:58:38](?tab=t.4zqjs3890o2e#heading=h.r8hj9z2o60ji)) ([01:01:00](?tab=t.4zqjs3890o2e#heading=h.sm2updnoadb)).

* **Estrutura de Formulários para Ações Específicas e Projetos Amplos**: Analisa-se como estruturar o formulário de cadastro para evitar confusão em voluntários novatos ao se inscreverem em uma ação específica. Heitor N Cruz propõe que a pessoa se inscreva em uma atividade direcionada e encontre abaixo opções opcionais para selecionar outros temas de voluntariado ([01:01:54](?tab=t.4zqjs3890o2e#heading=h.diplnbxreeq2)). Daniele Cavichio aponta o risco de fragmentar em múltiplos formulários, mas a equipe converge para um modelo integrado ([01:03:15](?tab=t.4zqjs3890o2e#heading=h.krihcsqwexca)). Alexandre Notte sugere um fluxo unificado onde, ao se inscrever em uma ação específica (como plantio de árvores ou mentoria individual), a pessoa já é qualificada para aquela frente e tem a oportunidade de estender o interesse para outras áreas futuras (como mentoria coletiva ou atuações em finanças e marketing) ([01:04:07](?tab=t.4zqjs3890o2e#heading=h.frmbpsba1wfk)). Daniele Cavichio enfatiza a necessidade de incluir um texto explicativo prévio para contextualizar a pessoa sobre a captação de múltiplas frentes sem gerar estranhamento ([01:06:16](?tab=t.4zqjs3890o2e#heading=h.vsoqsfa3mft5)).

* **Agendamento e Revisão dos Tópicos Finais**: Trata-se da gestão do tempo e encerramento da sessão de trabalho. Daniele Cavichio avisa que precisa se retirar para participar de uma reunião de liderança. Alexandre Notte propõe agendar a continuação do assunto para o dia seguinte, ajustando o horário para das 14:00 às 16:00 devido a uma consulta online de Alexandre Notte marcada para as 16:00 ([01:07:01](?tab=t.4zqjs3890o2e#heading=h.1bhm03l16cps)). Daniele Cavichio altera imediatamente o convite no calendário para que toda a equipe receba a atualização ([01:08:00](?tab=t.4zqjs3890o2e#heading=h.iei43tf21laz)). Alexandre Notte revisa os tópicos da pauta que foram percorridos, incluindo o gestor de voluntariado, administração de voluntariado e portal de voluntariado, encerrando a reunião com o compromisso de retomada no dia seguinte ([01:08:55](?tab=t.4zqjs3890o2e#heading=h.d4afar03418)).

*Revise as anotações do Gemini para checar se estão corretas. [Confira dicas e saiba como o Gemini faz anotações](https://support.google.com/meet/answer/14754931)*

*Como está a qualidade de **destas observações?** [Responda a uma breve pesquisa](https://google.qualtrics.com/jfe/form/SV_5bXzKQfylMIhSXc?confid=l0nWxDFRxnvVNYlW26EEDxIQOBEBMgUIigIgABgFCA&detailLevel=standard&hasImages=False&entryPoint=footerMain&isGoogler=False) para nos dar seu feedback, incluindo o quanto as observações foram úteis para o que você precisa.*