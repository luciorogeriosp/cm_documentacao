**Casos de Uso — Sistema de Gestão de Programas Sociais (Consulado da Mulher)**

Documento derivado do escopo original do cliente, das reuniões de levantamento (abr./jun. 2026) e do modelo de referência.

---

## Atores

| Ator                             | Descrição                                                                                                                                                                              |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Empreendedora (Beneficiada)**  | Mulher empreendedora em situação de vulnerabilidade social; participante dos programas. Acessa conteúdos, envia atividades e dados financeiros, principalmente via celular e WhatsApp. |
| **Administrador**                | Membro da equipe do Consulado com acesso pleno ao sistema (configuração de programas, usuários, relatórios globais, importação de dados).                                              |
| **Gestor de Programa**           | Responsável pela operação de um ou mais programas/edições (seleção, turmas, comunicação, indicadores).                                                                                 |
| **Educador / Assessor**          | Profissional que acompanha turmas, valida entregas, registra presença manual, preenche formulários qualitativos e dá feedback às empreendedoras.                                       |
| **Parceiro Institucional**       | Organização externa que replica a metodologia (ex.: Multiplica por Elas); pode atuar como controlador ou operador de dados conforme contrato.                                          |
| **Lead (Pré-inscrita)**          | Pessoa que iniciou, mas ainda não concluiu, o processo de inscrição; objeto do mini CRM.                                                                                               |
| **WhatsApp (Meta Business API)** | Ator secundário (sistema externo) responsável pelo envio e recebimento de mensagens, links e notificações.                                                                             |
| **YouTube**                      | Ator secundário para hospedagem e entrega otimizada de videoaulas.                                                                                                                     |
| **Google Meet**                  | Ator secundário para aulas ao vivo.                                                                                                                                                    |
| **Motor de Automação**           | Componente interno que executa gatilhos (liberação de conteúdo, lembretes, certificação automática).                                                                                   |

---

## Casos de Uso

### Gestão de Acesso e Usuários

UC1 — Cadastro de Usuário da Equipe

UC2 — Login da Equipe (Portal Administrativo)

UC3 — Login da Empreendedora via WhatsApp

UC4 — Gerenciar Perfis e Permissões de Acesso

UC5 — Configurar Autenticação e Segurança (2FA, expiração de senha)

### Programas, Edições e Turmas

UC6 — Cadastrar Programa

UC7 — Criar e Configurar Edição de Programa

UC8 — Configurar Regulamento e Critérios de Seleção

UC9 — Configurar Critérios de Beneficiamento e Certificação por Edição

UC10 — Cadastrar Unidade e Parceiro

UC11 — Criar e Gerenciar Turma

UC12 — Alocar Empreendedora em Turma

UC13 — Transferir Empreendedora entre Turmas

### Inscrição, Seleção e Mini CRM

UC14 — Realizar Pré-Cadastro (Captura Inicial de Lead)

UC15 — Realizar Inscrição Completa

UC16 — Aceitar Termos LGPD e Regulamento do Programa

UC17 — Validar Elegibilidade da Inscrição (Automático)

UC18 — Selecionar Participantes para o Programa

UC19 — Comunicar Resultado da Seleção

UC20 — Gerenciar Leads com Inscrição Incompleta (Mini CRM)

UC21 — Importar Inscrições de Fonte Externa

UC22 — Reutilizar Cadastro de Participante Recorrente

### Gestão de Beneficiadas

UC23 — Cadastrar e Atualizar Dados da Empreendedora

UC24 — Consultar Histórico de Participação

UC25 — Classificar Status da Participante

UC26 — Registrar Motivo de Desistência

UC27 — Cadastrar Empreendimento Coletivo

### Conteúdo Educacional e Jornada

UC28 — Criar Módulo e Atividades do Programa

UC29 — Configurar Trilha e Formato de Consumo (Sequencial ou Livre)

UC30 — Configurar Liberação Progressiva de Conteúdo

UC31 — Configurar Calendário e Datas por Turma

UC32 — Adicionar Conteúdo Extra por Turma

UC33 — Consumir Conteúdo Educacional

UC34 — Registrar Progresso em Videoaula

UC35 — Responder Atividade (Exercício / Questionário)

### Presença e Frequência

UC36 — Registrar Presença via QR Code

UC37 — Registrar Presença Manualmente (Gestor/Educador)

UC38 — Consultar Frequência da Participante

### Entregas, Materiais e Dados Financeiros

UC39 — Enviar Material ou Evidência de Atividade

UC40 — Avaliar Entrega e Fornecer Feedback

UC41 — Enviar Dados Financeiros Mensais

UC42 — Validar Dados Financeiros (Educador)

UC43 — Preencher Formulário de Indicadores (Baseline / Endline)

UC44 — Responder Pesquisa de Avaliação (NPS / Satisfação)

### Comunicação e WhatsApp

UC45 — Disparar Mensagem Individual via WhatsApp

UC46 — Disparar Mensagem em Grupo via WhatsApp

UC47 — Programar Mensagens Automáticas

UC48 — Enviar Lembrete por Atividade Não Concluída

UC49 — Enviar Link Personalizado com Autenticação Embutida

### Certificação, Premiação e Capital Semente

UC50 — Emitir Certificado Automaticamente

UC51 — Consultar Ranking e Engajamento

UC52 — Selecionar Contempladas (Premiação / Mentoria)

UC53 — Analisar Elegibilidade para Capital Semente

### Relatórios, BI e Migração

UC54 — Consultar Dashboard de Impacto

UC55 — Gerar Relatórios Quantitativos

UC56 — Gerar Relatórios Qualitativos

UC57 — Exportar Relatórios (Excel / PDF)

UC58 — Importar Dados Históricos

UC59 — Migrar Dados do Sistema Legado

### Funcionalidades Complementares

UC60 — Consultar e Solicitar Certificado (Autoatendimento)

UC61 — Utilizar Chat de Dúvidas (IA — opcional/futuro)

UC62 — Consultar Consumo de Mensagens WhatsApp

---

## Detalhamento dos Casos de Uso

### UC1 – Cadastro de Usuário da Equipe

**Descrição**

Permite que o **Administrador** cadastre membros da equipe do Consulado (gestores, educadores, assessores) no portal administrativo, definindo perfil de acesso e programas/edições vinculados.

**Atores**

- **Administrador**: responsável pelo cadastro.
- **Gestor / Educador**: usuário cadastrado.

**Pré-condições**

- O administrador possui acesso ao portal administrativo.
- Existe ao menos um perfil de permissão configurado no sistema.

**Fluxo Principal**

- O **Administrador** acessa o menu **Usuários da Equipe** e seleciona **Novo Usuário**.
- O sistema apresenta formulário com nome, e-mail, telefone, perfil de acesso e programas/edições permitidos.
- O **Administrador** preenche os dados e confirma.
- O sistema valida campos obrigatórios e unicidade do e-mail.
- O sistema envia e-mail de convite com link para definição de senha.
- O usuário define senha e aceita termos de uso.
- O sistema confirma o cadastro e registra o usuário como ativo.

**Fluxos Alternativos**

- **E-mail já cadastrado**: o sistema informa duplicidade e sugere recuperação de acesso.
- **Convite não aceito**: após período configurado, o cadastro permanece pendente; administrador pode reenviar convite.

