**Casos de Uso — Sistema de Gestão de Programas Sociais (Consulado da Mulher) — v1**

Documento derivado do escopo original do cliente, das reuniões de levantamento (abr./jun. 2026), do **contrato de licenciamento EWTI × Consulado da Mulher (08.05.2026)** e do modelo de referência. Versão 1 incorpora as observações de revisão e alinhamento à arquitetura **Strapi CMS + App Gestor**.

---

## Atores

| Ator | Descrição |
| ---- | --------- |
| **Empreendedora (Beneficiada)** | Mulher empreendedora em situação de vulnerabilidade social; participante dos programas. Acessa a Plataforma Educacional via **WhatsApp ou e-mail**, consome conteúdos, envia atividades e dados financeiros. |
| **Administrador (Strapi CMS)** | Usuário do backoffice Strapi. Gerencia criação de conteúdos, modelagem de programas, módulos educacionais, associação de módulos aos programas, organizações parceiras/patrocinadoras, cadastro de membros gestores e associação de membros a programas e turmas. |
| **Gestor de Turma (App Gestor)** | Membro da equipe que opera turmas no **App Gestor**: seleção operacional, alocação, acompanhamento, comunicação, presença, validação de entregas, gestão de negócios e interação com empreendedoras. |
| **Educador / Assessor (App Gestor)** | Profissional de campo no App Gestor. Valida entregas, registra presença, preenche indicadores e conduz atividades — em programas presenciais, pode realizar atividades **fora da sequência** padrão. |
| **Lead (Pré-inscrita)** | Pessoa que iniciou, mas ainda não concluiu, o processo de inscrição; objeto do mini CRM. |
| **Organização (Patrocinador / Parceiro)** | Pessoa jurídica cadastrada no sistema (CNPJ), associável a uma edição como patrocinador ou parceiro institucional. |
| **WhatsApp (Meta Business API)** | Ator secundário para envio de mensagens, links, **vídeos** e notificações. |
| **YouTube** | Ator secundário para videoaulas gravadas e **transmissões ao vivo**. |
| **Motor de Automação** | Componente interno que executa gatilhos (liberação de conteúdo, lembretes, certificação automática). |

### Plataformas do Sistema (Contrato)

Conforme contrato de licenciamento (mai./2026), o **Sistema Consulado da Mulher** compreende:

1. **Plataforma Educacional (Cliente)** — portal da empreendedora.
2. **Plataforma de Gestão de Usuários e Conteúdos (Strapi CMS)** — modelagem e administração.
3. **App Gestor** — gestão, acompanhamento e interação com turmas.
4. **Painéis de Acompanhamento, Controles e Relatórios** — dashboards e indicadores.

Stack contratual: Next.js, Node.js, Express, Prisma, MySQL; hospedagem AWS.

---

## Casos de Uso

Organização do fluxo operacional em quatro fases: **Pré-inscrição → Inscrição → Seleção → Aprovação e Aplicação do Programa**, além dos módulos de configuração e plataformas.

### Plataformas, Acesso e Configuração (Strapi CMS)

UC1 — Cadastrar Membro Gestor (Strapi)

UC2 — Login Administrador (Strapi CMS)

UC3 — Login Gestor (App Gestor)

UC4 — Login da Empreendedora (WhatsApp ou E-mail)

UC5 — Gerenciar Roles e Permissões (Strapi)

UC6 — Configurar Autenticação e Segurança (2FA, expiração de senha)

UC7 — Cadastrar Programa

UC8 — Modelar Programa e Associar Módulos

UC9 — Criar e Configurar Edição de Programa

UC10 — Cadastrar Organização

UC11 — Associar Organização à Edição (Patrocinador / Parceiro)

UC12 — Configurar Regulamento e Critérios de Seleção

UC13 — Configurar Critérios de Beneficiamento e Certificação por Edição

UC14 — Configurar Critérios de Premiação por Edição

UC15 — Criar Módulo Educacional

UC16 — Criar e Gerenciar Turma

UC17 — Alocar Empreendedora em Turma

UC18 — Transferir Empreendedora entre Turmas

### Fase 1 — Pré-inscrição

UC19 — Realizar Pré-Cadastro (Captura Inicial de Lead)

UC20 — Aceitar Termos LGPD, Comunicação e Regulamento

### Fase 2 — Inscrição

UC21 — Realizar Inscrição Completa

UC22 — Reutilizar Cadastro de Participante Recorrente

### Fase 3 — Seleção

UC23 — Validar Elegibilidade da Inscrição (Automático)

UC24 — Selecionar Participantes para o Programa

UC25 — Comunicar Resultado da Seleção

UC26 — Gerenciar Leads com Inscrição Incompleta (Mini CRM)

### Fase 4 — Aprovação e Aplicação do Programa

UC27 — Cadastrar e Atualizar Dados da Empreendedora

UC28 — Consultar Histórico de Participação

UC29 — Classificar Status da Participante

UC30 — Registrar Motivo de Desistência

UC31 — Gerenciar Negócio e Associar Empreendedoras

UC32 — Mover Empreendedora entre Negócios

UC33 — Configurar Liberação Progressiva de Conteúdo

UC34 — Configurar Calendário e Atividades por Turma

UC35 — Adicionar Conteúdo Extra por Turma

UC36 — Consumir Conteúdo Educacional

UC37 — Registrar Progresso em Videoaula

UC38 — Assistir Aula ao Vivo (YouTube)

UC39 — Responder Atividade (Exercício / Questionário)

UC40 — Registrar Presença via QR Code

UC41 — Registrar Presença Manualmente (Gestor/Educador)

UC42 — Consultar Frequência da Participante

UC43 — Enviar Material ou Evidência de Atividade

UC44 — Avaliar Entrega e Fornecer Feedback

UC45 — Enviar Dados Financeiros Mensais

UC46 — Validar Dados Financeiros (Educador)

UC47 — Preencher Formulário de Indicadores (Baseline / Endline)

