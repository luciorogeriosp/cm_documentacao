**Casos de Uso SENNA \- em discussão**

## Casos de Uso

UC1 \- Cadastro no SENNA

UC2 \- Login SENNA

UC3 \- Definir Tabelas Normativas Padrão

UC4 \- Gerar QR-Code de Autocadastro

UC5 \- Fazer Autocadastro de Prontuário

UC6 \- Criar Prontuário de Avaliado

UC7 \- Corrigir Testes

UC8 \- Revisar e Ajustar Dados de Prontuário

UC9 \- Remover Prontuário

UC10 \- Revisar e Ajustar Dados de Correção

UC11 \- Remover Correção

UC12 \- Emitir Parecer Técnico

UC13 \- Comunicar Resultado para Avaliado (opcional)

UC14 \- Consultar Histórico de Uso

### UC1 – Cadastro no SENNA

**Descrição**

Permite que o profissional (psicólogo) se cadastre na **Plataforma SENNA**, a fim de acessar as funcionalidades de avaliação psicológica (ex.: abertura de prontuário, envio de testes para correção, etc.).

**Atores**

* **Psicólogo**: usuário principal que precisa de acesso pleno à plataforma.

**Pré-condições**

* O usuário (psicólogo) tem **acesso à internet** e **navegador compatível**.

* Possui cadastro na **VOL** (onde estão as licenças de uso para correção)

* Está de acordo com os **Termos de Uso** do sistema.

**Fluxo Principal**

### O **Psicólogo** acessa a **URL** do SENNA.

* Seleciona a opção “Cadastre-se” (ou similar), disponível no menu de usuário.

* Sistema apresenta campos para usuário e senha VOL

  * Após entrada e validação de dados de acesso à VOL, sistema apresenta mensagem para confirmação de que aquele cadastro no SENNA estará associado ao cadastro da VOL.

  * Fluxo finalizado e cadastro pronto.

* O sistema apresenta link para que o usuário leia os Termos de Uso e apresenta caixa de seleção para que o usuário confirme que está de acordo.

* O sistema **valida** os campos obrigatórios (formato de email, duplicidade de CRP, etc.).

* Em caso de sucesso, o sistema **envia um email** de confirmação contendo um link de verificação.

* O sistema **confirma** o cadastro e registra o novo usuário na base de dados e já faz login, direcionando o usuário para a página inicial.

**Fluxos Alternativos**

* **Fluxo Alternativo**: Dados inválidos ou faltantes

  * O sistema identifica um campo obrigatório vazio (ex.: CRP) ou formato inválido (ex.: email sem “@”).

  * O sistema exibe mensagem de erro, solicitando correção dos dados.

  * Retorna ao passo 3 do Fluxo Principal.

* **Fluxo Alternativo**: Acesso já cadastrado

  * O sistema detecta que o cadastro já existe.

  * O sistema exibe mensagem indicando a duplicidade e dá acesso à página inicial.

* **Fluxo Alternativo**: Usuário não clica no link de confirmação de email

  * O sistema mantém o cadastro em **estado “aguardando confirmação”** por um período (ex.: 24h).

  * Após esse período, o sistema pode **invalidar** o cadastro automaticamente.

  * O psicólogo pode repetir o cadastro ou solicitar reenvio do link.

* **Fluxo Alternativo:** Usuário não seleciona caixa de aceite aos Termos de Uso

  * O sistema apresenta mensagem informando que a seleção é obrigatória. Caso contrário, não conclui o cadastro.

**Pós-condições**

* O psicólogo passa a ter um **cadastro válido** no sistema, podendo fazer login e acessar as funcionalidades básicas (ex.: abrir prontuários, enviar testes).

**Exceções**

* **EC1**: Indisponibilidade da Plataforma VOL ou falha de integração

  * O sistema SENNA informa que não foi possível carregar os dados e sugere retry ou cadastro manual.

### UC2 – Login SENNA

**Descrição**

Este caso de uso descreve o **acesso** ao sistema SENNA por meio de um **navegador web** (desktop ou dispositivo móvel). Disponibiliza funcionalidades principais (abrir prontuários, revisar resultados, emitir parecer técnico etc.).

**Atores**