**Pós-condições**

- O membro da equipe possui conta válida e pode acessar funcionalidades conforme seu perfil.

**Exceções**

- **EC1**: Falha no envio de e-mail — sistema registra tentativa e permite reenvio manual.

---

### UC2 – Login da Equipe (Portal Administrativo)

**Descrição**

Descreve o acesso da equipe do Consulado ao portal administrativo/gestão via navegador web (desktop ou mobile), com autenticação segura.

**Atores**

- **Administrador**, **Gestor de Programa**, **Educador / Assessor**.

**Pré-condições**

- O usuário possui cadastro ativo no sistema.
- Conexão à internet e navegador compatível.

**Fluxo Principal**

- O usuário acessa a URL do portal administrativo.
- O sistema exibe tela de login (e-mail e senha).
- O usuário insere credenciais.
- O sistema valida credenciais e cria sessão autenticada.
- O sistema direciona o usuário ao painel inicial conforme seu perfil (programas, turmas, relatórios).

**Fluxos Alternativos**

- **Credenciais inválidas**: mensagem de erro; usuário pode tentar novamente ou recuperar senha.
- **Senha expirada**: sistema exige troca de senha antes de prosseguir.
- **Conta bloqueada**: sistema informa impossibilidade de acesso; contato com administrador necessário.

**Pós-condições**

- Usuário autenticado com acesso às funcionalidades permitidas pelo perfil.

**Exceções**

- **EC1**: Servidor indisponível — erro 503; tentar mais tarde.
- **EC2**: Falha de rede — verificar conexão.

---

### UC3 – Login da Empreendedora via WhatsApp

**Descrição**

Permite que a **Empreendedora** acesse o sistema sem e-mail e senha, utilizando autenticação via WhatsApp (número de telefone como identificador único), reduzindo barreiras de acesso.

**Atores**

- **Empreendedora (Beneficiada)**.
- **WhatsApp (Meta Business API)** — ator secundário.

**Pré-condições**

- A empreendedora possui cadastro ou link de acesso vinculado ao seu telefone.
- Possui WhatsApp instalado e número válido.

**Fluxo Principal**

- A **Empreendedora** recebe mensagem via WhatsApp com link personalizado (painel do aluno, atividade ou QR code).
- Ao clicar no link, o sistema identifica o número de telefone (token na URL ou fluxo de verificação).
- O sistema valida que o número está vinculado a uma participante ativa.
- O sistema cria sessão autenticada e abre o painel correspondente (conteúdo, atividade, presença).

**Fluxos Alternativos**

- **Número não cadastrado**: sistema direciona para fluxo de inscrição ou pré-cadastro (UC14/UC15).
- **Link expirado**: sistema solicita novo envio via WhatsApp ou contato com gestor.
- **Primeiro acesso após cadastro manual**: sistema solicita aceites LGPD pendentes (UC16).

**Pós-condições**

- Empreendedora autenticada e apta a consumir conteúdo, enviar entregas e registrar presença.

**Exceções**

- **EC1**: Falha na API do WhatsApp — link alternativo por SMS/e-mail, se disponível.
- **EC2**: Telefone alterado — gestor atualiza cadastro manualmente.

---

### UC4 – Gerenciar Perfis e Permissões de Acesso

**Descrição**

Permite ao **Administrador** definir níveis de acesso (administrador, gestor, educador) e restringir visualização de dados por programa, edição, unidade ou turma, em conformidade com a LGPD.

**Atores**

- **Administrador**.

**Pré-condições**

- Administrador autenticado no portal.

**Fluxo Principal**

- O **Administrador** acessa **Configurações → Perfis e Permissões**.
- O sistema lista perfis existentes e permissões associadas (cadastro, seleção, turmas, relatórios, comunicação).
- O administrador cria ou edita perfil, marcando funcionalidades permitidas e escopo (programas/edições/unidades).
- O sistema salva configuração.
- Usuários com aquele perfil passam a ter acesso restrito conforme definido.

**Fluxos Alternativos**

- **Perfil em uso**: alterações aplicam-se imediatamente; sessões ativas podem exigir novo login.

**Pós-condições**

- Permissões atualizadas; cada conta acessa apenas dados pertinentes à sua função.

**Exceções**

- **EC1**: Falha ao salvar — mensagem de erro; tentar novamente.

---

### UC5 – Configurar Autenticação e Segurança

**Descrição**

Permite ao **Administrador** configurar políticas de segurança do portal administrativo: duplo fator de autenticação (2FA), expiração e troca obrigatória de senhas.

**Atores**

- **Administrador**.

**Pré-condições**

- Administrador autenticado com permissão de configuração global.

**Fluxo Principal**

- O **Administrador** acessa **Configurações → Segurança**.
- Define prazo de expiração de senha, complexidade mínima e obrigatoriedade de 2FA para perfis administrativos.
- O sistema persiste políticas e aplica em próximos logins.

**Pós-condições**

- Políticas de segurança ativas conforme LGPD e requisitos do escopo.

**Exceções**

- **EC1**: Configuração inválida — sistema exibe validação antes de salvar.

---

### UC6 – Cadastrar Programa

**Descrição**

Permite cadastrar um programa social do Consulado (ex.: Empreende Mulher, Empreende no Zap, Multiplica por Elas), com identificador único (slug) e URL de acesso direto.

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Usuário autenticado com permissão de gestão de programas.

**Fluxo Principal**

- O usuário acessa **Programas → Novo Programa**.
- Informa nome, slug (ex.: `edu.consulado.org.br/empreende-no-zap`), descrição, duração típica, pilares (educação, mentoria, capital semente) e tipo (online, híbrido, presencial).
- O sistema valida unicidade do slug e campos obrigatórios.
- O sistema registra o programa.

**Pós-condições**

- Programa disponível para criação de edições e configuração de módulos.

**Exceções**

- **EC1**: Slug duplicado — sistema solicita alteração.

---

### UC7 – Criar e Configurar Edição de Programa

**Descrição**

Permite criar uma edição (ciclo) dentro de um programa, com versionamento (ex.: 2026.1, 2026.2), ano de referência, regulamento, vagas e período de inscrição. Apenas uma edição fica aberta para inscrição por vez.

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Programa cadastrado (UC6).
- Regulamento aprovado pelo jurídico (PDF ou texto no sistema).

**Fluxo Principal**

- O usuário seleciona o programa e clica em **Nova Edição**.
- Informa identificador (ex.: 2026.1), ano de referência, datas de inscrição, vagas previstas e status (rascunho / inscrições abertas).
- Anexa ou referencia regulamento específico da edição.
- O sistema valida que não há outra edição do mesmo programa com inscrições abertas simultaneamente.
- O sistema publica URL de inscrição direta da edição.

**Fluxos Alternativos**

- **Edição anterior ainda aberta**: sistema impede abertura simultânea ou solicita encerramento da anterior.

**Pós-condições**

- Edição configurada e apta a receber inscrições, turmas e módulos.

**Exceções**

- **EC1**: Regulamento ausente — sistema alerta antes de publicar.

---

### UC8 – Configurar Regulamento e Critérios de Seleção

**Descrição**