UC48 — Responder Pesquisa de Avaliação (NPS / Satisfação)

UC49 — Disparar Mensagem Individual via WhatsApp

UC50 — Disparar Mensagem em Grupo via WhatsApp

UC51 — Enviar Vídeo ou Conteúdo via WhatsApp

UC52 — Programar Mensagens Automáticas

UC53 — Enviar Lembrete por Atividade Não Concluída

UC54 — Enviar Link Personalizado com Autenticação Embutida

UC55 — Emitir Certificado Automaticamente

UC56 — Consultar Ranking e Engajamento

UC57 — Selecionar Contempladas (Premiação / Mentoria)

UC58 — Analisar Elegibilidade para Capital Semente

UC59 — Consultar Dashboard de Impacto

UC60 — Gerar Relatórios Quantitativos

UC61 — Gerar Relatórios Qualitativos

UC62 — Migrar Dados do Sistema Legado

### Funcionalidades Complementares (Contrato / Evolução)

UC63 — Consultar e Solicitar Certificado (Autoatendimento)

UC64 — Utilizar Chat de Dúvidas (IA)

UC65 — Consultar Consumo de Mensagens WhatsApp

---

## Detalhamento dos Casos de Uso

### UC1 – Cadastrar Membro Gestor (Strapi)

**Descrição**

Permite que o **Administrador (Strapi CMS)** cadastre membros gestores da equipe utilizando o **sistema nativo de usuários do Strapi**, atribuindo role e vinculando a programas e turmas.

**Atores**

* **Administrador (Strapi CMS)**: responsável pelo cadastro.
* **Gestor de Turma / Educador**: usuário cadastrado.

**Pré-condições**

* Administrador autenticado no Strapi CMS.
* Roles configuradas no Strapi (UC5).

**Fluxo Principal**

* O **Administrador** acessa **Settings → Administration Panel → Users** no Strapi.
* Seleciona **Invite user** ou **Create new user**.
* Informa nome, e-mail, role (Administrador, Gestor ou Educador) e status.
* Associa programas e turmas permitidos.
* O Strapi envia e-mail de convite para definição de senha.
* O membro define senha e passa a acessar Strapi CMS e/ou App Gestor (UC3) conforme role.

**Fluxos Alternativos**

* **E-mail já cadastrado**: Strapi informa duplicidade.
* **Convite pendente**: administrador reenvia convite pelo painel Strapi.

**Pós-condições**

* Membro gestor cadastrado no Strapi, apto a operar App Gestor.

**Exceções**

* **EC1**: Falha no envio de e-mail — reenvio manual pelo Strapi.

---

### UC2 – Login Administrador (Strapi CMS)

**Descrição**

Acesso ao backoffice **Strapi CMS** para modelagem de programas, módulos, organizações, conteúdos e gestão de usuários.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Conta Strapi ativa com role Administrador.
* Navegador compatível; conexão à internet.

**Fluxo Principal**

* Usuário acessa URL do Strapi Admin (`/admin`).
* Informa e-mail e senha na tela nativa de login.
* Se 2FA habilitado (UC6), informa código de verificação.
* Strapi valida credenciais e abre painel administrativo.

**Fluxos Alternativos**

* **Credenciais inválidas**: mensagem nativa do Strapi; retry ou recuperação de senha.
* **Senha expirada**: troca obrigatória (UC6).

**Pós-condições**

* Sessão autenticada no Strapi CMS.

**Exceções**

* **EC1**: Strapi indisponível — tentar mais tarde.

---

### UC3 – Login Gestor (App Gestor)

**Descrição**

Acesso ao **App Gestor** para operação de turmas: acompanhamento, comunicação, presença, validação e interação com empreendedoras.

**Atores**

* **Gestor de Turma**, **Educador / Assessor**.

**Pré-condições**

* Membro cadastrado no Strapi (UC1) com role Gestor ou Educador.

**Fluxo Principal**

* Gestor acessa URL do App Gestor.
* Informa e-mail e senha (conta vinculada ao Strapi).
* Se 2FA habilitado, informa código.
* Sistema valida credenciais e role.
* Abre painel com turmas e programas associados.

**Fluxos Alternativos**

* **Sem turmas associadas**: exibe mensagem orientando contato com administrador.

**Pós-condições**

* Gestor autenticado no App Gestor.

**Exceções**

* **EC1**: Servidor indisponível.

---

### UC4 – Login da Empreendedora (WhatsApp ou E-mail)

**Descrição**

Permite que a **Empreendedora** acesse a Plataforma Educacional por **WhatsApp** (link/token no telefone) ou por **e-mail e senha**.

**Atores**

* **Empreendedora (Beneficiada)**.
* **WhatsApp (Meta Business API)** — ator secundário.

**Pré-condições**

* Cadastro ou link vinculado ao telefone e/ou e-mail.

**Fluxo Principal**

* **Via WhatsApp**: recebe link personalizado; sistema identifica telefone; cria sessão e abre painel.
* **Via E-mail**: acessa URL da plataforma; informa e-mail e senha; sistema valida e abre painel.

**Fluxos Alternativos**

* **Não cadastrada**: direciona a UC19 ou UC21.
* **Link expirado**: novo envio via WhatsApp ou recuperação por e-mail.
* **Primeiro acesso pós-cadastro manual**: solicita aceites pendentes (UC20).

**Pós-condições**

* Empreendedora autenticada na Plataforma Educacional.

**Exceções**

* **EC1**: Falha API WhatsApp — fallback por e-mail quando disponível.

---

### UC5 – Gerenciar Roles e Permissões (Strapi)

**Descrição**

Configura roles nativas do **Strapi** e permissões por entidade, em conformidade com LGPD.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Administrador autenticado no Strapi.

**Fluxo Principal**

* Acessa **Settings → Administration Panel → Roles**.
* Edita permissões CRUD por entidade para cada role.
* Restringe escopo (programas/edições/turmas).
* Salva configuração.

**Pós-condições**