* **Psicólogo**: responsável por efetuar o login e acessar as funcionalidades para avaliação psicológica.


**Pré-condições**

* O ator possui **cadastro** no SENNA.  
* A URL ou domínio do SENNA está **operante**.  
* O usuário tem **conexão à internet** e um **navegador compatível**.


**Fluxo Principal**

* **Acesso à URL**: O usuário digita o endereço do SENNA (ex.: https://vetorsenna.ai/) no navegador.  
  * Nota: Se estiver logado na VOL, o usuário pode acessar a opção disponível no menu de opções, sem necessidade de fornecer informações adicionais de login (via SSO SENNA \<\> VOL).  
* **Tela de Login**: O sistema exibe campos de autenticação na VOL (email ou CPF e senha)  
* **Validação de Credenciais**: O usuário insere suas credenciais VOL   
* **Autenticação Bem-Sucedida**:  
  * O sistema valida as informações e cria uma **sessão** do usuário.  
  * Abre a página de trabalho (Meus Prontuários)  
* **Navegação**: O usuário já é direcionado para a página de “Meus Prontuários”, na qual pode criar um prontuário novo ou usar um já existente \- para adicionar fotos de testes, ajustar dados de correção ou fechar o prontuário.


**Fluxos Alternativos**

* Credenciais Inválidas  
  * O sistema rejeita a autenticação.  
  * Exibe mensagem de erro (“Usuário ou senha incorretos”).  
  * O usuário pode tentar novamente ou acionar recuperação de senha.  
* Conta Bloqueada ou Inativa  
  * Se o usuário estiver inativo ou bloqueado, o sistema informa que não é possível acessar.  
  * O usuário deve contatar o suporte ou o administrador.

**Pós-condições**

* O usuário está **logado** e tem acesso às funcionalidades do SENNA conforme seu **perfil** (psicólogo, assistente).  
* Pode **iniciar** outros casos de uso (Criação de Prontuários, Correção de Testes, Revisão de Parecer Técnico etc.) a partir de opções disponíveis na tela.

**Exceções**

* **EC1**: Servidor do SENNA Offline  
  * O usuário não carrega a página ou recebe erro 503\. Necessário tentar mais tarde.  
* **EC2**: Falha de Rede  
  * O navegador não consegue alcançar o servidor. O usuário deve verificar a conexão.

### UC3 – Definir Tabelas Normativas Padrão

### **Descrição**

Permite que o psicólogo defina as tabelas normativas padrão para cada um dos testes da bateria SENNA. Essa tarefa vai agilizar o processo de classificação dos avaliados (no processo de correção, a partir da pontuação obtida) e de emissão do parecer técnico.

**Nota:** A definição dessas tabelas padrão tem apenas o objetivo de agilizar o processo. Se entender que é necessário, o psicólogo pode alterar as tabelas normativas usadas para classificação de um avaliado qualquer (para quaisquer um dos testes aplicados).

**Atores**

* **Psicólogo**: responsável por definir as tabelas normativas padrão para cada teste.

**Pré-condições**

* O psicólogo deve estar **logado** no sistema SENNA.

**Fluxo Principal**

* O **Psicólogo** acessa a opção **Tabelas Normativas** no menu de usuário. Essa opção aparece apenas a partir do momento em que ele está logado no sistema.

* O sistema apresenta a lista de testes, com um campo (tipo “drop down select”) apresentando as tabelas normativas disponíveis para aquele teste em particular, para que o usuário selecione a opção desejada.

* O psicólogo **seleciona a tabela desejada**.

* Essa operação se repete para todos os testes da bateria.

* A qualquer momento o usuário pode clicar no botão **Salvar Padrões**, que registra as opções selecionadas no perfil do usuário.

  Nota: é possível **Salvar Padrões** mesmo que algum dos testes ainda não esteja com uma tabela normativa selecionada. Isso não impede o usuário de prosseguir com suas tarefas \- exceto nas tarefas de Revisar e Emitir Parecer Técnico, que dependem de tabelas normativas definidas para a classificação do avaliado.

**Fluxos Alternativos**

* Não foi possível identificar fluxos alternativos para este caso de uso.

**Pós-condições**

* Tabelas Normativas Padrão estarão definidas para alguns (ou todos) os testes da bateria \- para aquele usuário.

* As funções de classificação de avaliado (a partir da pontuação obtida e registrada em cada teste) já estarão disponíveis no sistema.

**Exceções**

* **EC1**: Falha de comunicação com o banco de dados da VOL, que lista as tabelas normativas para cada teste.

  * O sistema exibe uma mensagem de erro genérico (“Não foi possível obter a lista de uma ou mais tabelas normativas de algum dos testes”), orientando a tentar novamente.

  


### UC4 – Gerar QR-Code de Autocadastro

### **Descrição**

Permite que o psicólogo, **caso deseje**, gere e imprima um QR-Code que irá direcionar o avaliado a um formulário para preenchimento de dados pessoais, criando o prontuário digital do avaliado \- sem que o psicólogo tenha de fazê-lo para cada avaliado.

Este caso de uso tem o objetivo de agilizar o processo de correção de testes, restando ao psicólogo (na sala de aplicação) apenas a tarefa de tirar as fotografias das folhas de teste para cada avaliado e submeter ao sistema de correção.

**Nota:** Este é uma tarefa opcional para o psicólogo. Ele pode preferir digitar, um a um, os dados dos avaliados em sala, no momento da aplicação dos testes.

**Atores**

* **Psicólogo**: responsável por gerar o QR-Code.

**Pré-condições**

* O psicólogo deve estar **logado** no sistema SENNA.

**Fluxo Principal**

* O **Psicólogo** acessa a opção **QR Code** no menu de usuário. Essa opção aparece apenas a partir do momento em que ele está logado no sistema.

* O sistema gera o QR Code e apresenta na tela, com um campo para que o psicólogo informe o nome da clínica, se desejar.

* O psicólogo clica no botão **Imprimir**.

* O sistema apresenta o QR Code na tela, com o nome da clínica, já com uma mensagem “**Aponte a câmera do seu celular e preencha os seus dados**”.

  O psicólogo pode gerar esse código no momento da aplicação, para que os avaliados apontem a câmera do celular quando entrarem na sala de testes ou mesmo imprimir e colar na entrada da clínica (ou da sala de testes, onde preferir).

**Fluxos Alternativos**

* Não foi possível identificar fluxos alternativos para este caso de uso.

**Pós-condições**

* QR Code (que direciona o usuário para uma tela de autocadastro de prontuário) disponível \- para impressão ou exibição na tela do celular 

**Exceções**

* **EC1**: Falha na geração do QR Code.

  * O sistema exibe uma mensagem de erro genérico (“Não foi possível gerar o QR Code”), orientando a tentar novamente.

### UC5 – Fazer Autocadastro de Prontuário

### **Descrição**

Permite que o avaliado preencha seus dados pessoais para geração de prontuário de avaliação SENNA.

**Atores**

* **Avaliado**: responsável por informar os dados para o prontuário digital.

**Pré-condições**

* O avaliado deve possuir os **dados mínimos** para preenchimento (nome, CPF, idade etc.).

**Fluxo Principal**

* O **Avaliado** aponta a câmera do celular para o QR Code (disponível em uma etiqueta, folha impressa ou na tela do celular do psicólogo).

* O Avaliado é direcionado para o formulário de autocadastro e preenche os dados solicitados.

* O sistema exibe um formulário para **inserir dados do avaliado** (nome, CPF, data de nascimento, etc.).

* O **Avaliado** clica em **Salvar**, criando o seu prontuário digital para aquela avaliação.

* Em caso de sucesso, o sistema **gera** um **identificador único** do prontuário e exibe uma tela inicial (resumo) do prontuário.

**Fluxos Alternativos**

* O CPF (ou outro identificador) já está vinculado a um prontuário existente na mesma data.

  * O sistema informa que existe um prontuário aberto para aquele avaliado.

  * O sistema apresenta o **identificador único** do prontuário na tela do celular do avaliado.

* Dados obrigatórios ausentes ou inválidos

  * O sistema exibe uma mensagem de erro.

  * O avaliado corrige as informações e reenvia.

**Pós-condições**

* O prontuário digital está **disponível** para receber testes, anotações ou outras informações.

* O psicólogo pode **visualizar** o prontuário recém-criado na lista de prontuários.

**Exceções**

* **EC1**: Falha de comunicação com o banco de dados

  * O sistema exibe uma mensagem de erro genérico (“Não foi possível criar o prontuário”), orientando o usuário a tentar novamente.

  


### UC6 – Criar Prontuário de Avaliado

### **Descrição**

Permite que o Psicólogo preencha os dados pessoais de um avaliado para geração de prontuário de avaliação SENNA.

**Atores**

* **Avaliado**: responsável por informar os dados para o prontuário digital.

**Pré-condições**

* O avaliado deve possuir os **dados mínimos** para preenchimento (nome, CPF, idade etc.).

**Fluxo Principal**

* O **Psicólogo** clica no botão **Novo** da tela **Meus Prontuários**.

* O sistema exibe um formulário para **inserir dados do avaliado** (nome, CPF, data de nascimento, etc.).

* O **Psicólogo** preenche os dados e clica em **Salvar**, criando o prontuário digital para aquele avaliado naquela data.

* Em caso de sucesso, o sistema **gera** um **identificador único** do prontuário e apresenta na lista de **Meus Prontuários**.

**Fluxos Alternativos**

* O CPF (ou outro identificador) já está vinculado a um prontuário existente na mesma data.

  * O sistema informa que existe um prontuário aberto para aquele avaliado.

  * O sistema apresenta o **identificador único** do prontuário na tela do celular do avaliado.

* Dados obrigatórios ausentes ou inválidos

  * O sistema exibe uma mensagem de erro.

  * O avaliado corrige as informações e reenviar.

**Pós-condições**

* O prontuário digital está **disponível** para receber testes, anotações ou outras informações.

* O psicólogo pode **visualizar** o prontuário recém-criado na lista de prontuários.

**Exceções**

* **EC1**: Falha de comunicação com o banco de dados

  * O sistema exibe uma mensagem de erro genérico (“Não foi possível criar o prontuário”), orientando o usuário a tentar novamente.

### UC7 – Corrigir Testes

### **Descrição**

O psicólogo seleciona um prontuário e envia **imagens/fotos** dos testes preenchidos para correção automatizada (OCR/OMR), utilizando uma interface do aplicativo (via telefone celular ou imagem armazenada no computador). A plataforma **associa** o envio ao prontuário cadastrado e realiza a correção, **independentemente** de haver licenças no momento do envio.

**Atores**

* **Psicólogo**: envia as fotos via telefone.  
* (Internamente) **Motor de Correção**: serviço que realiza a leitura (OCR/OMR) e pontuação.

### **Pré-condições**

* O **Psicólogo** deve estar **cadastrado** na base de dados do SENNA.  
* A imagem deve estar em **formato suportado** (JPEG, PNG, PDF, etc.).


### **Fluxo Principal**

* **Envio da Imagem**  
  * O **psicólogo** seleciona (ou cria) o prontuário para o qual deseja enviar a foto para correção.  
  * O **psicólogo** envia a foto através da aplicação (via celular ou desktop).  
  * O sistema pergunta se deseja adicionar mais uma foto ao prontuário.  
    * caso **Sim**, abre a câmera do celular faz novo envio  
    * caso **Não**, volta para a lista dos prontuários  
* **Identificação do Remetente**  
  * O sistema SENNA reconhece o **usuário** e vincula o envio ao **psicólogo** correspondente.  
* **Fila de Correção (OCR/OMR)**  
  * O sistema **envia** as imagens para o mecanismo de reconhecimento, que processa e gera a pontuação/classificação.  
  * Enquanto o teste está na fila de correção, o sistema apresenta a mensagem **Em Processamento**.  
  * Ao final, o **status** do teste é marcado como “Corrigido”.


### **Fluxos Alternativos**

* **Falha no OCR/OMR**  
  * Se o motor de correção não conseguir ler o teste, registra status “Correção falhou”.  
  * O sistema envia mensagem: “Não foi possível corrigir. Tente reenviar ou faça correção manual.”

### **Pós-condições**

* Teste corrigido, com pontuação listada na tela **Meus Prontuários**, no resumo do prontuário.

### **Exceções**

* **EC1: Problemas de Conectividade**  
  * O remetente não recebe confirmação ou o upload não chega ao servidor. Deve tentar novamente.

### **Considerações Finais**

* **Separação Lógica**: O fluxo de submissão para o MVP não exige licenças; paralelamente, haverá uma consulta, em interface administrativa, para identificar se há algum psicólogo que fez alguma correção sem a respectiva licença para o teste.  
* **User Experience**: O psicólogo não precisa de passos adicionais: assim que o teste é corrigido, fica **disponível**.  
* **Escalabilidade**: Em cenários de alto volume, o motor de correção deve suportar filas e processar as imagens de forma assíncrona.

### UC8 – Revisar e Ajustar Dados de Prontuário

### **Descrição**

Este caso de uso descreve como o psicólogo **acessa**, **visualiza** e/ou **edita** dados de um prontuário.

Na tela **Meus Prontuários**, os prontuários são listados, com um cabeçalho

* Identificador (três dígitos) do prontuário \- número sequencial naquela data  
* Dados pessoais do avaliado \- Nome e CPF  
* Botão VER \- abre os detalhes do prontuário para visualização de detalhes (testes, observações) e/ou edição de dados pessoais do avaliado.  
* Botão Fotografia \- envia novas fotografias de folhas de testes.

Quando clica no botão VER, o sistema abre os detalhes do prontuário, com o botão EDITAR, para revisão e edição.

O psicólogo também tem a possibilidade de enviar novas fotos (botão Fotografia) e Editar dados de testes já corrigidos \- mas estes serão tratados em outros Casos de Uso.

### **Atores**

* **Psicólogo**: principal responsável pela avaliação.

### **Pré-condições**

* Para edição dos dados do prontuário, este deve ter sido cadastrado.  
* O psicólogo está **autorizado** a ver os resultados daquele prontuário.  
* (Opcional) O prontuário e o teste estão **localizáveis** (pelo nome, CPF ou identificador do prontuário).

### **Fluxo Principal**

* **Login**: O psicólogo acessa a **URL** do SENNA e faz login.  
* Editar Dados  
  * Na tela inicial, Meus Prontuários, localiza o prontuário desejado.  
  * Clica em VER  
  * O sistema apresenta o botão EDITAR  
  * O psicólogo seleciona o botão EDITAR  
  * Sistema apresenta formulário para edição de dados do avaliado, para que psicólogo revise e/ou altere qualquer dado.  
  * Psicólogo confirma, clicando em **Salvar**, ou descarta as alterações, clicando em **Cancelar**.  
  * Após a operação, o usuário finaliza a revisão e retorna ao **Meus Prontuários**.  
  * Para fechar os detalhes do prontuário, o usuário clica no número do prontuário.  
      
* Resultados  
  * Na tela inicial, **Meus Prontuários**, localiza o prontuário e o teste desejado para revisão e clica no botão **Ver**.  
  * O sistema apresenta os   
  * **Exibição de respostas**:  
    * O sistema apresenta as respostas, conforme identificado pelo OCR/OMR (ou revisado previamente pelo psicólogo, por meio desta mesma tarefa).  
    * O usuário pode então **revisar** as respostas e/ou **editar** se houver necessidade.  
    * Confirma, clicando em **Salvar**, ou descarta as alterações, clicando em **Cancelar**.  
    * Após a operação, o usuário finaliza a revisão e retorna ao **Meus Prontuários**.  
    * O sistema recalcula a pontuação e reclassifica o avaliado, se for o caso.


### **Fluxos Alternativos**

* Teste Não Encontrado  
  * O psicólogo procura por um teste inexistente ou com CPF que não está vinculado a ele.  
  * O psicólogo deve enviar o teste para correção.

### UC9 – Remover Prontuário

### **Descrição**

Este caso de uso descreve como o psicólogo **remove um prontuário** já cadastrado \- com ou sem testes já corrigidos.

Na tela **Meus Prontuários**, os prontuários são listados, com um cabeçalho

* Identificador (três dígitos) do prontuário \- número sequencial naquela data  
* Dados pessoais do avaliado \- Nome e CPF  
* Botão VER \- abre os detalhes do prontuário para visualização de detalhes (testes, observações) e/ou edição de dados pessoais do avaliado.  
* Botão Fotografia \- envia novas fotografias de folhas de testes.

### **Atores**

* **Psicólogo**: principal responsável pela gestão dos prontuários.

### **Pré-condições**

* Para remoção do prontuário, este deve ter sido cadastrado.  
* O psicólogo está **autorizado** a ver os resultados daquele prontuário.  
* (Opcional) O prontuário e o teste estão **localizáveis** (pelo nome, CPF ou identificador do prontuário).

### **Fluxo Principal**

* **Login**: O psicólogo acessa a **URL** do SENNA e faz login.  
* Editar Dados  
  * Na tela inicial, **Meus Prontuários**, localiza o prontuário desejado.  
  * Sobre o prontuário desejado, o psicólogo executa a ação de arrastar para o lado direito (slide).  
  * O sistema apresenta o ícone com uma Lixeira, que indica a ação de remover o prontuário. Clicando sobre a Lixeira, o psicólogo indica que deseja remover o prontuário.  
  * O sistema apresenta mensagem, informando que, se confirmada a ação de remoção, não será possível desfazê-la \- e disponibiliza os botões Cancelar e Apagar.  
    * Selecionando botão **Cancelar**, o sistema cancela a ação, retornando à lista de prontuários  
    * Selecionando botão **Apagar**, o sistema **remove o prontuário** e retorna à lista de prontuários

    


### **Fluxos Alternativos**

* Não foram encontrados fluxos alternativos para esta tarefa


### UC10 \- Revisar e Ajustar Dados de Correção

### **Descrição**

Este caso de uso descreve como o psicólogo **remove um teste já caastrado em um prontuário**.

No detalhamento de um **prontuário** (acessível pelo botão VER), são listados todos os testes já corrigidos.

* Identificador do teste (nome) do prontuário.  
* Classificação obtida, conforme pontuação e tabela normativa utilizada.  
* Botão Editar, que abre os detalhes do teste para visualização e edição.

### **Atores**

* **Psicólogo**: principal responsável pela gestão dos testes.

### **Pré-condições**

* Para remoção do teste, este deve ter sido já corrigido pelo OCR/OMV.  
* O psicólogo está **autorizado** a ver os resultados daquele prontuário.

**Fluxo Principal**

* Na tela inicial, **Meus Prontuários**, localiza o prontuário desejado para revisão e clica no botão **Ver**.  
* O sistema apresenta a lista dos testes já corrigidos dentro daquele prontuário. Ao lado de cada um, o botão **Editar**.  
* Clicando em Editar  
  * O sistema apresenta as respostas, conforme identificado pelo OCR/OMR (ou revisado previamente pelo psicólogo, por meio desta mesma tarefa).  
  * O sistema apresenta também a tabela normativa utilizada para a classificação do avaliado.  
  * Na parte superior da tela, aparecem os botões Cancelar e **Editar Respostas.**  
  * O usuário pode então:  
    * Alterar a tabela normativa utilizada, selecionando-a em uma lista drop-down e/ou  
    * **Editar** as respostas.  
  * Confirma, clicando em **Salvar**, ou descarta as alterações, clicando em **Cancelar**.  
  * Após a operação, o usuário finaliza a revisão e retorna ao **Meus Prontuários**.  
  * O sistema recalcula a pontuação e reclassifica o avaliado, se for o caso.


### **Fluxos Alternativos**

* Teste Não Encontrado  
  * O psicólogo procura por um teste inexistente ou com CPF que não está vinculado a ele.  
  * O psicólogo deve enviar o teste para correção.

### UC11 \- Remover Correção

### **Descrição**

Este caso de uso descreve como o psicólogo **remove um prontuário** já cadastrado \- com ou sem testes já corrigidos.

Na tela **Meus Prontuários**, os prontuários são listados, com um cabeçalho

* Identificador (três dígitos) do prontuário \- número sequencial naquela data  
* Dados pessoais do avaliado \- Nome e CPF  
* Botão VER \- abre os detalhes do prontuário para visualização de detalhes (testes, observações) e/ou edição de dados pessoais do avaliado.  
* Botão Fotografia \- envia novas fotografias de folhas de testes.

### **Atores**

* **Psicólogo**: principal responsável pela gestão dos prontuários.

### **Pré-condições**

* Para remoção do prontuário, este deve ter sido cadastrado e corrigido.  
* O psicólogo está **autorizado** a ver os resultados daquele prontuário.  
* (Opcional) O prontuário e o teste estão **localizáveis** (pelo nome, CPF ou identificador do prontuário).

### **Fluxo Principal**

* **Login**: O psicólogo acessa a **URL** do SENNA e faz login.  
* Editar Dados  
  * Na tela inicial, **Meus Prontuários**, localiza o prontuário desejado.  
  * No prontuário desejado, o psicólogo clica sobre o botão VER.  
  * O sistema abre a lista de testes já corrigidos dentro daquele prontuário  
    * Teste em processamento, botão com label **Em processamento**  
    * Teste já processado, botão com label Editar  
  * Sobre o teste **já corrigido** desejado, o psicólogo pode executar a ação de arrastar para o lado direito (slide).  
  * O sistema apresenta o ícone com uma Lixeira, que indica a ação de remover o teste. Clicando sobre a Lixeira, o psicólogo indica que deseja remover o teste.  
  * O sistema apresenta mensagem, informando que, se confirmada a ação de remoção, não será possível desfazê-la \- e disponibiliza os botões Cancelar e Apagar.  
    * Selecionando o botão **Cancelar**, o sistema cancela a ação, retornando à lista de prontuários.  
    * Selecionando o botão **Apagar**, o sistema **remove o teste** e retorna à lista de testes do prontuário.

    


### **Fluxos Alternativos**

* O teste ainda não foi processado pelo OCR/OMR \- o sistema apresenta não disponibiliza a funcionalidade de remoção.


### UC12 – Emitir Parecer Técnico

**Descrição**

Confirma a classificação do avaliado e emite um **Parecer Técnico**, com observações do psicólogo, se houver**.**

O sistema abre um campo para Observações do psicólogo e gera uma página de resumo, dados do avaliado, pontuações, classificações, tabelas normativas utilizadas em cada teste do prontuário.

**Atores**

* **Psicólogo**: faz a emissão do Parecer Técnico.

**Pré-condições**

* Todos os testes necessários devem estar **corrigidos** e preferencialmente revisados.

* Tabelas normativas padrão precisam estar definidas.


**Fluxo Principal**

* O psicólogo acessa a tela Meus Prontuários, que lista todos os prontuários para aquela determinada data (há opção para seleção de outras datas).

* **Psicólogo** clica no botão **Acessar** do prontuário que deseja Fechar.

* O sistema **abre um resumo** do prontuário (com os testes e respectivos resultados) e apresenta o botão **Fechar Prontuário**.

* Psicólogo clica em botão **Fechar Prontuário**.

* O sistema abre campo **Observações**, para que o psicólogo faça anotações, se julgar que são necessárias.

* O psicólogo pode clicar em **Salvar** (para apenas registrar as Observações, mas ainda não fechando o prontuário) ou **Fechar Prontuário**.

* O sistema salva o parecer em **estado Fechado**.

* O sistema apresenta opção de **Emitir Parecer Técnico**.

**Fluxos Alternativos**

* Há testes pendentes ou sem correção

  1. O sistema alerta: “Existem testes pendentes” e não permite a operação.

  2. O psicólogo deve aguardar a conclusão da correção do(s) teste(s) pendente(s) para concluir.

**Pós-condições**

* O prontuário está **fechado** de forma imutável e a operação de emitir parecer técnico fica **disponível**.

**Exceções**

* **EC1**: Falha na operação

  * O psicólogo pode solicitar suporte ou tentar novamente mais tarde.

### UC13 – Comunicar Resultado para Avaliado (opcional)

**Descrição**

Permite enviar ao **avaliado** (candidato) o resultado (apto/não-apto), junto de instruções ou orientações, por canais como email, WhatsApp, SMS ou outros.

**Atores**

* **Psicólogo**: determina como e quando enviar o resultado.

**Pré-condições**

* O **parecer técnico** deve estar **emitido**.

* O sistema deve ter os **dados de contato** (email, telefone) do avaliado.

**Fluxo Principal**

* O psicólogo acessa o prontuário do avaliado.

* O psicólogo registra observações e/ou orientações para o avaliado, caso necessário.

* Seleciona “Enviar Resultado ao Avaliado”.

* O sistema **exibe** as opções de envio (email, WhatsApp, etc.) configuradas.

* O usuário escolhe o canal e confirma.

* O sistema **envia** a mensagem contendo o status e registra data/hora.

**Fluxos Alternativos**

* O avaliado não tem dados de contato cadastrados

  1. O sistema solicita que o psicólogo/assistente adicione um email ou telefone.

  2. Retorna ao passo 3 do fluxo principal.

**Pós-condições**

* O avaliado **recebe** a comunicação com o resultado.

* O prontuário registra o **histórico** de envio (quem enviou e quando).

**Exceções**

* **EC1**: Falha de envio (ex.: email inválido, erro na API de WhatsApp)

  * O sistema exibe aviso (“Não foi possível enviar”), sugerindo que o usuário verifique dados e tente novamente.

### UC14 – Consultar Histórico de Uso

**Descrição**

Permite que o psicólogo (ou assistente) consulte **quantas licenças** SENNA foram consumidas, o **saldo disponível** e o **histórico** de uso, por teste ou período.

**Atores**

* **Psicólogo**, **Assistente da Clínica**: ambos podem precisar monitorar o uso de licenças.

**Pré-condições**

* O usuário deve ter **login** no sistema e permissão para **visualizar** dados financeiros/de licenças.

* Deve existir um **contrato** ou pacote de licenças ativas.

**Fluxo Principal**

* O usuário acessa o menu “Licenças” ou “Relatório de Consumo”.

* O sistema exibe um **painel** com informações de quantas licenças foram usadas, quantas restam e a data de validade (se houver).

* O usuário pode **filtrar** por período (ex.: último mês, trimestre) ou por tipo de teste.

* O sistema mostra uma **lista** detalhada (data, prontuário, teste corrigido, etc.).

* O usuário pode exportar esse relatório (PDF/Excel), se disponível.

**Fluxos Alternativos**

* Nenhuma licença registrada

  1. O sistema mostra “0 licenças” ou convida o usuário a adquirir um pacote.

* Licenças expiradas

  1. O sistema exibe uma notificação de que as licenças disponíveis estão vencidas.

     

**Pós-condições**

* O usuário tem **visibilidade** clara do consumo e do **saldo** de licenças.

* Pode tomar decisões (ex.: comprar mais licenças) se o saldo estiver baixo.

**Exceções**

* **EC1**: Erro na base de dados de licenças ou integração com sistema de billing

  * O sistema exibe mensagem de erro e impede a consulta até normalizar.

### Deprecated \- UC9 – Revisar Classificação do Avaliado

**Descrição**

Permite **revisar** e/ou alterar tabelas normativas usadas para a classificação de um prontuário em particular.

**Atores**

* **Psicólogo**: responsável por revisar e editar o parecer.

**Pré-condições**

* Há testes que já foram corrigidos pelo sistema.

**Fluxo Principal**

* Na tela de **Meus Prontuários**, o psicólogo visualiza a lista de prontuários.

* Clica no botão **Ver** do prontuário que deseja revisar.

* O sistema apresenta o resumo dos resultados dos testes para revisão, com a respectiva classificação (de acordo com a pontuação e tabela normativa utilizada).

* O psicólogo clica no botão Resultado do teste que deseja revisar ou alterar.

* Na tela de detalhe do teste visualiza a pontuação, a tabela normativa usada, a classificação e as respostas.

* Se desejar, pode selecionar outra tabela normativa \- o que pode alterar a classificação do avaliado.

* Clicando em **Salvar**, o psicólogo confirma a utilização da nova tabela apenas para aquele teste naquele prontuário.


**Fluxos Alternativos**

* Não foram identificados fluxos alternativos para esta tarefa.


**Pós-condições**

* A classificação é atualizada e armazenada de acordo com a tabela normativa utilizada.

* (Opcional) O sistema guarda **histórico** de versões, se a funcionalidade existir.

**Exceções**

* **EC1**: Falha no salvamento (ex.: servidor indisponível)

  * O sistema retorna mensagem de erro, possibilitando que o psicólogo tente novamente.