Permite definir critérios automáticos e manuais de elegibilidade para a edição (idade, renda per capita, tempo de empreendimento, região, carência de premiação anterior, etc.).

**Atores**

- **Gestor de Programa**, **Administrador**.

**Pré-condições**

- Edição criada (UC7).

**Fluxo Principal**

- O gestor acessa a edição e seleciona **Critérios de Seleção**.
- Define travas automáticas (ex.: renda máxima 1 SM per capita, mínimo 6 meses de empreendimento).
- Define critérios de desempate e regras de recorrência (ex.: carência de 3 anos para nova premiação).
- Indica se restrições geográficas são rígidas ou flexíveis.
- O sistema persiste regras para validação na inscrição (UC17) e apoio à seleção (UC18).

**Fluxos Alternativos**

- **Flexibilidade operacional**: gestor marca critério como "alerta" em vez de bloqueio, permitindo análise manual.

**Pós-condições**

- Critérios disponíveis para validação automática e filtros de seleção.

---

### UC9 – Configurar Critérios de Beneficiamento e Certificação por Edição

**Descrição**

Permite configurar regras configuráveis por edição: percentual mínimo de participação para ser beneficiada (ex.: 50%), presença para certificação (ex.: 75%), conclusão integral (100%) e elegibilidade a capital semente/mentoria.

**Atores**

- **Gestor de Programa**, **Administrador**.

**Pré-condições**

- Edição ativa com metodologia definida.

**Fluxo Principal**

- O gestor define percentuais e tipos de atividade que contam para frequência (presencial, vídeo, entrega, questionário).
- Define se critérios serão aplicados automaticamente ou com validação manual para exceções.
- O sistema aplica regras no cálculo de status (UC25) e emissão de certificado (UC50).

**Pós-condições**

- Regras de beneficiamento e certificação parametrizadas para a edição.

---

### UC10 – Cadastrar Unidade e Parceiro

**Descrição**

Permite registrar unidades físicas (cidades: São Paulo, Rio Claro, Joinville, Manaus) e parceiros institucionais (Multiplica por Elas), com CNPJ e papel no tratamento de dados (controlador/operador).

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Permissão de cadastro institucional.

**Fluxo Principal**

- Usuário acessa **Unidades e Parceiros → Novo**.
- Informa tipo (unidade própria ou parceiro), localização, responsável e vínculo com programas.
- Para parceiros, registra CNPJ (recuperação de dados históricos se já existente).
- Sistema salva registro para alocação de turmas e relatórios por território.

**Pós-condições**

- Unidade/parceiro disponível para associação a turmas e filtros de BI.

---

### UC11 – Criar e Gerenciar Turma

**Descrição**

Permite criar turmas dentro de uma edição, definir gestor responsável, vagas, agrupamento regional, datas de início/fim e calendário local.

**Atores**

- **Gestor de Programa**, **Educador / Assessor** (consulta e operação limitada).

**Pré-condições**

- Edição configurada; módulos do programa definidos (UC28).

**Fluxo Principal**

- Gestor acessa edição → **Turmas → Nova Turma**.
- Informa nome, unidade/região, gestor, vagas e datas.
- Associa metodologia/módulos padrão do programa.
- Configura calendário específico (UC31).
- Sistema cria turma e vincula ao gestor designado.

**Fluxos Alternativos**

- **Vagas esgotadas**: sistema impede novas alocações até ajuste manual.

**Pós-condições**

- Turma pronta para receber participantes selecionadas.

---

### UC12 – Alocar Empreendedora em Turma

**Descrição**

Permite ao **Gestor** alocar manualmente participantes aprovadas na seleção em turmas específicas, considerando logística regional e perfil — sem exigir escolha de turma no momento da inscrição.

**Atores**

- **Gestor de Programa**, **Educador / Assessor**.

**Pré-condições**

- Participante com status "selecionada" (UC18).
- Turma com vagas disponíveis.

**Fluxo Principal**

- Gestor acessa lista de selecionadas da edição.
- Filtra por região, perfil ou critério operacional.
- Seleciona participantes e turma de destino.
- Confirma alocação.
- Sistema atualiza vínculo turma-participante e dispara comunicação de boas-vindas (UC45/UC46).

**Pós-condições**

- Participante vinculada à turma; gestor responsável passa a enxergar seus dados.

---

### UC13 – Transferir Empreendedora entre Turmas

**Descrição**

Permite mover participante entre turmas durante o programa, preservando histórico de atividades e relacionamento.

**Atores**

- **Gestor de Programa**.

**Pré-condições**

- Participante ativa em turma de origem.
- Turma de destino compatível (mesma edição).

**Fluxo Principal**

- Gestor localiza participante e seleciona **Transferir Turma**.
- Escolhe turma destino e registra motivo.
- Sistema migra vínculo, preserva histórico e notifica gestores envolvidos.

**Pós-condições**

- Participante na nova turma; histórico consolidado no cadastro.

---

### UC14 – Realizar Pré-Cadastro (Captura Inicial de Lead)

**Descrição**

Primeira etapa da inscrição em duas fases (mini CRM): captura dados mínimos (nome, telefone, e-mail) e consentimento LGPD **antes** do formulário completo, reduzindo evasão e permitindo reativação de leads.

**Atores**

- **Lead (Pré-inscrita)**.
- **Empreendedora** (quando retoma inscrição).

**Pré-condições**

- Edição com inscrições abertas.
- URL de inscrição da edição acessível.

**Fluxo Principal**

- A pessoa acessa link direto do programa/edição.
- O sistema exibe indicador visual de progresso (etapa 1 de N).
- Apresenta termo LGPD e caixa de aceite **obrigatória** antes de qualquer dado pessoal.
- Após aceite, solicita nome, telefone e e-mail.
- A pessoa confirma; sistema registra lead com status "pré-cadastro concluído".
- Sistema direciona para inscrição completa (UC15) ou envia link de retomada.

**Fluxos Alternativos**

- **Aceite LGPD não marcado**: cadastro não prossegue.
- **Abandono após pré-cadastro**: lead fica disponível no mini CRM (UC20).

**Pós-condições**

- Lead capturado legalmente; equipe pode reativar contato.

**Exceções**

- **EC1**: Falha ao salvar — orientar retry.

---

### UC15 – Realizar Inscrição Completa

**Descrição**

Permite concluir o "cadastrão" de inscrição em etapas padronizadas: dados pessoais, financeiros/socioeconômicos e específicos do programa, com indicador de progresso visual.

**Atores**

- **Empreendedora**, **Lead**.

**Pré-condições**

- Pré-cadastro concluído (UC14) ou fluxo de inscrição integral habilitado.
- Aceite LGPD registrado.

**Fluxo Principal**

- Sistema apresenta formulário em etapas (dados pessoais → financeiros → programa).
- Exibe barra/indicador de progresso em cada etapa.
- Valida campos obrigatórios (CPF, endereço, escolaridade, perfil socioeconômico, etc.).
- Ao final, solicita aceite do regulamento **específico da edição** (UC16).
- Participante confirma envio.
- Sistema registra inscrição com status "finalizada — aguardando seleção".
- Sistema oferece recompensa única (ex.: e-book de boas-vindas), independentemente de seleção.