* Roles alinhadas às funções operacionais do Consulado.

---

### UC6 – Configurar Autenticação e Segurança

**Descrição**

Configura 2FA, expiração e complexidade de senhas, conforme contrato (cl. 6.2) e Anexo I.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Permissão de configuração global.

**Fluxo Principal**

* Define política de expiração, complexidade, histórico de senhas e 2FA.
* Sistema aplica em próximos logins (Strapi e App Gestor).

**Pós-condições**

* Políticas de segurança ativas.

---

### UC7 – Cadastrar Programa

**Descrição**

Cadastra um programa social no Strapi, com slug, URL direta, duração e formato (**online sequencial** ou **presencial**).

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Autenticado no Strapi com permissão de gestão de programas.

**Fluxo Principal**

* Acessa **Programas → Create**.
* Informa nome, slug, descrição, duração, formato (online sequencial / presencial / híbrido).
* Define pilares: educação empreendedora, mentoria, capital semente.
* Salva programa.

**Pós-condições**

* Programa disponível para associação de módulos (UC8) e edições (UC9).

**Exceções**

* **EC1**: Slug duplicado — solicita alteração.

---

### UC8 – Modelar Programa e Associar Módulos

**Descrição**

Um **programa** é um conjunto de **módulos** (não existe conceito de trilha). Associa módulos ao programa e define ordem sugerida. Em programas **presenciais**, o educador/assessor determina qual atividade será realizada, podendo conduzir **fora da sequência** definida.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Programa cadastrado (UC7); módulos criados (UC15).

**Fluxo Principal**

* Seleciona programa → **Módulos associados**.
* Adiciona módulos na ordem sugerida.
* Define formato: online sequencial (liberação progressiva) ou presencial (flexível pelo educador).
* Salva modelagem.

**Pós-condições**

* Estrutura educacional do programa definida.

---

### UC9 – Criar e Configurar Edição de Programa

**Descrição**

Cria edição (ex.: 2026.1) com ano de referência, regulamento, vagas e período de inscrição. Apenas **uma edição aberta para inscrição** por vez.

**Atores**

* **Administrador (Strapi CMS)**, **Gestor de Turma** (consulta).

**Pré-condições**

* Programa modelado (UC8); regulamento aprovado pelo jurídico.

**Fluxo Principal**

* Cria nova edição vinculada ao programa.
* Informa identificador, datas de inscrição, vagas, status.
* Anexa regulamento da edição.
* Valida unicidade de edição aberta.
* Publica URL de inscrição direta.

**Pós-condições**

* Edição apta às fases de inscrição e seleção.

---

### UC10 – Cadastrar Organização

**Descrição**

Cadastra **organização** (pessoa jurídica): patrocinadores, parceiros institucionais, unidades executoras.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Permissão de cadastro institucional.

**Fluxo Principal**

* Acessa **Organizações → Create**.
* Informa razão social, CNPJ, tipo, localização e responsável.
* Registra papel no tratamento de dados (controlador/operador) quando aplicável.
* Salva organização.

**Pós-condições**

* Organização disponível para associação a edições (UC11).

---

### UC11 – Associar Organização à Edição (Patrocinador / Parceiro)

**Descrição**

Vincula organização a uma **edição** como **patrocinador** ou **parceiro** executor.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Organização (UC10) e edição (UC9) existentes.

**Fluxo Principal**

* Seleciona edição → **Organizações vinculadas**.
* Adiciona organização e define papel (patrocinador / parceiro executor).
* Salva vínculo.

**Pós-condições**

* Organização associada à edição com papel definido.

---

### UC12 – Configurar Regulamento e Critérios de Seleção

**Descrição**

Define critérios automáticos e manuais de elegibilidade (idade, renda, região, tempo de empreendimento, carência de premiação).

**Atores**

* **Administrador (Strapi CMS)**, **Gestor de Turma**.

**Pré-condições**

* Edição criada (UC9).

**Fluxo Principal**

* Configura travas automáticas e critérios de desempate.
* Indica restrições geográficas (rígidas ou flexíveis).
* Persiste regras para UC23 e UC24.

**Fluxos Alternativos**

* **Flexibilidade operacional**: critério como "alerta" em vez de bloqueio.

**Pós-condições**

* Critérios disponíveis para validação e seleção.

---

### UC13 – Configurar Critérios de Beneficiamento e Certificação por Edição

**Descrição**

Parametriza percentuais: beneficiada (ex.: 50%), certificada (ex.: 75%), conclusão integral (100%).

**Atores**

* **Administrador (Strapi CMS)**, **Gestor de Turma**.

**Pré-condições**

* Edição ativa com programação definida.

**Fluxo Principal**

* Define percentuais e tipos de atividade que contam.
* Define aplicação automática vs. validação manual de exceções.
* Sistema usa regras em UC29 e UC55.

**Pós-condições**

* Regras de beneficiamento e certificação parametrizadas.

---

### UC14 – Configurar Critérios de Premiação por Edição

**Descrição**

Define critérios de elegibilidade a **premiação e mentoria**: pontuação mínima, entregas no prazo, carência (ex.: 3 anos), top N, desempate.

**Atores**

* **Administrador (Strapi CMS)**, **Gestor de Turma**.

**Pré-condições**

* Edição configurada; regulamento de premiação aprovado.

**Fluxo Principal**

* Acessa edição → **Critérios de Premiação**.
* Define pesos (engajamento, notas, prazos, indicadores).
* Define número de contempladas e regras de carência.
* Sistema aplica em UC56 e UC57.

**Pós-condições**

* Critérios de premiação parametrizados.

---

### UC15 – Criar Módulo Educacional

**Descrição**

Cria **módulo** de **tipo temático único**, composto por atividades. Tipos: empreendedorismo, finanças, precificação, marketing, gestão de pessoas, formalização de empresas, sustentabilidade.

**Atores**

* **Administrador (Strapi CMS)**.

**Pré-condições**

