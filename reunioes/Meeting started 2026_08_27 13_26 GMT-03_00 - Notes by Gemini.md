ago. 27, 2026

## **Reunião em 27 de ago. de 2026 às 13:26 GMT-03:00**

Registros da reunião [Transcrição](https://docs.google.com/document/d/1j3ALz2Z9Dw3qoYLhp5zIFn6NRE8H2Sv_LhYS-PSyITI/edit?usp=drive_web&tab=t.c2zbj9l47qx0) *(Algumas gravações estão indisponíveis)*

### **Resumo**

Reunião definiu fluxos operacionais para doações, processos de seleção de empreendedoras e reformulação da saúde financeira.

**Ajustes nos fluxos operacionais**  
O sistema foi atualizado para gerenciar melhor processos de seleção, comunicação automatizada e monitoramento de evasão de participantes. A equipe implementou maior autonomia na modificação de eventos presenciais para formatos online.

**Gestão de doações e financeiro**  
Foi estabelecido o fluxo para cadastro de múltiplos itens de doação, controle orçamentário por unidade e validação de segurança. A categoria de fluxo de caixa foi renomeada para saúde financeira com novos critérios de análise.

**Regulamentação e conclusão final**  
Definiu-se a obrigatoriedade da assinatura digital para recebimento de equipamentos visando conformidade contábil. Implementou-se o fluxo de finalização com palavra-chave para liberação do questionário de encerramento.

### **Decisões**

## Precisa de mais conversa

* **Nomenclatura de saúde financeira** A equipe debate a alteração da nomenclatura da seção de dados financeiros de "fluxo de caixa" para "saúde financeira".

## Alinhada

* **Definição de formato de evento** O sistema incluirá um campo de definição para eventos, permitindo especificar se a atividade será presencial ou ao vivo conforme a necessidade operacional.

* **Múltiplos itens por doação** O sistema permitirá a adição de múltiplas linhas de itens em uma única doação, possibilitando o detalhamento de vários produtos e valores por empreendimento.

* **Orçamento individual por unidade** O sistema permitirá a definição de orçamentos específicos e individualizados para cada unidade, em vez de manter apenas a visualização de um orçamento totalizado.

* **Estrutura do fluxo de caixa definida** A estrutura do relatório de fluxo de caixa mensal foi definida incluindo "Entradas" (faturamento), "Saídas" (investimento, poupança, despesas do negócio e dívidas) e "Renda" como resultado.

* **Obrigatoriedade da planilha mensal mantida** O preenchimento da planilha mensal pelas empreendedoras permanece obrigatório para garantir a validação dos dados informados.

* **Prazo no recibo de doação ajustado** O texto do recibo de doação foi alterado para especificar que a doação será realizada em até 60 dias.

* **Processo de recebimento de doação definido** O processo de recebimento de doação foi definido com o gestor anexando a nota fiscal e a empreendedora assinando o recibo pelo aplicativo.

* **Funcionalidade de aprovação em lote definida** A funcionalidade de sugestão e aprovação de doações para empreendedoras finalistas será implementada para permitir o processamento em lote.

**Atualizamos a seção "Decisões"** com base no seu feedback.

Dê sua opinião: [Sim](https://google.qualtrics.com/jfe/form/SV_5bXzKQfylMIhSXc?isHelpful=True&entryPoint=decisions&confid=N0wp_Hj5VDWXkBATGaRlDxIQOBEBMgUIigIgABgFCA&isGoogler=False) ou [Não é útil](https://google.qualtrics.com/jfe/form/SV_5bXzKQfylMIhSXc?isHelpful=False&entryPoint=decisions&confid=N0wp_Hj5VDWXkBATGaRlDxIQOBEBMgUIigIgABgFCA&isGoogler=False)

### **Próximas etapas**

- [ ] \[Alexandre Notte\] Configurar eventos: Incluir campo de status presencial ou ao vivo no cadastro de eventos e ajustar a lógica de definição de data e hora na gestão da unidade ou turma.

- [ ] \[Alexandre Notte\] Atualizar sistema doações: Modificar a tela de doações para permitir a inserção de múltiplos itens ou valores empilhados para um mesmo empreendimento. Atualizar a base de dados para suportar a nova estrutura de relacionamento de 1 para n entre doações e itens.

- [ ] \[Alexandre Notte\] Tornar orçamento editável: Implementar funcionalidade no sistema para permitir a edição do orçamento com obrigatoriedade de inclusão de justificativa.

- [ ] \[Sandra Vale\] Elaborar planilha de estrutura: Criar um documento no Excel com a nova estrutura e nomenclatura dos dados de saúde financeira. Apresentar o conteúdo na próxima reunião.

- [ ] \[A equipe\] Atualizar material pedagógico: Ajustar a metodologia e os materiais de treinamento para incorporar os novos conceitos de saúde financeira a serem aplicados no sistema.

- [ ] \[Vitoria Marçal de Oliveira, Caroline Costa\] Descrever processo de mentoria: Escrever um e-mail detalhando o processo de mentoria atual para que a equipe de desenvolvimento possa revisar e alinhar com a próxima reunião.

- [ ] \[Alexandre Notte\] Atualizar recibo de doação: Alterar o termo do recibo de doação para indicar que o pagamento será realizado em até 60 dias.

- [ ] \[Alexandre Notte\] Adicionar campos de doação: Configurar a interface do gestor para permitir a inserção manual dos itens da doação e seus respectivos valores.

- [ ] \[Alexandre Notte\] Implementar aprovação em lote: Implementar uma funcionalidade que permita a aprovação de doações e a geração de recibos em lote para as empreendedoras finalistas.

- [ ] \[Daniele Cavichio\] Agendar reunião: Agendar uma reunião para quinta-feira com todos os envolvidos para finalizar os tópicos discutidos.

### **Detalhes**

* **Ajustes no Layout e Diferenças nos Processos de Seleção**: Alexandre Notte apresentou as modificações visuais aplicadas nas cores do layout do sistema, pontuando que a interface anterior apresentava um aspecto inadequado. A pessoa desenvolvedora explicou a divergência de processos entre os programas: o Empreende Zap possui seleção simplificada e encerramento mais complexo, enquanto o modelo presencial híbrido adota o oposto. Daniele Cavichio complementou que a triagem inicial menor no formato presencial serve para reter um grupo menor e qualificado até a conclusão. Alexandre Notte acrescentou que a etapa final conta com um workshop associado à qualificação, live fechada, chave única de validação e avaliação final ([00:00:00](?tab=t.c2zbj9l47qx0#heading=h.rzbcgnw7nn5z)).

* **Fluxo de Comunicação Automatizada e Disparos**: Alexandre Notte detalhou o funcionamento do motor de comunicação automatizada para o programa online, onde a pessoa candidata realiza o cadastro e envia obrigatoriamente a primeira mensagem para ingressar na lista de seleção. Após a qualificação realizada por Daniele Cavichio ou pela equipe, o sistema dispara uma comunicação automática comunicando a aprovação e liberando a jornada educacional, permitindo envios via WhatsApp, e-mail ou ambos conforme as configurações administrativas ([00:02:15](?tab=t.c2zbj9l47qx0#heading=h.w6i22b1q1t7u)) ([00:11:14](?tab=t.c2zbj9l47qx0#heading=h.yw6m6e26cs7x)).

* **Monitoramento de Riscos de Evasão e Atividades**: Alexandre Notte apresentou os recursos de monitoramento voltados a identificar riscos de evasão e cancelamento, rastreando participantes que estejam inativos, sem assistir às aulas ou acumulando conteúdos não baixados após os finais de semana. A equipe de gestão pode realizar disparos direcionados para resgatar quem não concluiu a última atividade ou apresenta risco de evasão, além de acompanhar o andamento geral e os workshops ([00:15:24](?tab=t.c2zbj9l47qx0#heading=h.e117h76nruvf)).

* **Processo de Seleção e Entrevistas do Empreende Mulher**: Alexandre Notte e Franciele Juliane Nunes Silva discutiram o fluxo específico do Empreende Mulher, que engloba entrevistas de seleção. Alexandre Notte demonstrou a alocação das candidatas qualificadas em turmas divididas entre os períodos da manhã, tarde e noite, viabilizando o envio de convites com data, horário e local ([00:16:49](?tab=t.c2zbj9l47qx0#heading=h.5qi5ge14c4hi)). As ausências não justificadas resultam na conversão automática para o status de não aprovada, embora seja possível reabrir e requalificar a candidata se necessário ([00:19:02](?tab=t.c2zbj9l47qx0#heading=h.e07nszmvkhls)). Franciele Juliane Nunes Silva esclareceu que reprovações em entrevistas ocorrem principalmente por divergências cadastrais, incompatibilidade de horários ou percepção de que o programa não atende ao perfil da candidata ([00:22:01](?tab=t.c2zbj9l47qx0#heading=h.f5t6sehet6pv)).

* **Configuração de Canais e Restrições de Envio por WhatsApp**: Alexandre Notte explicou que o painel administrativo dispõe de um parâmetro (flag) para desativar o envio de mensagens via WhatsApp em programas geridos por parceiros, garantindo que toda a dinâmica de comunicação ocorra exclusivamente por e-mail para evitar disparos incontroláveis, conforme ressaltado por Daniele Cavichio ([00:23:15](?tab=t.c2zbj9l47qx0#heading=h.4vr7s8oy7aln)).

* **Alteração na Natureza de Módulos de Eventos Devido a Condições Climáticas**: Alexandre Notte, Franciele Juliane Nunes Silva e Vitoria Marçal de Oliveira abordaram a adaptação na estrutura dos módulos educacionais em decorrência de eventos climáticos adversos, substituindo o formato estritamente presencial por eventos ao vivo online ([00:24:49](?tab=t.c2zbj9l47qx0#heading=h.8i59srjduc5v)). Franciele Juliane Nunes Silva questionou se seria necessário acionar Sandra Vale para alterações emergenciais, ao que Alexandre Notte esclareceu que a pessoa gestora pode modificar o formato diretamente no sistema de forma autônoma e imediata. Vitoria Marçal de Oliveira solicitou a inclusão de campos para aulas inaugurais ao vivo, solicitação aceita por Alexandre Notte para implementação futura ([00:26:34](?tab=t.c2zbj9l47qx0#heading=h.6b2f2dff7zix)).

* **Gestão de Doações e Inclusão de Itens Múltiplos**: Alexandre Notte, Daniele Cavichio e Sandra Vale debateram a tela de sugestão de doações (capital semente, equipamentos e insumos) para o Empreende Mulher ([00:30:08](?tab=t.c2zbj9l47qx0#heading=h.61krpqqmd04c)) ([00:34:40](?tab=t.c2zbj9l47qx0#heading=h.elmtxxj3tyyj)). Daniele Cavichio apontou a necessidade de permitir o cadastro de múltiplos itens e valores em linhas separadas para contemplar pedidos variados (como geladeiras, micro-ondas ou conjuntos de itens menores), enquanto Sandra Vale questionou as exigências de monitoramento para relatórios contábeis, notas fiscais e emissão de recibos ([00:31:34](?tab=t.c2zbj9l47qx0#heading=h.p6zhved50jtf)) ([00:36:03](?tab=t.c2zbj9l47qx0#heading=h.61osfzpsigbd)). Após ponderações sobre a complexidade de acumular produtos e doações em dinheiro levantadas por Franciele Juliane Nunes Silva, Alexandre Notte propôs um modelo em que as doações sejam empilhadas em linhas sequenciais no sistema ([00:39:03](?tab=t.c2zbj9l47qx0#heading=h.lnv8xp8un5ys)) ([00:40:44](?tab=t.c2zbj9l47qx0#heading=h.inwf4p7oymwf)).

* **Orçamento de Doações por Unidade e Ajustes no CMS**: Alexandre Notte, Daniele Cavichio e Sandra Vale discutiram o controle orçamentário das doações, que deve ser definido de forma individualizada por unidade (como Rio Claro, Joinville e Pisada do Sertão) dentro de uma edição ([00:46:53](?tab=t.c2zbj9l47qx0#heading=h.49bivtrqnqms)). Sandra Vale pontuou que os valores orçamentários podem ser editados mediante justificativa, e Alexandre Notte confirmou que o sistema registrará o total disponível, o consumido, o saldo e os valores em análise, permitindo remanejamentos administrativos desde que os recursos ainda não tenham sido integralmente distribuídos ([00:43:56](?tab=t.c2zbj9l47qx0#heading=h.twopfjxhfdkl)) ([00:48:10](?tab=t.c2zbj9l47qx0#heading=h.brov1zl5pagl)).

* **Validação de Segurança para Aprovação de Doações**: Alexandre Notte apresentou a etapa final de liberação de doações, onde a pessoa gestora precisa digitar ou copiar e colar um texto de confirmação para validar a operação, evitando cliques acidentais e o envio incorreto de avisos de contemplação às empreendedoras ([00:52:57](?tab=t.c2zbj9l47qx0#heading=h.a8fn8udmi16b)).

* **Proposta de Mudar Dados Financeiros para Saúde Financeira**: Sandra Vale, Franciele Juliane Nunes Silva, Daniele Cavichio e Alexandre Notte discutiram a seção de dados financeiros e fluxo de caixa nos registros de faturamento. Sandra Vale e Franciele Juliane Nunes Silva apontaram que algumas empreendedoras apresentam resultados líquidos negativos devido ao alto endividamento e ao comprometimento da renda com o pagamento de dívidas ([00:54:08](?tab=t.c2zbj9l47qx0#heading=h.2o8khpx8yb1w)) ([00:57:57](?tab=t.c2zbj9l47qx0#heading=h.ziifg48ds8l3)). Com base nisso, Sandra Vale propôs renomear a categoria de fluxo de caixa mensal para acompanhamento da "saúde financeira", com o objetivo de monitorar de forma mais precisa a evolução e a sustentabilidade econômica dos negócios ([00:57:57](?tab=t.c2zbj9l47qx0#heading=h.ziifg48ds8l3)).

* **Restruturação do Fluxo de Caixa Mensal**: Durante a reunião, Sandra Vale apresentou uma proposta para reorganizar a lógica financeira das empreendedoras, agrupando investimentos, poupança, despesas do negócio e dívidas sob uma categoria única de "saídas", enquanto o faturamento representa as "entradas" ([00:58:57](?tab=t.c2zbj9l47qx0#heading=h.5ewd7iw4fwz2)). Daniele Cavichio e Alexandre Notte apoiaram a mudança, destacando que o cálculo automático da renda líquida simplifica o acompanhamento mensal, mantendo o registro do número de clientes e produtos como dados complementares de negócio ([00:59:58](?tab=t.c2zbj9l47qx0#heading=h.szjn4nwe0nql)).

* **Obrigatoriedade e Metodologia da Planilha**: Daniele Cavichio questionou se a planilha de fluxo de caixa continuaria sendo mensal e obrigatória, o que foi confirmado por Sandra Vale para garantir a validação comparativa dos dados. Franciele Juliane Nunes Silva pontuou que a alteração conceitual exigirá atualizações na metodologia e nos materiais didáticos aplicados até o próximo ano, integrando de forma central o conceito de saúde financeira ([01:01:27](?tab=t.c2zbj9l47qx0#heading=h.ha4g0hiyc2ae)).

* **Definição entre Investimento e Dívida**: A equipe debateu como diferenciar investimentos de negócios e dívidas geradas por aquisições, como equipamentos adquiridos em cartões de crédito pessoais. Franciele Juliane Nunes Silva e Sandra Vale discutiram que investimentos englobam aportes diretos no negócio (maquinário, reformas) realizados após a entrada no programa, ao passo que dívidas correspondem a passivos que comprometem a saúde e o crescimento financeiro, exigindo melhor categorização nos materiais formativos ([01:02:23](?tab=t.c2zbj9l47qx0#heading=h.cnmjhmui23r)).

* **Tratamento de Resultados Negativos no Sistema**: Daniele Cavichio levantou dúvidas sobre como o sistema lidará com resultados negativos, visto que a renda líquida não pode ser negativa. Sandra Vale esclareceu que, embora a expectativa de retirada desejada pela empreendedora e a renda em si não fiquem negativas, o resultado financeiro mensal poderá refletir valores negativos caso as despesas e dívidas ultrapassem o faturamento ([01:04:44](?tab=t.c2zbj9l47qx0#heading=h.petd5zfpwyoj)) ([01:06:35](?tab=t.c2zbj9l47qx0#heading=h.auth1p6ke5f6)).

* **Impacto de Dívidas Pessoais na Saúde Financeira**: Vitoria Marçal de Oliveira questionou se dívidas estritamente pessoais deveriam impactar a renda ou sair da retirada da empreendedora, e Daniele Cavichio reforçou a orientação de separar as finanças pessoais das empresariais ([01:07:18](?tab=t.c2zbj9l47qx0#heading=h.pxa93x5818um)). No entanto, Sandra Vale argumentou que a mistura entre vida pessoal e negócios — como moradias insalubres ou uso de crédito familiar — afeta profundamente a estrutura financeira e emocional das participantes, necessitando de tratamento aprofundado no processo formativo ([01:09:16](?tab=t.c2zbj9l47qx0#heading=h.bxppwtdrsmi3)).

* **Encaminhamentos para a Planilha e Módulos do Sistema**: Alexandre Notte solicitou um modelo em Excel com as novas alterações conceituais. Sandra Vale comprometeu-se a alinhar o tema internamente com a equipe e com Adriana para apresentar a proposta na reunião da semana seguinte ([01:12:52](?tab=t.c2zbj9l47qx0#heading=h.yi152djo7ct4)). Alexandre Notte destacou que o CMS permite criar múltiplos módulos educacionais, e Daniele Cavichio pontuou que os ajustes exigem principalmente alterações visuais, de nomenclatura e a inclusão do campo de dívidas ([01:13:58](?tab=t.c2zbj9l47qx0#heading=h.nt0ax65n59n5)).

* **Fluxo de Solicitação de Dados Bancários para Doações**: Alexandre Notte apresentou a etapa do sistema onde, após a aprovação de uma verba de doação, a empreendedora é notificada em sua interface para informar os dados bancários e chave Pix ([01:19:31](?tab=t.c2zbj9l47qx0#heading=h.4rhppvopzkgl)). Daniele Cavichio enfatizou que o CPF, quando utilizado como chave Pix, deve ser fixo e inalterável para evitar fraudes, enquanto campos como telefone e e-mail podem ser editados. A empreendedora seleciona o banco em uma lista, indica a agência e conta, e assina o recibo digital ([01:20:52](?tab=t.c2zbj9l47qx0#heading=h.y0nxafjl5uwb)).

* **Ajustes de Prazos e Mensagens no Recibo de Doação**: Caroline Costa e Daniele Cavichio lembraram que os regulamentos estipulam o prazo de até 60 dias para a efetivação das doações, embora o processo ocorra frequentemente em menor tempo. Alexandre Notte ajustou o texto do sistema para refletir o prazo de até 60 dias, e Caroline Costa sugeriu modificar a mensagem pós-assinatura para orientar a participante a aguardar a conclusão do processo de doação ([01:21:55](?tab=t.c2zbj9l47qx0#heading=h.4igw5d8z39bc)) ([01:23:46](?tab=t.c2zbj9l47qx0#heading=h.dexh25wrdly4)).

* **Fluxo de Doação de Materiais e Notas Fiscais**: Alexandre Notte detalhou o processo de envio de endereços para recebimento de equipamentos e doações de materiais ([01:26:55](?tab=t.c2zbj9l47qx0#heading=h.z6p5eeamsl0l)). Franciele Juliane Nunes Silva e Daniele Cavichio esclareceram que, como as compras são realizadas em lote e centralizadas, a empreendedora não possui a nota fiscal individual ([01:28:09](?tab=t.c2zbj9l47qx0#heading=h.a7hie9px4keu)). Ficou estabelecido que gestores de unidade anexarão a nota fiscal e registrarão os itens exatos no sistema, permitindo que a empreendedora apenas visualize e assine o recibo correspondente no aplicativo ([01:31:50](?tab=t.c2zbj9l47qx0#heading=h.ov41r4n3gnta)).

* **Obrigatoriedade da Assinatura e Histórico de Devoluções**: Discutindo cenários em que participantes desistem ou desaparecem após receber equipamentos, Franciele Juliane Nunes Silva e Daniele Cavichio afirmaram que a assinatura da empreendedora é estritamente obrigatória por questões regulatórias e de prestação de contas ([01:34:34](?tab=t.c2zbj9l47qx0#heading=h.xm9imfvqotzv)) ([01:38:11](?tab=t.c2zbj9l47qx0#heading=h.q3loffv94tof)). Franciele Juliane Nunes Silva compartilhou um relato passado de recuperação de um forno doado após a desistência de uma participante, ilustrando a rigidez necessária no cumprimento do regulamento para evitar precedentes institucionais ([01:36:40](?tab=t.c2zbj9l47qx0#heading=h.5qzezdegr8q8)) ([01:38:11](?tab=t.c2zbj9l47qx0#heading=h.q3loffv94tof)).

* **Conclusão de Módulos Educacionais e Quiz no Empreende no Zap**: Alexandre Notte demonstrou o fluxo final no aplicativo, onde após assistir ao workshop de encerramento transmitido externamente, a participante insere uma palavra-chave dentro de um prazo estipulado de duas horas para liberar o quiz final ([01:39:53](?tab=t.c2zbj9l47qx0#heading=h.7dm6djv1bn9m)). Caroline Costa solicitou que o relatório do sistema exiba a data e o horário exatos da conclusão da avaliação pela usuária ([01:42:11](?tab=t.c2zbj9l47qx0#heading=h.yda0v5rzempr)).

* **Aprovação em Lote de Finalistas e Agendamento de Próximas Reuniões**: Vitoria Marçal de Oliveira e Alexandre Notte discutiram a necessidade de implementar filtros e aprovações em lote para as finalistas elegíveis, considerando critérios como notas, datas de resposta e palavra-chave correta para sugerir e aprovar valores de doação de forma otimizada ([01:43:39](?tab=t.c2zbj9l47qx0#heading=h.eflfpy5zrsg8)). Devido a conflitos de agenda e ao início de um período sabático de Vitoria Marçal de Oliveira, o grupo encerrou a reunião acordando o envio de uma descrição do processo de mentoria e agendando novas reuniões de alinhamento para a próxima quinta-feira ([01:48:27](?tab=t.c2zbj9l47qx0#heading=h.mwvrqvtm4gkm)).

*Revise as anotações do Gemini para checar se estão corretas. [Confira dicas e saiba como o Gemini faz anotações](https://support.google.com/meet/answer/14754931)*

*Como está a qualidade de **destas observações?** [Responda a uma breve pesquisa](https://google.qualtrics.com/jfe/form/SV_5bXzKQfylMIhSXc?confid=N0wp_Hj5VDWXkBATGaRlDxIQOBEBMgUIigIgABgFCA&detailLevel=standard&hasImages=False&entryPoint=footerMain&isGoogler=False) para nos dar seu feedback, incluindo o quanto as observações foram úteis para o que você precisa.*