**Fluxos Alternativos**

- **Dados inválidos**: mensagem por campo; retorno à etapa correspondente.
- **Participante recorrente** (UC22): sistema pré-preenche dados históricos e solicita atualização.
- **Inscrição incompleta**: status "iniciada"; retomada posterior via link.

**Pós-condições**

- Inscrição registrada; elegível a validação (UC17) e seleção (UC18).

**Exceções**

- **EC1**: Edição encerrada durante preenchimento — sistema informa encerramento.

---

### UC16 – Aceitar Termos LGPD e Regulamento do Programa

**Descrição**

Registra aceites legais: LGPD (único para todos os fluxos) e regulamento (específico por edição/programa), incluindo uso de imagem quando aplicável.

**Atores**

- **Empreendedora**, **Lead**, **Gestor** (em cadastro manual).

**Pré-condições**

- Fluxo de inscrição ou cadastro manual em andamento.

**Fluxo Principal**

- Sistema apresenta textos dos termos com links para leitura integral.
- Usuária marca aceites obrigatórios.
- Sistema registra data/hora, IP/dispositivo e versão do termo aceito.

**Fluxos Alternativos**

- **Cadastro manual pelo gestor**: sistema envia link de aceite via WhatsApp; participante só avança após confirmação.

**Pós-condições**

- Aceites registrados conforme conformidade jurídica.

---

### UC17 – Validar Elegibilidade da Inscrição (Automático)

**Descrição**

Aplica critérios configurados (UC8) sobre inscrições finalizadas: validação de CPF, duplicidade, renda, região, recorrência e demais travas.

**Atores**

- **Motor de Automação** (interno).
- **Gestor de Programa** (consulta resultados).

**Pré-condições**

- Inscrição finalizada (UC15).
- Critérios de seleção configurados (UC8).

**Fluxo Principal**

- Sistema executa validações automáticas ao receber inscrição.
- Marca inscrição como: elegível, elegível com alerta ou inelegível (com motivo).
- Disponibiliza resultado para painel de seleção (UC18).

**Fluxos Alternativos**

- **Alerta sem bloqueio**: inscrição segue para análise manual.

**Pós-condições**

- Inscrições classificadas para apoio à seleção.

---

### UC18 – Selecionar Participantes para o Programa

**Descrição**

Permite ao **Gestor** aplicar seleção sobre base de inscritas, combinando filtros automáticos, análise manual, entrevistas e histórico de participação anterior.

**Atores**

- **Gestor de Programa**, **Educador / Assessor**.

**Pré-condições**

- Período de inscrição encerrado ou em fase de seleção.
- Inscrições validadas (UC17).

**Fluxo Principal**

- Gestor acessa painel da edição com total de inscritas, elegíveis e filtros.
- Aplica filtros (vulnerabilidade, região, novas participantes vs. recorrentes).
- Seleciona participantes dentro do limite de vagas/orçamento.
- Confirma lista de aprovadas e reprovadas.
- Sistema atualiza status e prepara comunicação (UC19).

**Fluxos Alternativos**

- **Volume superior à meta**: gestor seleciona número maior que vagas finais (ex.: 50–60 para meta de 40 beneficiadas).

**Pós-condições**

- Lista de selecionadas definida; pronta para alocação em turmas.

---

### UC19 – Comunicar Resultado da Seleção

**Descrição**

Envia mensagem automática ou manual às inscritas informando aprovação, reprovação ou lista de espera, com orientações para próximos passos.

**Atores**

- **Gestor de Programa**.
- **WhatsApp (Meta Business API)**.

**Pré-condições**

- Seleção concluída (UC18).

**Fluxo Principal**

- Gestor aciona **Comunicar Resultado** (individual ou em lote).
- Sistema utiliza templates aprovados (aprovada / não selecionada / aguarde).
- Mensagens enviadas via WhatsApp com links pertinentes (grupo, painel, redes sociais).

**Pós-condições**

- Participantes informadas; histórico de comunicação registrado.

**Exceções**

- **EC1**: Falha no envio — retry ou envio manual.

---

### UC20 – Gerenciar Leads com Inscrição Incompleta (Mini CRM)

**Descrição**

Permite visualizar, filtrar e reativar contatos que abandonaram pré-cadastro ou inscrição, com consentimento LGPD já registrado.

**Atores**

- **Gestor de Programa**, **Administrador**.

**Pré-condições**

- Leads com aceite LGPD e inscrição incompleta.

**Fluxo Principal**

- Gestor acessa **Mini CRM → Leads Abandonados**.
- Filtra por programa, edição, etapa de abandono e data.
- Seleciona leads e dispara mensagem de retomada com link personalizado.
- Sistema registra tentativas de reativação e conversões.

**Pós-condições**

- Leads qualificados reengajados; taxa de conversão mensurável.

---

### UC21 – Importar Inscrições de Fonte Externa

**Descrição**

Permite migrar inscrições de Google Forms/planilhas para o sistema, mapeando campos e registrando aceites pendentes.

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Arquivo CSV/planilha compatível com campos do sistema.

**Fluxo Principal**

- Usuário acessa **Importação → Inscrições**.
- Faz upload do arquivo e mapeia colunas.
- Sistema valida dados e importa registros.
- Para aceites ausentes, dispara fluxo UC16 via WhatsApp.

**Pós-condições**

- Inscrições legadas integradas à edição correspondente.

---

### UC22 – Reutilizar Cadastro de Participante Recorrente

**Descrição**

Participante já cadastrada em edição anterior valida/atualiza dados ao se inscrever novamente, sem recadastro completo.

**Atores**

- **Empreendedora**.

**Pré-condições**

- CPF/telefone já existente na base unificada.

**Fluxo Principal**

- Sistema identifica participante recorrente no início da inscrição.
- Pré-preenche dados históricos (cadastro, participações anteriores, renda baseline).
- Solicita confirmação/atualização dos dados alterados.
- Registra nova inscrição vinculada ao histórico (UC24).

**Pós-condições**

- Cadastro atualizado; histórico preservado.

---

### UC23 – Cadastrar e Atualizar Dados da Empreendedora

**Descrição**

Permite cadastro manual pela equipe ou autoatualização pela empreendedora (contato, endereço, escolaridade, perfil socioeconômico, negócio).

**Atores**

- **Empreendedora**, **Educador / Assessor**, **Gestor**.

**Pré-condições**

- Participante vinculada a programa ou inscrição.

**Fluxo Principal**

- **Empreendedora** acessa painel → **Meus Dados** e edita informações permitidas.
- Ou **Educador** cadastra/edita via portal administrativo.
- Sistema valida formatos (CPF, e-mail, telefone) e salva alterações com log de auditoria.

**Pós-condições**

- Dados atualizados para operação e relatórios.

---

### UC24 – Consultar Histórico de Participação

**Descrição**

Permite consultar programas, edições, turmas, status e evolução de indicadores de uma empreendedora ao longo do tempo (até 5 anos importados + novos ciclos).

**Atores**

- **Gestor**, **Educador**, **Administrador**, **Empreendedora** (visão limitada própria).

**Pré-condições**

- Cadastro existente na base unificada.

**Fluxo Principal**