* Autenticado no Strapi.

**Fluxo Principal**

* Acessa **Módulos → Create**.
* Seleciona **tipo temático** (único por módulo).
* Adiciona atividades: videoaula (YouTube), PDF, presencial, aula ao vivo (YouTube), questionário, entrega, QR presencial.
* Configura feedback/pontuação quando aplicável.
* Salva módulo reutilizável.

**Pós-condições**

* Módulo disponível para associação a programas (UC8).

---

### UC16 – Criar e Gerenciar Turma

**Descrição**

Cria turmas vinculadas a edição: gestor responsável, vagas, calendário local.

**Atores**

* **Gestor de Turma (App Gestor)**, **Administrador (Strapi CMS)**.

**Pré-condições**

* Edição configurada; programação associada.

**Fluxo Principal**

* Cria turma com nome, região, gestor, vagas, datas.
* Associa participantes após seleção (UC17).

**Pós-condições**

* Turma pronta para aplicação do programa (Fase 4).

---

### UC17 – Alocar Empreendedora em Turma

**Descrição**

Aloca manualmente participantes **selecionadas** em turmas, sem exigir escolha de turma na inscrição.

**Atores**

* **Gestor de Turma (App Gestor)**.

**Pré-condições**

* Status "selecionada" (UC24); turma com vagas.

**Fluxo Principal**

* Filtra selecionadas por região/perfil.
* Aloca em turma e confirma.
* Sistema dispara boas-vindas (UC49).

**Pós-condições**

* Participante vinculada à turma.

---

### UC18 – Transferir Empreendedora entre Turmas

**Descrição**

Move participante entre turmas da mesma edição, preservando histórico.

**Atores**

* **Gestor de Turma (App Gestor)**.

**Pré-condições**

* Participante ativa; turmas compatíveis.

**Fluxo Principal**

* Seleciona participante → **Transferir turma**.
* Escolhe destino e registra motivo.
* Notifica gestores envolvidos.

**Pós-condições**

* Vínculo atualizado; histórico preservado.

---

### UC19 – Realizar Pré-Cadastro (Captura Inicial de Lead)

**Descrição**

Primeira etapa (mini CRM): captura nome, telefone, e-mail, aceite LGPD e **checkbox de aprovação de comunicação** antes do formulário completo.

**Atores**

* **Lead (Pré-inscrita)**.

**Pré-condições**

* Edição com inscrições abertas; URL acessível.

**Fluxo Principal**

* Acessa link da edição/programa.
* Visualiza indicador de progresso (etapa 1 de N).
* Aceita termo LGPD (obrigatório).
* Marca **checkbox de autorização para comunicação**.
* Informa nome, telefone e e-mail.
* Sistema registra lead "pré-cadastro concluído".
* Direciona para inscrição completa (UC21).

**Fluxos Alternativos**

* **LGPD não aceito**: bloqueia continuidade.
* **Comunicação não autorizada**: permite inscrição, mas impede reativação pelo mini CRM (UC26).
* **Abandono**: lead disponível em UC26 se comunicação autorizada.

**Pós-condições**

* Lead capturado conforme consentimentos registrados.

---

### UC20 – Aceitar Termos LGPD, Comunicação e Regulamento

**Descrição**

Registra aceites: LGPD (global), autorização de comunicação e regulamento da edição (uso de imagem).

**Atores**

* **Empreendedora**, **Lead**, **Gestor** (cadastro manual).

**Pré-condições**

* Fluxo de inscrição ou cadastro manual.

**Fluxo Principal**

* Apresenta termos integrados ao fluxo.
* Registra aceites com data/hora, versão e dispositivo.

**Fluxos Alternativos**

* **Cadastro manual**: envia link de aceite via WhatsApp.

**Pós-condições**

* Aceites registrados conforme LGPD.

---

### UC21 – Realizar Inscrição Completa

**Descrição**

Conclui inscrição em etapas (dados pessoais → financeiros → específicos do programa) com indicador visual de progresso.

**Atores**

* **Empreendedora**, **Lead**.

**Pré-condições**

* Pré-cadastro (UC19); aceites (UC20).

**Fluxo Principal**

* Formulário em etapas com barra de progresso.
* Valida CPF, endereço, perfil socioeconômico.
* Aceite do regulamento da edição.
* Registra inscrição "finalizada — aguardando seleção".
* Oferece recompensa única (e-book), independente de seleção.

**Fluxos Alternativos**

* **Recorrente (UC22)**: pré-preenche e solicita atualização.
* **Incompleta**: retomada via link; UC26.

**Pós-condições**

* Inscrição elegível a UC23/UC24.

**Exceções**

* **EC1**: Edição encerrada durante preenchimento.

---

### UC22 – Reutilizar Cadastro de Participante Recorrente

**Descrição**

Participante já cadastrada valida/atualiza dados ao se inscrever novamente.

**Atores**

* **Empreendedora**.

**Pré-condições**

* CPF/telefone na base unificada.

**Fluxo Principal**

* Sistema identifica recorrência.
* Pré-preenche dados e histórico.
* Solicita confirmação/atualização.
* Registra nova inscrição vinculada ao histórico (UC28).

**Pós-condições**

* Cadastro atualizado; histórico preservado.

---

### UC23 – Validar Elegibilidade da Inscrição (Automático)

**Descrição**

Aplica critérios de UC12 sobre inscrições finalizadas.

**Atores**

* **Motor de Automação**; **Gestor** (consulta).

**Pré-condições**

* Inscrição finalizada (UC21); critérios configurados.

**Fluxo Principal**

* Valida CPF, duplicidade, renda, região, recorrência.
* Classifica: elegível, elegível com alerta ou inelegível.

**Pós-condições**

* Inscrições classificadas para seleção.

---

### UC24 – Selecionar Participantes para o Programa

**Descrição**

Seleção manual assistida por filtros automáticos, histórico e entrevistas.

**Atores**

* **Gestor de Turma (App Gestor)**.

**Pré-condições**

* Inscrições validadas (UC23).

**Fluxo Principal**

* Painel com totais, filtros e critérios de vulnerabilidade.
* Seleciona dentro do limite de vagas/orçamento.
* Confirma aprovadas/reprovadas para UC25.

**Fluxos Alternativos**

* **Volume superior à meta**: seleciona número maior que vagas finais (ex.: 50–60 para meta de 40).

**Pós-condições**

* Lista de selecionadas definida.

---

### UC25 – Comunicar Resultado da Seleção

**Descrição**

Comunica aprovação, reprovação ou lista de espera via WhatsApp.

**Atores**

* **Gestor de Turma**, **WhatsApp**.

**Pré-condições**

* Seleção concluída (UC24).

**Fluxo Principal**

* Dispara templates aprovados (individual ou lote).
* Registra histórico de comunicação.

**Pós-condições**

* Participantes informadas.

**Exceções**

* **EC1**: Falha no envio — retry ou envio manual.

---

### UC26 – Gerenciar Leads com Inscrição Incompleta (Mini CRM)

**Descrição**

Visualiza e reativa leads que **autorizaram comunicação** e abandonaram inscrição.

**Atores**

* **Gestor de Turma (App Gestor)**.

**Pré-condições**

* Aceite de comunicação (UC19); inscrição incompleta.

**Fluxo Principal**

* Filtra por programa, edição, etapa de abandono.
* Dispara retomada com link personalizado.
* Registra conversões.

**Pós-condições**

* Leads reengajados; taxa de conversão mensurável.

---

### UC27 – Cadastrar e Atualizar Dados da Empreendedora

**Descrição**

Autoatualização pela empreendedora ou cadastro/edição pelo gestor/educador.

**Atores**

* **Empreendedora**, **Gestor**, **Educador**.

**Pré-condições**

* Vinculada a programa/turma.

**Fluxo Principal**

* Edição via painel ou App Gestor.
* Validação de CPF, e-mail, telefone; log de auditoria.

**Pós-condições**

* Dados atualizados.

---

### UC28 – Consultar Histórico de Participação

**Descrição**

Linha do tempo de programas, edições, status, certificações e indicadores.

**Atores**

* **Gestor**, **Educador**, **Administrador**, **Empreendedora** (visão própria).

**Pré-condições**

* Cadastro na base unificada.

**Fluxo Principal**

* Busca por CPF/nome/telefone.
* Exibe histórico consolidado (inclui dados migrados — UC62).

**Pós-condições**

* Visão para seleção, mentoria e BI.

---

### UC29 – Classificar Status da Participante

**Descrição**

Status: pré-inscrita, inscrita, selecionada, em assessoria, beneficiada, certificada, contemplada, emancipada, descontinuada/desistente.

**Atores**

* **Motor de Automação**, **Gestor**.

**Pré-condições**

* Participante vinculada a edição/turma; critérios UC13.

**Fluxo Principal**

* Cálculo automático conforme frequência e entregas.
* Gestor ajusta exceções manualmente.

**Pós-condições**

* Status refletido em relatórios.

---

### UC30 – Registrar Motivo de Desistência

**Descrição**

Registra motivo padronizado de abandono para indicadores qualitativos.

**Atores**

* **Gestor**, **Educador**.

**Pré-condições**

* Interrupção de participação identificada.

**Fluxo Principal**

* Seleciona motivo, observações e elegibilidade remanescente como beneficiada.

**Pós-condições**

* Desistência categorizada.

---

### UC31 – Gerenciar Negócio e Associar Empreendedoras

**Descrição**

Cadastra **negócio** (individual ou coletivo) e **associa empreendedoras**. O gestor pode vincular uma empreendedora a um negócio existente ou **adicionar empreendedora a um negócio** já cadastrado. Cada pessoa permanece contabilizada individualmente nos relatórios.

**Atores**

* **Gestor de Turma (App Gestor)**, **Educador**.

**Pré-condições**

* Empreendedoras vinculadas à turma/edição.

**Fluxo Principal**

* Cria negócio (nome, CNPJ opcional, segmento) ou localiza existente.
* **Associa** uma ou mais empreendedoras ao negócio.
* **Adiciona** nova empreendedora a negócio coletivo existente.

**Pós-condições**

* Negócio e vínculos registrados.

---

### UC32 – Mover Empreendedora entre Negócios

**Descrição**

Permite ao **Gestor de Programa** transferir empreendedora de um negócio para outro, preservando histórico individual.

**Atores**

* **Gestor de Turma (App Gestor)**.

**Pré-condições**

* Empreendedora associada a negócio de origem.

**Fluxo Principal**

* Localiza participante → **Mover negócio**.
* Seleciona negócio destino ou cria novo.
* Registra motivo e data.

**Pós-condições**

* Vínculo atualizado; rastreabilidade mantida.

---

### UC33 – Configurar Liberação Progressiva de Conteúdo

**Descrição**

Desbloqueio de atividades conforme cronograma (online) ou condução pelo educador (presencial).

**Atores**

* **Gestor**, **Motor de Automação**.

**Pré-condições**

* Programa e turma configurados.

**Fluxo Principal**

* **Online**: cadência (ex.: 3 envios/semana), gatilhos por data/conclusão.
* **Presencial**: educador libera ou conduz atividade no App Gestor, inclusive fora da sequência.

**Pós-condições**

* Conteúdo disponível conforme formato do programa.

---

### UC34 – Configurar Calendário e Atividades por Turma

**Descrição**

Datas de encontros presenciais, **aulas ao vivo via YouTube** e prazos de entrega por turma.

**Atores**

* **Gestor**, **Educador (App Gestor)**.

**Pré-condições**

* Turma criada (UC16); módulos definidos.

**Fluxo Principal**

* Define calendário local por turma.
* URLs de aula ao vivo (YouTube) individualizadas por turma quando necessário.

**Pós-condições**

* Cronograma regional configurado.

---