- Usuário busca participante por CPF, nome ou telefone.
- Sistema exibe linha do tempo: inscrições, seleções, turmas, status, certificações, premiações e indicadores financeiros.

**Pós-condições**

- Visão consolidada para seleção, mentoria e BI.

---

### UC25 – Classificar Status da Participante

**Descrição**

Atualiza status operacional: pré-inscrita, inscrita, selecionada, em assessoria, beneficiada (≥50% participação), certificada, contemplada (premiação/mentoria/capital semente), emancipada, descontinuada/desistente.

**Atores**

- **Motor de Automação**, **Gestor**, **Educador**.

**Pré-condições**

- Participante vinculada a edição/turma.
- Critérios configurados (UC9).

**Fluxo Principal**

- Sistema calcula status automaticamente com base em frequência, entregas e tempo de participação.
- Gestor pode ajustar manualmente exceções (ex.: desistente que atingiu 50% → beneficiada).
- Sistema registra data e responsável pela classificação.

**Pós-condições**

- Status refletido em relatórios e indicadores de impacto.

---

### UC26 – Registrar Motivo de Desistência

**Descrição**

Registra manualmente motivo de abandono (emprego CLT, falta de rede de apoio, violência, mudança de cidade, etc.) para indicadores qualitativos.

**Atores**

- **Gestor**, **Educador**.

**Pré-condições**

- Participante com interrupção de participação identificada.

**Fluxo Principal**

- Gestor acessa ficha da participante → **Registrar Desistência**.
- Seleciona motivo em lista padronizada e adiciona observações.
- Define se permanece elegível como beneficiada conforme progresso anterior.
- Sistema atualiza status (UC25) e alimenta relatórios qualitativos.

**Pós-condições**

- Desistência categorizada para análise de melhoria de programas.

---

### UC27 – Cadastrar Empreendimento Coletivo

**Descrição**

Permite vincular múltiplas participantes a um mesmo empreendimento (dupla/coletivo), registrando cada pessoa individualmente para impacto, mesmo com CNPJ ou nome comercial compartilhado.

**Atores**

- **Gestor**, **Educador**, **Empreendedora**.

**Pré-condições**

- Identificação de empreendimento coletivo durante assessoria.

**Fluxo Principal**

- Gestor cria empreendimento (nome, CNPJ opcional, segmento).
- Vincula duas ou mais participantes ao empreendimento.
- Sistema contabiliza pessoas (beneficiadas) e empreendimentos separadamente nos relatórios.

**Pós-condições**

- Empreendimento coletivo registrado com rastreabilidade individual.

---

### UC28 – Criar Módulo e Atividades do Programa

**Descrição**

Permite estruturar módulos (ex.: Encontros de Chegada, Finanças, Marketing) com atividades: videoaulas, PDFs, aulas presenciais, testes, respostas abertas, certificados e links ao vivo.

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Programa/edição configurados.

**Fluxo Principal**

- Usuário acessa **Metodologia → Módulos → Novo**.
- Define nome, ordem, tipo de atividades e componentes (vídeo YouTube, PDF, questionário, QR presencial).
- Configura pontuação/feedback imediato quando aplicável.
- Salva módulo reutilizável em edições futuras.

**Pós-condições**

- Metodologia educacional parametrizada no sistema.

---

### UC29 – Configurar Trilha e Formato de Consumo

**Descrição**

Define se conteúdo será consumido em trilha sequencial obrigatória ou de forma livre ("maratonar"), configurável antes do lançamento da edição.

**Atores**

- **Gestor de Programa**.

**Pré-condições**

- Módulos criados (UC28).

**Fluxo Principal**

- Gestor seleciona edição → **Formato de Trilha**.
- Escolhe: sequencial (bloqueio até conclusão) ou livre (acesso a todo conteúdo liberado).
- Define regras de avanço (ex.: 70–95% do vídeo para desbloquear próxima etapa).

**Pós-condições**

- Jornada de aprendizagem configurada conforme metodologia do programa.

---

### UC30 – Configurar Liberação Progressiva de Conteúdo

**Descrição**

Controla desbloqueio de aulas conforme progresso da turma ou cronograma, evitando avanço desordenado.

**Atores**

- **Gestor de Programa**, **Motor de Automação**.

**Pré-condições**

- Módulos e turma configurados.

**Fluxo Principal**

- Gestor define cadência (ex.: 3 envios/semana) e gatilhos (data fixa, conclusão de atividade anterior, 24h após encontro presencial).
- Motor de automação libera conteúdo e dispara notificação (UC45/UC48).

**Pós-condições**

- Conteúdo liberado progressivamente por turma.

---

### UC31 – Configurar Calendário e Datas por Turma

**Descrição**

Permite ajustar datas de encontros presenciais, aulas ao vivo (Google Meet/YouTube) e prazos de entrega por turma, mantendo metodologia central.

**Atores**

- **Gestor de Programa**, **Educador**.

**Pré-condições**

- Turma criada (UC11); módulos definidos.

**Fluxo Principal**

- Gestor acessa calendário da turma.
- Define datas/horários de cada atividade (presencial, ao vivo, entrega).
- URLs de aula ao vivo podem ser individualizadas por turma.
- Sistema sincroniza calendário com liberação de conteúdo e lembretes.

**Pós-condições**

- Cronograma local adaptado à realidade regional.

---

### UC32 – Adicionar Conteúdo Extra por Turma

**Descrição**

Permite incluir avisos, oficinas extras ou aprofundamentos regionais sem alterar metodologia global das demais turmas. Conteúdos extras não afetam barra de progresso obrigatória.

**Atores**

- **Gestor**, **Educador**.

**Pré-condições**

- Turma ativa.

**Fluxo Principal**

- Gestor adiciona atividade "extra/facultativa" no calendário da turma.
- Informa título, material/link e público (turma específica).
- Sistema notifica participantes da turma sem impactar certificação.

**Pós-condições**

- Conteúdo regional disponível apenas para turma destinada.

---

### UC33 – Consumir Conteúdo Educacional

**Descrição**

Permite à **Empreendedora** acessar videoaulas (YouTube), PDFs, guias práticos e e-books via painel do aluno, acessado por link WhatsApp.

**Atores**

- **Empreendedora**.
- **YouTube** (vídeos).

**Pré-condições**

- Autenticada (UC3); conteúdo liberado (UC30).

**Fluxo Principal**

- Empreendedora acessa painel via link WhatsApp.
- Visualiza trilha/módulos com indicador de progresso e conteúdos bloqueados/liberados.
- Abre conteúdo disponível (vídeo, PDF, atividade).
- Sistema registra acesso e progresso (UC34/UC35).

**Pós-condições**

- Consumo registrado para frequência e engajamento.

---

### UC34 – Registrar Progresso em Videoaula

**Descrição**

Rastreia visualização de vídeos (% assistido, tempo, ponto de parada) para marcos de progresso e certificação.

**Atores**

- **Empreendedora**, **YouTube** / player interno.

**Pré-condições**

- Videoaula liberada e acessada.

**Fluxo Principal**

- Empreendedora assiste vídeo no painel ou YouTube embed.
- Sistema registra percentual visualizado e timestamp.
- Ao atingir meta configurada (ex.: 70%), marca atividade como concluída.
- Se trilha sequencial, desbloqueia próxima etapa (UC29).