### UC35 – Adicionar Conteúdo Extra por Turma

**Descrição**

Oficinas extras regionais sem alterar programação global; não afetam progresso obrigatório.

**Atores**

* **Gestor**, **Educador**.

**Pré-condições**

* Turma ativa.

**Fluxo Principal**

* Adiciona atividade "extra/facultativa" no calendário da turma.
* Notifica participantes sem impactar certificação.

**Pós-condições**

* Conteúdo facultativo disponível à turma.

---

### UC36 – Consumir Conteúdo Educacional

**Descrição**

Acesso a videoaulas (YouTube), PDFs e guias via painel — link WhatsApp ou login e-mail (UC4).

**Atores**

* **Empreendedora**, **YouTube**.

**Pré-condições**

* Autenticada (UC4); conteúdo liberado (UC33).

**Fluxo Principal**

* Visualiza programa/módulos com progresso.
* Consome conteúdo liberado; registra UC37/UC39.

**Pós-condições**

* Consumo registrado.

---

### UC37 – Registrar Progresso em Videoaula

**Descrição**

Rastreia % assistido para marcos e certificação (meta configurável, ex.: 70%).

**Atores**

* **Empreendedora**, **YouTube**.

**Pré-condições**

* Videoaula liberada e acessada.

**Fluxo Principal**

* Sistema registra percentual visualizado.
* Ao atingir meta, marca atividade concluída.
* Se online sequencial, desbloqueia próxima etapa.

**Pós-condições**

* Progresso atualizado.

---

### UC38 – Assistir Aula ao Vivo (YouTube)

**Descrição**

Participação em transmissão ao vivo via **YouTube**. Link enviado por WhatsApp ou painel.

**Atores**

* **Empreendedora**, **YouTube**, **Gestor**.

**Pré-condições**

* Live configurada no calendário (UC34).

**Fluxo Principal**

* Recebe link da live.
* Acessa transmissão YouTube.
* Sistema registra participação quando integração disponível; alternativa: UC41.

**Pós-condições**

* Participação em live registrada.

---

### UC39 – Responder Atividade (Exercício / Questionário)

**Descrição**

Questões múltipla escolha ou abertas; feedback imediato; pontuação para ranking (UC56).

**Atores**

* **Empreendedora**.

**Pré-condições**

* Atividade liberada; autenticada (UC4).

**Fluxo Principal**

* Responde questões e confirma envio.
* Sistema corrige, exibe feedback e registra pontuação.

**Fluxos Alternativos**

* **Resposta incompleta**: solicita conclusão.

**Pós-condições**

* Atividade registrada.

---

### UC40 – Registrar Presença via QR Code

**Descrição**

Presença em encontros presenciais via QR vinculado ao evento/turma.

**Atores**

* **Empreendedora**, **Educador**.

**Pré-condições**

* Encontro configurado (UC34); empreendedora autenticada (UC4).

**Fluxo Principal**

* Educador exibe QR code.
* Empreendedora escaneia; sistema registra presença com data/hora.

**Fluxos Alternativos**

* **Sem celular/conectividade**: UC41.

**Pós-condições**

* Presença contabilizada (UC42).

---

### UC41 – Registrar Presença Manualmente

**Descrição**

Registro por CPF/nome quando QR inviável.

**Atores**

* **Educador**, **Gestor (App Gestor)**.

**Pré-condições**

* Encontro ativo.

**Fluxo Principal**

* Busca participante por CPF/nome.
* Confirma presença; registra origem "manual".

**Pós-condições**

* Frequência atualizada.

---

### UC42 – Consultar Frequência da Participante

**Descrição**

Percentual de participação vs. metas da edição (50%, 75%, 100%).

**Atores**

* **Gestor**, **Educador**, **Empreendedora**.

**Pré-condições**

* Registros de presença e atividades existentes.

**Fluxo Principal**

* Exibe frequência global e por módulo/atividade.

**Pós-condições**

* Informação para certificação e status.

---

### UC43 – Enviar Material ou Evidência de Atividade

**Descrição**

Upload de arquivos/fotos como entrega de tarefas.

**Atores**

* **Empreendedora**.

**Pré-condições**

* Atividade de entrega liberada.

**Fluxo Principal**

* Faz upload ou preenche texto; confirma envio.
* Status "aguardando avaliação".

**Pós-condições**

* Entrega disponível para UC44.

---

### UC44 – Avaliar Entrega e Fornecer Feedback

**Descrição**

Aprovar, rejeitar ou solicitar correção com comentários no App Gestor.

**Atores**

* **Educador**, **Gestor**.

**Pré-condições**

* Entrega registrada (UC43).

**Fluxo Principal**

* Analisa material; registra parecer e feedback.
* Notifica empreendedora via WhatsApp/painel.

**Pós-condições**

* Status da entrega atualizado; histórico preservado.

---

### UC45 – Enviar Dados Financeiros Mensais

**Descrição**

Renda, faturamento, investimento, poupança e fluxo de caixa — autoatendimento com validação lógica.

**Atores**

* **Empreendedora**, **Educador** (assistido).

**Pré-condições**

* Fase de coleta financeira ativa.

**Fluxo Principal**

* Preenche formulário mensal no painel ou via link WhatsApp.
* Sistema valida consistência (ex.: renda ≤ faturamento).
* Status "aguardando validação" (UC46).

**Fluxos Alternativos**

* **Dados inconsistentes**: alerta e solicita correção.

**Pós-condições**

* Dados registrados para BI.

---

### UC46 – Validar Dados Financeiros

**Descrição**

Educador aprova ou devolve dados financeiros informados.

**Atores**

* **Educador**, **Gestor**.

**Pré-condições**

* Dados enviados (UC45).

**Fluxo Principal**

* Analisa valores e comparativo mensal.
* Aprova ou devolve com observações.

**Pós-condições**

* Dados validados incorporados aos indicadores.

---

### UC47 – Preencher Formulário de Indicadores (Baseline / Endline)

**Descrição**

Indicadores qualitativos/quantitativos em momentos configuráveis (início, meio, fim).

**Atores**

* **Empreendedora**, **Educador**, **Gestor**.

**Pré-condições**

* Formulário configurado; período ativo.

**Fluxo Principal**

* Preenche questionário padronizado.
* Sistema associa ao momento (baseline/endline).

**Pós-condições**

* Indicadores para UC61.

---

### UC48 – Responder Pesquisa de Avaliação (NPS / Satisfação)

**Descrição**

Avaliação de curso, aulas e oficinas (escala 0–5 ou NPS).

**Atores**

* **Empreendedora**.

**Pré-condições**

* Pesquisa liberada.

**Fluxo Principal**

* Responde via link; sistema consolida por turma/edição.

**Pós-condições**

* Dados de satisfação disponíveis.

---

### UC49 – Disparar Mensagem Individual via WhatsApp

**Descrição**

Mensagem personalizada (texto, link, material).

**Atores**

* **Gestor**, **Educador**, **Motor de Automação**, **WhatsApp**.

**Pré-condições**

* Template aprovado Meta; consentimento quando exigido.

**Fluxo Principal**

* Monta mensagem com link personalizado (UC54).
* Envia via API; registra status.

**Exceções**

* **EC1**: Falha Meta API — retry.

---

### UC50 – Disparar Mensagem em Grupo via WhatsApp

**Descrição**

Comunicação à turma; grupos WhatsApp para interação humana; disparos via API.

**Atores**

* **Gestor**, **WhatsApp**.

**Pré-condições**

* Turma definida; templates configurados.

**Fluxo Principal**

* Seleciona turma e mensagem; envia disparos.
* Registra histórico.

**Pós-condições**

* Turma comunicada; propriedade do grupo institucional.

---

### UC51 – Enviar Vídeo ou Conteúdo via WhatsApp

**Descrição**

Envio de **vídeos** e materiais diretamente via WhatsApp (dentro dos limites Meta), complementando links para YouTube/painel.

**Atores**

* **Gestor**, **Motor de Automação**, **WhatsApp**.

**Pré-condições**

* Mídia/template aprovados; opt-in quando exigido.

**Fluxo Principal**

* Seleciona participante/turma e mídia (vídeo, imagem, PDF).
* Envia via API WhatsApp.
* Registra entrega e status.

**Pós-condições**

* Conteúdo entregue por WhatsApp; histórico registrado.

---

### UC52 – Programar Mensagens Automáticas

**Descrição**

Agenda lembretes, prazos e aberturas futuras.

**Atores**

* **Gestor**, **Motor de Automação**.

**Pré-condições**

* Edição/turma configurada; templates aprovados.

**Fluxo Principal**

* Define público, template, data/hora e gatilho.
* Motor executa envio (UC49/UC50).

**Pós-condições**

* Mensagens na fila de automação.

---

### UC53 – Enviar Lembrete por Atividade Não Concluída

**Descrição**

Lembrete automático (ex.: 48h) por atividade pendente.

**Atores**

* **Motor de Automação**, **WhatsApp**.

**Pré-condições**

* Gatilho configurado; atividade pendente.

**Fluxo Principal**

* Após prazo, envia lembrete com link à atividade.
* Limita reenvios para evitar spam.

**Pós-condições**

* Tentativa de reengajamento registrada.

---

### UC54 – Enviar Link Personalizado com Autenticação Embutida

**Descrição**

URLs com token para autenticação frictionless (UC4).

**Atores**

* **Motor de Automação**, **Empreendedora**.

**Pré-condições**

* Participante identificada.

**Fluxo Principal**

* Gera link único com token.
* Registra clique e destino.

**Pós-condições**

* Acesso sem login adicional.

---

### UC55 – Emitir Certificado Automaticamente

**Descrição**

Gera e envia certificado via WhatsApp ao atingir critérios (UC13).

**Atores**

* **Motor de Automação**, **WhatsApp**, **Empreendedora**.

**Pré-condições**

* Critérios atingidos; template configurado.

**Fluxo Principal**

* Detecta elegibilidade; gera PDF; envia via WhatsApp.
* Atualiza status "certificada" (UC29).

**Pós-condições**

* Certificado entregue; emissão registrada.

---

### UC56 – Consultar Ranking e Engajamento

**Descrição**

Ranking por critérios de UC14 (premiação).

**Atores**

* **Gestor**, **Educador**.

**Pré-condições**

* Atividades pontuadas registradas.

**Fluxo Principal**

* Ordena por engajamento, notas e prazos.
* Disponibiliza para decisão de UC57.

**Pós-condições**

* Ranking disponível.

---

### UC57 – Selecionar Contempladas (Premiação / Mentoria)

**Descrição**

Define contempladas conforme ranking e critérios de UC14.

**Atores**

* **Gestor de Turma**.

**Pré-condições**

* Programa concluído ou fase de premiação; UC56 disponível.

**Fluxo Principal**

* Analisa ranking e regulamento (carência, top N).
* Seleciona contempladas; registra benefício.
* Atualiza status "contemplada" (UC29).

**Pós-condições**

* Contemplação registrada.

---

### UC58 – Analisar Elegibilidade para Capital Semente

**Descrição**

Análise estruturada: entregas, fluxo de caixa, constância, necessidade de equipamentos.

**Atores**

* **Gestor**, **Educador**.

**Pré-condições**

* Histórico financeiro e entregas disponíveis.

**Fluxo Principal**

* Consolida dados da participante.
* Registra parecer e decisão (valor/tipo quando aprovado).

**Pós-condições**

* Decisão documentada e rastreável.

---

### UC59 – Consultar Dashboard de Impacto

**Descrição**

Painéis em tempo real — entregável contratual "Painéis de Acompanhamento, Controles e Relatórios".

**Atores**

* **Administrador**, **Gestor**, **Organização** (visão restrita).

**Pré-condições**

* Dados operacionais registrados.