**Pós-condições**

- Progresso atualizado; dados disponíveis para ranking e BI.

---

### UC35 – Responder Atividade (Exercício / Questionário)

**Descrição**

Permite responder questões de múltipla escolha ou abertas, com feedback imediato e pontuação quando configurado (Empreende no Zap).

**Atores**

- **Empreendedora**.

**Pré-condições**

- Atividade liberada; autenticada (UC3).

**Fluxo Principal**

- Empreendedora abre atividade no painel.
- Responde questões e confirma envio.
- Sistema corrige (se automático), exibe feedback e registra nota/pontuação e data/hora.
- Atualiza progresso e ranking (UC51).

**Fluxos Alternativos**

- **Resposta incompleta**: sistema solicita conclusão antes de enviar.

**Pós-condições**

- Atividade registrada; gatilhos de comunicação acionados se configurado.

---

### UC36 – Registrar Presença via QR Code

**Descrição**

Permite registro automatizado de presença em encontros presenciais via QR code vinculado ao dia/evento/turma.

**Atores**

- **Empreendedora**, **Educador** (geração/exibição do QR).

**Pré-condições**

- Encontro presencial configurado no calendário (UC31).
- Empreendedora autenticada (UC3).

**Fluxo Principal**

- Educador exibe QR code do encontro (tela ou impresso).
- Empreendedora escaneia com celular.
- Sistema identifica participante e evento; registra presença com data/hora.
- Gestor visualiza frequência em tempo real (UC38).

**Fluxos Alternativos**

- **Sem celular/conectividade**: educador registra presença manual (UC37).

**Pós-condições**

- Presença contabilizada para frequência e status (UC25).

---

### UC37 – Registrar Presença Manualmente

**Descrição**

Permite ao **Educador/Gestor** registrar presença buscando participante por CPF/nome quando QR code não for viável.

**Atores**

- **Educador**, **Gestor**.

**Pré-condições**

- Encontro ativo; permissão de gestão de turma.

**Fluxo Principal**

- Educador acessa encontro → **Registrar Presença Manual**.
- Busca participante por CPF ou nome.
- Confirma presença.
- Sistema registra com indicação "manual" e responsável.

**Pós-condições**

- Frequência atualizada com rastreabilidade de registro manual.

---

### UC38 – Consultar Frequência da Participante

**Descrição**

Exibe percentual de participação, atividades concluídas e comparativo com metas da edição (50%, 75%, 100%).

**Atores**

- **Gestor**, **Educador**, **Empreendedora** (visão própria).

**Pré-condições**

- Registros de presença e atividades existentes.

**Fluxo Principal**

- Usuário acessa ficha da participante ou painel da turma.
- Sistema calcula e exibe frequência global e por módulo/atividade.
- Indica proximidade de critérios de beneficiamento/certificação.

**Pós-condições**

- Informação disponível para decisões operacionais e certificação.

---

### UC39 – Enviar Material ou Evidência de Atividade

**Descrição**

Permite envio de arquivos, fotos ou textos como entrega de tarefas (ex.: cartolina, planilha de fluxo de caixa), centralizando histórico no sistema.

**Atores**

- **Empreendedora**.

**Pré-condições**

- Atividade de entrega configurada e liberada.

**Fluxo Principal**

- Empreendedora acessa atividade no painel.
- Faz upload de arquivo(s) ou preenche campo de texto.
- Confirma envio.
- Sistema registra entrega com status "aguardando avaliação".

**Pós-condições**

- Entrega disponível para avaliação (UC40).

---

### UC40 – Avaliar Entrega e Fornecer Feedback

**Descrição**

Permite ao **Educador** aceitar, rejeitar ou solicitar melhorias em entregas, com comentários no sistema (substituindo retorno via WhatsApp).

**Atores**

- **Educador**, **Gestor**.

**Pré-condições**

- Entrega registrada (UC39).

**Fluxo Principal**

- Educador acessa fila de entregas pendentes.
- Visualiza material enviado.
- Seleciona: aprovar, solicitar correção ou rejeitar.
- Registra feedback textual.
- Sistema notifica empreendedora via WhatsApp/painel.
- Se correção solicitada, empreendedora reenvia (UC39).

**Pós-condições**

- Status da entrega atualizado; histórico de feedback preservado.

---

### UC41 – Enviar Dados Financeiros Mensais

**Descrição**

Permite à **Empreendedora** informar mensalmente renda, faturamento, investimento, poupança e fluxo de caixa (entradas, saídas, retirada de salário).

**Atores**

- **Empreendedora**, **Educador** (cadastro assistido).

**Pré-condições**

- Participante em fase de coleta financeira (momento definido pelo gestor no fluxo).

**Fluxo Principal**

- Sistema libera formulário financeiro mensal no painel ou via link WhatsApp.
- Empreendedora preenche valores.
- Sistema valida consistência lógica (ex.: renda ≤ faturamento quando aplicável).
- Registra envio com status "aguardando validação" (UC42).

**Fluxos Alternativos**

- **Dados inconsistentes**: sistema exibe alerta e solicita correção.

**Pós-condições**

- Dados financeiros registrados para evolução e BI.

---

### UC42 – Validar Dados Financeiros

**Descrição**

Permite ao **Educador** verificar, aprovar ou devolver dados financeiros informados pela empreendedora.

**Atores**

- **Educador**, **Gestor**.

**Pré-condições**

- Dados enviados (UC41).

**Fluxo Principal**

- Educador acessa **Validação Financeira** da turma.
- Analisa valores e comparativo com meses anteriores.
- Aprova ou devolve para correção com observações.
- Sistema notifica empreendedora e consolida dados aprovados para relatórios.

**Pós-condições**

- Dados validados incorporados aos indicadores de impacto.

---

### UC43 – Preencher Formulário de Indicadores (Baseline / Endline)

**Descrição**

Coleta indicadores qualitativos e quantitativos em momentos configuráveis (início, meio, fim ou 30 dias pós-programa), por empreendedora ou equipe.

**Atores**

- **Empreendedora**, **Educador**, **Gestor**.

**Pré-condições**

- Formulário configurado para edição/programa.
- Período de aplicação ativo.

**Fluxo Principal**

- Sistema disponibiliza formulário no painel ou via link.
- Respondente preenche perguntas padronizadas (renda, equipamentos, formalização, percepção de mudança).
- Sistema associa resposta ao momento (baseline/endline) e participante.
- Dados alimentam relatórios qualitativos (UC56).

**Pós-condições**

- Indicadores registrados para mensuração de impacto.

---

### UC44 – Responder Pesquisa de Avaliação (NPS / Satisfação)

**Descrição**

Coleta avaliação de satisfação sobre curso, aulas, formato e oficinas (escala 0–5 ou NPS).

**Atores**

- **Empreendedora**.

**Pré-condições**

- Pesquisa configurada e liberada (ex.: após módulo ou fim do programa).

**Fluxo Principal**

- Empreendedora recebe link da pesquisa.
- Responde questões de avaliação.
- Sistema consolida resultados por turma, edição e programa.

**Pós-condições**

- Dados de satisfação disponíveis em relatórios e dashboard.

---

### UC45 – Disparar Mensagem Individual via WhatsApp

**Descrição**

Envia mensagem personalizada a uma empreendedora (conteúdo, lembrete, material, link autenticado).

**Atores**

- **Gestor**, **Educador**, **Motor de Automação**.
- **WhatsApp (Meta Business API)**.

**Pré-condições**

- Template ou mensagem aprovada conforme categorias Meta (marketing/utilidade/sistema).
- Consentimento/opt-in da destinatária quando exigido.

**Fluxo Principal**

- Usuário seleciona participante(s) ou automação é acionada.
- Sistema monta mensagem com link personalizado (UC49).
- Envia via API WhatsApp.
- Registra data, conteúdo e status de entrega.

**Exceções**

- **EC1**: Falha Meta API — retry; registrar falha.

---

### UC46 – Disparar Mensagem em Grupo via WhatsApp

**Descrição**

Envia comunicação a grupo/turma (avisos, links de aula ao vivo, materiais). Grupos WhatsApp permanecem para interação humana; disparos automatizados via sistema.

**Atores**

- **Gestor**, **Motor de Automação**, **WhatsApp**.

**Pré-condições**

- Turma definida; templates configurados.

**Fluxo Principal**

- Gestor seleciona turma e template/mensagem.
- Sistema envia disparos individuais (API) ou orienta postagem em grupo institucional do Consulado.
- Registra histórico de comunicação.

**Pós-condições**

- Turma comunicada; propriedade do grupo permanece institucional.

---

### UC47 – Programar Mensagens Automáticas

**Descrição**

Agenda mensagens futuras (lembretes de aula, prazos de exercícios, abertura de inscrições).

**Atores**

- **Gestor**, **Motor de Automação**.

**Pré-condições**

- Edição/turma configurada; templates aprovados.

**Fluxo Principal**

- Gestor acessa **Comunicação → Agendar Mensagem**.
- Define público, template, data/hora e gatilho (fixo ou relativo a evento).
- Sistema executa envio no momento programado (UC45/UC46).

**Pós-condições**

- Mensagens agendadas na fila de automação.

---

### UC48 – Enviar Lembrete por Atividade Não Concluída

**Descrição**

Dispara lembrete automático (ex.: após 48h) quando participante não acessou conteúdo ou não entregou tarefa.

**Atores**

- **Motor de Automação**, **WhatsApp**.

**Pré-condições**

- Gatilho configurado na jornada do programa.
- Atividade pendente identificada.

**Fluxo Principal**

- Motor verifica atividades pendentes por participante.
- Após prazo configurado, envia lembrete via WhatsApp com link direto à atividade.
- Registra tentativa; evita spam com limite de reenvios.

**Pós-condições**

- Participante reengajada; tentativa registrada.

---

### UC49 – Enviar Link Personalizado com Autenticação Embutida

**Descrição**

Gera URLs com token de autenticação da empreendedora, eliminando login adicional ao clicar em links nas mensagens WhatsApp pagas.

**Atores**

- **Motor de Automação**, **Empreendedora**.

**Pré-condições**

- Participante identificada por telefone/ID.

**Fluxo Principal**

- Ao compor mensagem, sistema gera link único (ex.: painel/atividade/certificado).
- Empreendedora clica e é autenticada automaticamente (UC3).
- Sistema registra clique e destino.

**Pós-condições**

- Acesso frictionless ao conteúdo; melhor aproveitamento da mensagem.

---

### UC50 – Emitir Certificado Automaticamente

**Descrição**

Gera e envia certificado via WhatsApp quando participante atinge critérios configurados (ex.: 75% presença ou 100% conclusão).

**Atores**

- **Motor de Automação**, **Empreendedora**, **WhatsApp**.

**Pré-condições**

- Critérios de certificação atingidos (UC9, UC38).
- Template de certificado configurado.

**Fluxo Principal**

- Sistema detecta elegibilidade para certificação.
- Gera PDF certificado com dados da participante e programa.
- Envia via WhatsApp automaticamente.
- Atualiza status para "certificada" (UC25).

**Pós-condições**

- Certificado entregue; registro de emissão no histórico.

---

### UC51 – Consultar Ranking e Engajamento

**Descrição**

Exibe ranking de participantes por pontuação, entregas no prazo e engajamento — utilizado em programas como Empreende no Zap para premiação.

**Atores**

- **Gestor**, **Educador**, **Empreendedora** (posição própria, se configurado).

**Pré-condições**

- Atividades pontuadas registradas.

**Fluxo Principal**

- Gestor acessa **Ranking** da turma/edição.
- Sistema ordena por critérios configurados (notas, prazos, conclusão).
- Exportação disponível para decisão de premiação (UC52).

**Pós-condições**

- Ranking disponível para seleção de contempladas.

---

### UC52 – Selecionar Contempladas (Premiação / Mentoria)

**Descrição**

Define participantes contempladas com premiação financeira, produtos ou mentoria, com base em ranking, regulamento e análise manual.

**Atores**

- **Gestor de Programa**.

**Pré-condições**

- Programa concluído ou fase de premiação ativa.
- Ranking/indicadores disponíveis.

**Fluxo Principal**

- Gestor analisa ranking e critérios do regulamento (ex.: top 50, carência 3 anos).
- Seleciona contempladas e registra tipo de benefício.
- Sistema atualiza status "contemplada" (UC25).
- Dispara comunicação às selecionadas.

**Pós-condições**

- Contemplação registrada; evita premiações duplicadas (UC24).

---

### UC53 – Analisar Elegibilidade para Capital Semente

**Descrição**

Suporta análise estruturada para concessão de capital semente: constância nas entregas, fluxo de caixa, principal fonte de renda, necessidade de equipamentos.

**Atores**

- **Gestor**, **Educador**.

**Pré-condições**

- Participante beneficiada/emancipada com histórico financeiro e entregas.

**Fluxo Principal**

- Gestor acessa **Análise Capital Semente** na ficha da participante.
- Sistema consolida entregas, fluxo de caixa, frequência e observações.
- Gestor registra parecer e decisão (contemplada ou não).
- Sistema vincula valor/tipo de investimento quando aprovado.

**Pós-condições**

- Decisão de capital semente documentada e rastreável.

---

### UC54 – Consultar Dashboard de Impacto

**Descrição**

Painel visual em tempo real com métricas: inscritas, selecionadas, iniciaram, beneficiadas (50%), certificadas (100%), contempladas, evolução de renda e perfil socioeconômico.

**Atores**

- **Administrador**, **Gestor**, **Parceiro** (visão restrita).

**Pré-condições**

- Dados operacionais registrados no sistema.

**Fluxo Principal**

- Usuário acessa **Dashboard**.
- Filtra por programa, edição, unidade, turma e período.
- Sistema exibe gráficos e KPIs atualizados dinamicamente.

**Pós-condições**

- Visão consolidada para gestão e prestação de contas a financiadores.

---

### UC55 – Gerar Relatórios Quantitativos

**Descrição**

Gera relatórios numéricos: frequência, participação, desempenho, evolução de renda/faturamento/investimento/poupança (anual ou por ciclo).

**Atores**

- **Administrador**, **Gestor**.

**Pré-condições**

- Permissão de relatórios; dados validados.

**Fluxo Principal**