**Fluxo Principal**

* Filtra por programa, edição, unidade, turma e período.
* Exibe KPIs atualizados dinamicamente.

**Pós-condições**

* Visão consolidada para gestão e financiadores.

---

### UC60 – Gerar Relatórios Quantitativos

**Descrição**

Frequência, participação, evolução financeira, inscritas/selecionadas/beneficiadas/certificadas.

**Atores**

* **Administrador**, **Gestor**.

**Pré-condições**

* Permissão de relatórios; dados validados.

**Fluxo Principal**

* Seleciona tipo e filtros; sistema agrega e apresenta.

**Pós-condições**

* Relatório disponível no painel.

---

### UC61 – Gerar Relatórios Qualitativos

**Descrição**

Perfil socioeconômico, baseline/endline, desistências, NPS.

**Atores**

* **Administrador**, **Gestor**.

**Pré-condições**

* Formulários qualitativos preenchidos.

**Fluxo Principal**

* Consolida respostas por beneficiária, turma, programa ou edição.

**Pós-condições**

* Relatório qualitativo disponível.

---

### UC62 – Migrar Dados do Sistema Legado

**Descrição**

ETL do sistema de 2015/planilhas para base unificada (incorpora ex-importação histórica separada). Processo técnico na implantação.

**Atores**

* **Administrador**; equipe técnica.

**Pré-condições**

* Dump legado mapeado; ambiente de staging.

**Fluxo Principal**

* Extrai, transforma e valida amostra com equipe Consulado.
* Promove à produção; registros marcados "legado".

**Pós-condições**

* Histórico disponível para UC28 e UC22.

---

### UC63 – Consultar e Solicitar Certificado (Autoatendimento)

**Descrição**

Reenvio de certificado já emitido (UC55).

**Atores**

* **Empreendedora**; **Chat IA** (opcional).

**Pré-condições**

* Certificado previamente emitido.

**Fluxo Principal**

* Solicita reenvio autenticado (UC4).
* Sistema localiza e reenvia via WhatsApp ou download.

**Pós-condições**

* Certificado reencaminhado.

---

### UC64 – Utilizar Chat de Dúvidas (IA)

**Descrição**

Chatbot previsto no contrato (Fase 2), treinado em conteúdos internos; escala casos complexos ao educador.

**Atores**

* **Empreendedora**, **Chat IA**.

**Pré-condições**

* Funcionalidade habilitada.

**Fluxo Principal**

* Formula pergunta; IA responde com base em FAQ e conteúdos.
* Casos complexos encaminhados ao educador.

**Pós-condições**

* Interação registrada.

---

### UC65 – Consultar Consumo de Mensagens WhatsApp

**Descrição**

Volume e custo estimado por programa/edição (custo variável contratual Fase 3.1).

**Atores**

* **Administrador**, **Gestor**.

**Pré-condições**

* Integração Meta Business API ativa.

**Fluxo Principal**

* Filtra por período e programa.
* Exibe quantidade por categoria e projeção mensal.

**Pós-condições**

* Visibilidade orçamentária.

---

## Matriz Resumo: Atores × Casos de Uso Principais

| Caso de Uso | Empreendedora | Gestor/Educador (App) | Admin (Strapi) | Sistemas Externos |
| ----------- | :-----------: | :-------------------: | :------------: | :---------------: |
| UC4 Login | ● | | | WhatsApp |
| UC19–21 Inscrição | ● | | ○ | |
| UC24 Seleção | | ● | ○ | |
| UC15, UC33–35 Programa/Módulos | | ● | ● | |
| UC36–39 Consumo/Atividades | ● | | | YouTube |
| UC40–41 Presença | ● | ● | | |
| UC45–46 Dados Financeiros | ● | ● | | |
| UC49–53 Comunicação | ○ | ● | ○ | WhatsApp |
| UC55 Certificado | ● | ○ | | WhatsApp |
| UC59–61 Relatórios/BI | | ● | ● | |
| UC62 Migração | | | ● | |

**Legenda:** ● = ator principal | ○ = ator secundário ou opcional

---

## Observações de Escopo e Priorização (MVP)

Com base no contrato (Fase 2 — 2 a 4 meses) e reuniões de jun/2026, casos de uso **essenciais para o MVP**:

* UC1–UC6, UC7–UC18, UC19–UC26, UC27–UC32, UC33–UC42, UC45–UC46, UC49–UC55, UC59–UC60

**Secundários na fase inicial** (evolução Fase 3):

* UC26 (Mini CRM), UC51 (vídeo WhatsApp), UC56–UC58, UC63–UC65, UC64 (Chat IA)

**Alterações em relação à v0** (observações v1):

* Removidos: importação de inscrições externas (ex-UC21), exportação Excel/PDF (ex-UC57), importação histórica separada (ex-UC58 — incorporada a UC62)
* Aulas ao vivo via **YouTube**; envio de vídeos também via **WhatsApp**
* Login empreendedora: **WhatsApp ou e-mail**
* Fluxo em 4 fases; pré-cadastro com checkbox de **aprovação de comunicação**
* **Programa** (não trilha) = módulos; módulo = tipo temático único + atividades
* **Organização** associável à edição como patrocinador/parceiro
* **Strapi CMS** + **App Gestor**; critérios de **premiação** (UC14)
* Gestor move empreendedora entre **negócios** (UC32)

Decisões consolidadas (reuniões + contrato):

* Strapi para modelagem; App Gestor para operação de turmas
* Uma edição aberta para inscrição; URLs diretas por programa
* Alocação manual em turmas após seleção
* WhatsApp como canal principal; sistema como repositório central
* 2FA e política de senhas (contrato cl. 6.2; Anexo I LGPD)
* Entregáveis: Plataforma Educacional, Strapi CMS, App Gestor, Painéis/Relatórios, Chat IA

---

_Documento v1 — jun/2026. Base: v0 + observações v1 + contrato EWTI/Consulado da Mulher (08.05.2026)._