- Usuário seleciona tipo de relatório e filtros.
- Sistema agrega dados e apresenta tabelas/gráficos.
- Opção de exportação (UC57).

**Pós-condições**

- Relatório quantitativo disponível.

---

### UC56 – Gerar Relatórios Qualitativos

**Descrição**

Relatórios de perfil socioeconômico, indicadores baseline/endline, motivos de desistência, NPS e percepção de mudança.

**Atores**

- **Administrador**, **Gestor**.

**Pré-condições**

- Formulários qualitativos preenchidos (UC43, UC44, UC26).

**Fluxo Principal**

- Usuário seleciona relatório qualitativo e escopo.
- Sistema consolida respostas e categorias.
- Apresenta análise por beneficiária, turma, programa ou edição.

**Pós-condições**

- Relatório qualitativo disponível para melhoria de programas.

---

### UC57 – Exportar Relatórios (Excel / PDF)

**Descrição**

Exporta dashboards e relatórios para Excel ou PDF, mantendo compatibilidade com análises externas (ex.: evolução de renda).

**Atores**

- **Administrador**, **Gestor**.

**Pré-condições**

- Relatório gerado (UC54–UC56).

**Fluxo Principal**

- Usuário seleciona **Exportar** e formato desejado.
- Sistema gera arquivo e disponibiliza download.

**Pós-condições**

- Arquivo exportado para uso externo ou prestação de contas.

---

### UC58 – Importar Dados Históricos

**Descrição**

Importa bases históricas (até 5 anos — Empreende Mulher, Empreende no Zap e programas menores) para base unificada.

**Atores**

- **Administrador**.

**Pré-condições**

- Dump/CSV do sistema legado ou planilhas validadas.

**Fluxo Principal**

- Administrador executa rotina de importação com mapeamento de campos.
- Sistema valida integridade (CPF, duplicidades).
- Registra origem "legado" nos registros importados.

**Pós-condições**

- Histórico disponível para seleção, BI e continuidade de cadastro (UC22).

---

### UC59 – Migrar Dados do Sistema Legado

**Descrição**

Processo técnico de extração estruturada do banco/sistema de 2015 e ferramentas paralelas (planilhas) para o novo modelo de dados.

**Atores**

- **Administrador** (operacional), equipe técnica (execução).

**Pré-condições**

- Estrutura do banco legado mapeada; ambiente de staging disponível.

**Fluxo Principal**

- Executar scripts de ETL a partir de dump legado.
- Transformar entidades (programas, edições, participantes, status).
- Validar amostra com equipe do Consulado.
- Promover dados para produção.

**Pós-condições**

- Dados legados migrados; operação unificada no novo sistema.

---

### UC60 – Consultar e Solicitar Certificado (Autoatendimento)

**Descrição**

Canal opcional para participante recuperar certificado já emitido, reduzindo demanda à equipe (baixa frequência atual).

**Atores**

- **Empreendedora**, **Chat IA** (opcional).

**Pré-condições**

- Certificado previamente emitido (UC50).

**Fluxo Principal**

- Empreendedora acessa link de autoatendimento autenticado (UC3).
- Solicita reenvio de certificado.
- Sistema localiza emissão e reenvia via WhatsApp ou download.

**Pós-condições**

- Certificado reencaminhado sem intervenção manual.

---

### UC61 – Utilizar Chat de Dúvidas (IA — opcional/futuro)

**Descrição**

Chat de IA treinado em conteúdos e dados internos para responder dúvidas frequentes (acesso, certificado, atividades), sem consultar internet externa.

**Atores**

- **Empreendedora**, **Chat IA**.

**Pré-condições**

- Funcionalidade habilitada; base de conhecimento alimentada.

**Fluxo Principal**

- Empreendedora abre chat no painel ou via link.
- Formula pergunta.
- IA responde com base em FAQ e conteúdos do programa.
- Casos complexos são escalados para educador humano.

**Pós-condições**

- Dúvida respondida ou encaminhada; interação registrada.

---

### UC62 – Consultar Consumo de Mensagens WhatsApp

**Descrição**

Monitora volume e custo estimado de disparos WhatsApp (marketing, utilidade, autenticação) por programa/edição/mês, apoiando planejamento orçamentário pós-substituição da plataforma Lis.

**Atores**

- **Administrador**, **Gestor de Programa**.

**Pré-condições**

- Integração Meta Business API ativa.

**Fluxo Principal**

- Usuário acessa **Comunicação → Consumo WhatsApp**.
- Filtra por período e programa.
- Sistema exibe quantidade por categoria e custo estimado.
- Permite projeção mensal de disparos.

**Pós-condições**

- Visibilidade de custos para planejamento financeiro.

---

## Matriz Resumo: Atores × Casos de Uso Principais

| Caso de Uso                | Empreendedora | Gestor/Educador | Administrador | Sistemas Externos |
| -------------------------- | :-----------: | :-------------: | :-----------: | :---------------: |
| UC3 Login WhatsApp         |       ●       |                 |               |     WhatsApp      |
| UC14–15 Inscrição          |       ●       |                 |       ○       |                   |
| UC18 Seleção               |               |        ●        |       ○       |                   |
| UC28–32 Conteúdo           |               |        ●        |       ○       |      YouTube      |
| UC33–35 Consumo/Atividades |       ●       |                 |               |      YouTube      |
| UC36–37 Presença           |       ●       |        ●        |               |                   |
| UC41–42 Dados Financeiros  |       ●       |        ●        |               |                   |
| UC45–48 Comunicação        |       ○       |        ●        |       ○       |     WhatsApp      |
| UC50 Certificado           |       ●       |        ○        |               |     WhatsApp      |
| UC54–57 Relatórios/BI      |               |        ●        |       ●       |                   |
| UC58–59 Migração           |               |                 |       ●       |                   |

**Legenda:** ● = ator principal | ○ = ator secundário ou opcional

---

## Observações de Escopo e Priorização (MVP)

Com base nas reuniões de jun/2026, os casos de uso abaixo foram reforçados como **essenciais para o MVP (4 meses)**:

- UC3, UC6–UC12, UC14–UC19, UC23–UC25, UC28–UC31, UC33–UC38, UC41–UC42, UC45–UC48, UC50, UC54–UC55

Funcionalidades identificadas como **importantes, porém secundárias na fase inicial**:

- UC20 (Mini CRM), UC51–UC53, UC60–UC61, UC62

Decisões consolidadas nas reuniões incorporadas neste documento:

- Login via WhatsApp (sem e-mail/senha para empreendedoras)
- Inscrição em etapas com indicador visual de progresso (não gamificação complexa)
- Pré-cadastro + LGPD antes da coleta completa (mini CRM)
- Uma edição aberta para inscrição por vez; URLs diretas por programa
- Alocação manual em turmas após seleção
- WhatsApp como canal principal de comunicação; sistema como repositório central
- YouTube para videoaulas; liberação progressiva de conteúdo
- Critérios de beneficiamento/certificação configuráveis por edição
- Substituição da plataforma Lis; orçamento realocado para API WhatsApp

---

_Documento gerado em jun/2026. Status: em discussão — sujeito a refinamento conforme validação jurídica (LGPD), definição de campos padronizados e priorização MoSCoW do MVP._
