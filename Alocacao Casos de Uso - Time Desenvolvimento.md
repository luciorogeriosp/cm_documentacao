# Alocação de Casos de Uso — Time de Desenvolvimento

**Projeto:** Plataforma de Gestão de Programas Sociais — Consulado da Mulher  
**Base:** [Casos de Uso - Consulado da Mulher_v2.md](Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v2.md) (75 UCs)  
**Equipe:** [time_desenvolvimento.md](time_desenvolvimento.md)  
**Data:** jun/2026

---

## Objetivo

Este documento distribui os **75 casos de uso** entre os membros da equipe, indicando **responsável principal**, **apoio**, **frente/plataforma** e **prioridade** (MVP ou Fase 3), conforme a estrutura definida em `time_desenvolvimento.md`.

### Legenda de prioridade

| Prioridade | Significado |
| ---------- | ----------- |
| **MVP** | Essencial para edições 2027 (Fase 2 — contrato) |
| **Fase 3** | Evolução pós-MVP |

### Legenda de papéis na alocação

| Sigla | Papel |
| ----- | ----- |
| **RP** | Responsável principal |
| **AP** | Apoio |
| **UX** | Design de interface (Eduardo Magno) |
| **INF** | Infraestrutura e deploy (Mateus) |

---

## Resumo por membro da equipe

| Membro | Papel | Qtd. UCs (RP) | Frentes principais |
| ------ | ----- | :-----------: | ------------------ |
| **Alexandre Notte** | Arquiteto / Coordenador | 18 | Strapi CMS, modelagem, coordenação |
| **Yann Jaster** | Tech Lead | 8 | APIs, motor de automação, revisão |
| **Victor** | Full Stack | 33 | App Gestor, Aplicativo Cliente (negócio) |
| **Dayvid Lima** | Back-end Sênior | 11 | Mensageria, WhatsApp, e-mail, filas |
| **José** | Front-end | — | Interfaces App Gestor e Portal (apoio em todos os UCs de UI) |
| **Eduardo Magno** | UX / UI | 75 | Design de todas as telas (transversal) |
| **Juvenal Coelho** | BI / Dados | 6 | Painel de Dados, relatórios, legado |
| **Mateus** | DevOps / Infra | — | Ambientes, CI/CD, AWS (transversal) |

---

## Visão por frente e plataforma

| Frente / Plataforma | Responsável principal | Apoio | Casos de uso |
| ------------------- | --------------------- | ----- | ------------ |
| **Coordenação e requisitos** | Alexandre Notte | Yann Jaster, Eduardo, Juvenal | Todos (governança) |
| **Strapi CMS** | Alexandre Notte | Dayvid Lima | UC1–UC2, UC5–UC15, UC66, UC73–UC75 |
| **App Gestor** | Victor | José, Yann Jaster | UC3, UC16–UC18, UC24–UC26, UC28–UC32, UC34–UC35, UC41–UC42, UC44, UC46, UC50, UC56–UC58, UC57, UC69–UC70, UC74 |
| **Portal Educacional** | Victor | José, Dayvid Lima | UC4, UC19–UC22, UC27, UC36–UC40, UC43, UC45, UC47–UC48, UC63, UC67–UC68, UC72 |
| **APIs e motor de automação** | Yann Jaster | Dayvid Lima, Victor | UC23, UC29, UC33, UC52–UC53, UC55 |
| **Mensageria (WhatsApp / E-mail)** | Dayvid Lima | Yann Jaster, Alexandre | UC25, UC49, UC51, UC54, UC65 |
| **Business Intelligence** | Juvenal Coelho | Alexandre Notte | UC59–UC62, UC60–UC61, UC71 |
| **UX / UI Design** | Eduardo Magno | Alexandre Notte | Todos os UCs com interface |
| **Infraestrutura AWS / CI/CD** | Mateus | Yann Jaster | Transversal (deploy de todas as frentes) |

---

## Alocação por fase do fluxo operacional

### Plataformas, Acesso e Configuração (Strapi CMS)

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC1 | Cadastrar Colaborador (Strapi) | Alexandre | Dayvid | Eduardo | MVP |
| UC2 | Login Administrador (Strapi CMS) | Alexandre | Dayvid | Eduardo | MVP |
| UC3 | Login Gestor (App Gestor) | Victor | José, Yann | Eduardo | MVP |
| UC4 | Login da Empreendedora (WhatsApp ou E-mail) | Victor | Dayvid, José | Eduardo | MVP |
| UC5 | Gerenciar Roles e Permissões (Strapi) | Alexandre | Yann | Eduardo | MVP |
| UC6 | Configurar Autenticação e Segurança (2FA) | Alexandre | Yann, Dayvid | Eduardo | MVP |
| UC7 | Cadastrar Programa | Alexandre | Dayvid | Eduardo | MVP |
| UC8 | Modelar Programa e Associar Módulos | Alexandre | Victor | Eduardo | MVP |
| UC9 | Criar e Configurar Edição de Programa | Alexandre | Victor | Eduardo | MVP |
| UC10 | Cadastrar Organização | Alexandre | Dayvid | Eduardo | MVP |
| UC11 | Associar Organização à Edição | Alexandre | Dayvid | Eduardo | MVP |
| UC12 | Configurar Regulamento e Critérios de Seleção | Alexandre | Victor | Eduardo | MVP |
| UC13 | Configurar Critérios de Beneficiamento e Certificação | Alexandre | Victor | Eduardo | MVP |
| UC14 | Configurar Critérios de Premiação (Textual) | Alexandre | Victor | Eduardo | MVP |
| UC15 | Criar Módulo Educacional | Alexandre | Victor | Eduardo | MVP |
| UC16 | Criar e Gerenciar Turma | Victor | Alexandre, José | Eduardo | MVP |
| UC17 | Alocar Empreendedora em Turma | Victor | José | Eduardo | MVP |
| UC18 | Transferir Empreendedora entre Turmas | Victor | José | Eduardo | MVP |
| UC66 | Cadastrar Unidade | Alexandre | Victor | Eduardo | MVP |
| UC73 | Cadastrar Voluntário ou Mentor | Alexandre | Victor | Eduardo | Fase 3 |
| UC74 | Ativar ou Inativar Colaborador/Parceiro | Alexandre | Victor | Eduardo | Fase 3 |
| UC75 | Migrar Colaborador entre Unidades | Alexandre | Yann | Eduardo | Fase 3 |

### Fase 1 — Pré-inscrição

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC19 | Realizar Pré-Cadastro (Captura Inicial de Lead) | Victor | José, Alexandre | Eduardo | MVP |
| UC20 | Aceitar Termos LGPD, Comunicação, Cookies e localStorage | Victor | José, Alexandre | Eduardo | MVP |
| UC67 | Resgatar Sessão do Dispositivo (UUID e localStorage) | Victor | José, Yann | Eduardo | MVP |

### Fase 2 — Inscrição

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC21 | Realizar Inscrição Completa | Victor | José, Alexandre | Eduardo | MVP |
| UC22 | Consultar Histórico Legado e Reutilizar Cadastro Recorrente | Victor | Juvenal, José, Alexandre | Eduardo | MVP |

### Fase 3 — Seleção

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC23 | Validar Elegibilidade da Inscrição (Automático) | Yann Jaster | Victor, Alexandre | Eduardo | MVP |
| UC24 | Selecionar Participantes para o Programa | Victor | José | Eduardo | MVP |
| UC25 | Comunicar Resultado da Seleção | Dayvid Lima | Victor, José | Eduardo | MVP |
| UC26 | Gerenciar Leads com Inscrição Incompleta (Mini CRM) | Victor | José, Dayvid | Eduardo | Fase 3 |

### Fase 4 — Aprovação e Aplicação do Programa

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC27 | Cadastrar e Atualizar Dados da Empreendedora | Victor | José | Eduardo | MVP |
| UC28 | Consultar Histórico de Participação | Victor | Juvenal, José | Eduardo | MVP |
| UC29 | Classificar Status da Participante | Yann Jaster | Victor | Eduardo | MVP |
| UC30 | Registrar Cancelamento ou Desistência | Victor | José | Eduardo | MVP |
| UC31 | Gerenciar Negócio e Associar Empreendedoras | Victor | José | Eduardo | MVP |
| UC32 | Mover Empreendedora entre Negócios | Victor | José | Eduardo | MVP |
| UC33 | Configurar Liberação Progressiva de Conteúdo | Yann Jaster | Alexandre, Victor | Eduardo | MVP |
| UC34 | Configurar Calendário e Atividades por Turma | Victor | José | Eduardo | MVP |
| UC35 | Adicionar Conteúdo Extra por Turma | Victor | José | Eduardo | MVP |
| UC36 | Consumir Conteúdo Educacional | Victor | José | Eduardo | MVP |
| UC37 | Registrar Progresso em Videoaula | Victor | José, Yann | Eduardo | MVP |
| UC38 | Assistir Aula ao Vivo (YouTube) | Victor | José | Eduardo | MVP |
| UC39 | Responder Atividade (Exercício / Questionário) | Victor | José | Eduardo | MVP |
| UC40 | Registrar Presença via QR Code | Victor | José | Eduardo | MVP |
| UC41 | Registrar Presença Manualmente | Victor | José | Eduardo | MVP |
| UC42 | Consultar Frequência da Participante | Victor | José | Eduardo | MVP |
| UC43 | Enviar Material ou Evidência de Atividade | Victor | José | Eduardo | MVP |
| UC44 | Avaliar Entrega e Fornecer Feedback | Victor | José | Eduardo | MVP |
| UC45 | Enviar Registro de Dados Financeiros Mensais | Victor | José | Eduardo | MVP |
| UC46 | Validar Dados Financeiros (Educador) | Victor | José | Eduardo | MVP |
| UC47 | Preencher Formulário de Indicadores (Baseline / Endline) | Victor | José, Juvenal | Eduardo | MVP |
| UC48 | Responder Pesquisa de Avaliação (NPS / Satisfação) | Victor | José | Eduardo | MVP |
| UC49 | Disparar Mensagem Individual via WhatsApp | Dayvid Lima | Victor, José | Eduardo | MVP |
| UC50 | Comunicar para Grupo WhatsApp (Facilitador Manual) | Victor | José, Alexandre | Eduardo | MVP |
| UC51 | Enviar Vídeo ou Conteúdo via WhatsApp | Dayvid Lima | Victor | Eduardo | Fase 3 |
| UC52 | Programar Mensagens Automáticas | Dayvid Lima | Yann Jaster | Eduardo | MVP |
| UC53 | Enviar Lembrete por Atividade Não Concluída | Yann Jaster | Dayvid Lima | Eduardo | MVP |
| UC54 | Enviar Link Personalizado com Autenticação Embutida | Dayvid Lima | Victor, Yann | Eduardo | MVP |
| UC68 | Visualizar Calendário de Atividades (Portal Educacional) | Victor | José | Eduardo | Fase 3 |
| UC69 | Inserir Dados em Nome da Empreendedora | Victor | José, Yann | Eduardo | Fase 3 |
| UC72 | Exibir Alerta de Compatibilidade de Navegador | José | Victor | Eduardo | Fase 3 |

### Fase 5 — Conclusão

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC55 | Classificar Beneficiamento e Emitir Certificado Automaticamente | Yann Jaster | Dayvid Lima, Victor | Eduardo | MVP |
| UC56 | Consultar Ranking e Engajamento | Victor | José, Juvenal | Eduardo | Fase 3 |
| UC57 | Registrar Premiação (Manual — App Gestor) | Victor | José | Eduardo | Fase 3 |
| UC58 | Analisar Elegibilidade para Capital Semente | Victor | José, Juvenal | Eduardo | Fase 3 |
| UC70 | Registrar Mentoria | Victor | José, Alexandre | Eduardo | Fase 3 |

### Relatórios, BI e Dados Legados

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC59 | Consultar Dashboard de Impacto (Painel de Dados) | Juvenal Coelho | Alexandre, Victor | Eduardo | MVP |
| UC60 | Gerar Relatórios Quantitativos | Juvenal Coelho | Alexandre | Eduardo | MVP |
| UC61 | Gerar Relatórios Qualitativos | Juvenal Coelho | Alexandre | Eduardo | Fase 3 |
| UC62 | Consultar Base Legada de Participação | Juvenal Coelho | Alexandre, Dayvid | Eduardo | Fase 3 |
| UC71 | Consolidar Totalizadores com Dados Pregressos | Juvenal Coelho | Alexandre, Yann | Eduardo | Fase 3 |

### Funcionalidades Complementares

| UC | Caso de uso | RP | AP | UX | Prioridade |
| -- | ----------- | -- | -- | -- | ---------- |
| UC63 | Consultar e Solicitar Certificado (Autoatendimento) | Victor | José, Dayvid | Eduardo | Fase 3 |
| UC64 | Utilizar Chat de Dúvidas (IA) | Yann Jaster | Victor, José | Eduardo | Fase 3 |
| UC65 | Consultar Consumo de Mensagens WhatsApp | Dayvid Lima | Juvenal, Victor | Eduardo | Fase 3 |

---

## Alocação detalhada por membro

### Alexandre Notte — Arquiteto / Coordenador

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC1 | Cadastrar Colaborador (Strapi) | RP | MVP |
| UC2 | Login Administrador (Strapi CMS) | RP | MVP |
| UC5 | Gerenciar Roles e Permissões | RP | MVP |
| UC6 | Configurar Autenticação e Segurança | RP | MVP |
| UC7 | Cadastrar Programa | RP | MVP |
| UC8 | Modelar Programa e Associar Módulos | RP | MVP |
| UC9 | Criar e Configurar Edição de Programa | RP | MVP |
| UC10 | Cadastrar Organização | RP | MVP |
| UC11 | Associar Organização à Edição | RP | MVP |
| UC12 | Configurar Regulamento e Critérios de Seleção | RP | MVP |
| UC13 | Configurar Critérios de Beneficiamento e Certificação | RP | MVP |
| UC14 | Configurar Critérios de Premiação (Textual) | RP | MVP |
| UC15 | Criar Módulo Educacional | RP | MVP |
| UC66 | Cadastrar Unidade | RP | MVP |
| UC73 | Cadastrar Voluntário ou Mentor | RP | Fase 3 |
| UC74 | Ativar ou Inativar Colaborador/Parceiro | RP | Fase 3 |
| UC75 | Migrar Colaborador entre Unidades | RP | Fase 3 |
| — | Modelagem de dados (transversal) | RP | MVP |
| — | Protótipos funcionais (transversal) | RP | MVP |
| — | Configuração SendGrid / Gupshup | RP | MVP |

**Apoio em:** UC19–UC22, UC28, UC47, UC59–UC62, UC71, UC70

---

### Yann Jaster — Tech Lead

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC23 | Validar Elegibilidade da Inscrição (Automático) | RP | MVP |
| UC29 | Classificar Status da Participante | RP | MVP |
| UC33 | Configurar Liberação Progressiva de Conteúdo | RP | MVP |
| UC53 | Enviar Lembrete por Atividade Não Concluída | RP | MVP |
| UC55 | Classificar Beneficiamento e Emitir Certificado | RP | MVP |
| UC64 | Utilizar Chat de Dúvidas (IA) | RP | Fase 3 |
| — | Arquitetura técnica e APIs (transversal) | RP | MVP |
| — | Revisão de código (transversal) | RP | MVP |

**Apoio em:** UC3–UC4, UC6, UC37, UC49–UC54, **UC67**, UC69, UC71, UC75

---

### Victor — Desenvolvedor Full Stack

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC3 | Login Gestor (App Gestor) | RP | MVP |
| UC4 | Login da Empreendedora | RP | MVP |
| UC16 | Criar e Gerenciar Turma | RP | MVP |
| UC17 | Alocar Empreendedora em Turma | RP | MVP |
| UC18 | Transferir Empreendedora entre Turmas | RP | MVP |
| UC19 | Realizar Pré-Cadastro | RP | MVP |
| UC20 | Aceitar Termos LGPD, Cookies e localStorage | RP | MVP |
| UC21 | Realizar Inscrição Completa | RP | MVP |
| UC22 | Consultar Histórico Legado e Reutilizar Cadastro | RP | MVP |
| UC24 | Selecionar Participantes para o Programa | RP | MVP |
| UC26 | Gerenciar Leads (Mini CRM) | RP | Fase 3 |
| UC27 | Cadastrar e Atualizar Dados da Empreendedora | RP | MVP |
| UC28 | Consultar Histórico de Participação | RP | MVP |
| UC30 | Registrar Cancelamento ou Desistência | RP | MVP |
| UC31 | Gerenciar Negócio e Associar Empreendedoras | RP | MVP |
| UC32 | Mover Empreendedora entre Negócios | RP | MVP |
| UC34 | Configurar Calendário e Atividades por Turma | RP | MVP |
| UC35 | Adicionar Conteúdo Extra por Turma | RP | MVP |
| UC36 | Consumir Conteúdo Educacional | RP | MVP |
| UC37 | Registrar Progresso em Videoaula | RP | MVP |
| UC38 | Assistir Aula ao Vivo (YouTube) | RP | MVP |
| UC39 | Responder Atividade (Questionário) | RP | MVP |
| UC40 | Registrar Presença via QR Code | RP | MVP |
| UC41 | Registrar Presença Manualmente | RP | MVP |
| UC42 | Consultar Frequência da Participante | RP | MVP |
| UC43 | Enviar Material ou Evidência | RP | MVP |
| UC44 | Avaliar Entrega e Fornecer Feedback | RP | MVP |
| UC45 | Enviar Dados Financeiros Mensais | RP | MVP |
| UC46 | Validar Dados Financeiros | RP | MVP |
| UC47 | Preencher Formulário de Indicadores | RP | MVP |
| UC48 | Responder Pesquisa de Avaliação (NPS) | RP | MVP |
| UC50 | Comunicar para Grupo WhatsApp (Facilitador Manual) | RP | MVP |
| UC56 | Consultar Ranking e Engajamento | RP | Fase 3 |
| UC57 | Registrar Premiação (Manual) | RP | Fase 3 |
| UC58 | Analisar Elegibilidade para Capital Semente | RP | Fase 3 |
| UC63 | Consultar e Solicitar Certificado | RP | Fase 3 |
| UC67 | Resgatar Sessão do Dispositivo (UUID/localStorage) | RP | MVP |
| UC68 | Visualizar Calendário (Portal Educacional) | RP | Fase 3 |
| UC69 | Inserir Dados em Nome da Empreendedora | RP | Fase 3 |
| UC70 | Registrar Mentoria | RP | Fase 3 |

---

### Dayvid Lima — Desenvolvedor Back-end Sênior

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC25 | Comunicar Resultado da Seleção | RP | MVP |
| UC49 | Disparar Mensagem Individual via WhatsApp | RP | MVP |
| UC51 | Enviar Vídeo ou Conteúdo via WhatsApp | RP | Fase 3 |
| UC52 | Programar Mensagens Automáticas | RP | MVP |
| UC54 | Enviar Link Personalizado com Autenticação | RP | MVP |
| UC65 | Consultar Consumo de Mensagens WhatsApp | RP | Fase 3 |
| — | Motor de envio de mensagens (transversal) | RP | MVP |
| — | Integrações Gupshup / SendGrid (transversal) | RP | MVP |
| — | Filas e processamento assíncrono (transversal) | RP | MVP |

**Apoio em:** UC1–UC2, UC4–UC6, UC10–UC11, UC55, UC62, UC53

---

### José — Desenvolvedor Front-end

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC72 | Exibir Alerta de Compatibilidade de Navegador | RP | Fase 3 |
| — | Interfaces App Gestor (transversal) | AP | MVP |
| — | Interfaces Portal Educacional (transversal) | AP | MVP |
| — | Componentes reutilizáveis (transversal) | RP | MVP |

**Implementação de interface (AP) em:** UC3–UC4, UC16–UC48, UC56–UC58, UC63–UC70, UC67–UC68

---

### Eduardo Magno — UX / UI Designer

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| — | Design System (transversal) | RP | MVP |
| — | Protótipos de alta fidelidade (transversal) | RP | MVP |
| — | Layouts Strapi CMS customizados | AP | MVP |
| — | Layouts App Gestor | RP | MVP |
| — | Layouts Portal Educacional | RP | MVP |
| — | Layouts Painel de Dados (BI) | AP | MVP |

**Design de interface em todos os 75 UCs com tela.**

---

### Juvenal Coelho — Analista de Dados / BI

| UC | Caso de uso | Papel | Prioridade |
| -- | ----------- | ----- | ---------- |
| UC59 | Consultar Dashboard de Impacto (Painel de Dados) | RP | MVP |
| UC60 | Gerar Relatórios Quantitativos | RP | MVP |
| UC61 | Gerar Relatórios Qualitativos | RP | Fase 3 |
| UC62 | Consultar Base Legada de Participação | RP | Fase 3 |
| UC71 | Consolidar Totalizadores com Dados Pregressos | RP | Fase 3 |
| — | Modelo dimensional (transversal) | RP | MVP |
| — | Indicadores estratégicos (transversal) | RP | MVP |

**Apoio em:** UC22, UC28, UC47, UC56–UC58, UC65

---

### Mateus — Analista de Infraestrutura / DevOps

| Atividade | Papel | Prioridade |
| --------- | ----- | ---------- |
| Ambientes AWS (dev, homolog, produção) | RP | MVP |
| Pipelines CI/CD | RP | MVP |
| Deploy Strapi CMS | INF | MVP |
| Deploy Portal Educacional | INF | MVP |
| Deploy App Gestor | INF | MVP |
| Deploy Painel de Dados (BI) | INF | MVP |
| Deploy APIs e motor de mensageria | INF | MVP |
| Monitoramento e publicações | RP | MVP |

---

## Matriz consolidada: Caso de Uso × Equipe

| UC | Nome resumido | Plataforma | RP | AP | Prioridade |
| -- | ------------- | ---------- | -- | -- | ---------- |
| UC1 | Cadastrar Colaborador | Strapi | Alexandre | Dayvid | MVP |
| UC2 | Login Administrador | Strapi | Alexandre | Dayvid | MVP |
| UC3 | Login Gestor | App Gestor | Victor | José, Yann | MVP |
| UC4 | Login Empreendedora | Portal Educacional | Victor | Dayvid, José | MVP |
| UC5 | Roles e Permissões | Strapi | Alexandre | Yann | MVP |
| UC6 | Autenticação e Segurança | Strapi / API | Alexandre | Yann, Dayvid | MVP |
| UC7 | Cadastrar Programa | Strapi | Alexandre | Dayvid | MVP |
| UC8 | Modelar Programa e Módulos | Strapi | Alexandre | Victor | MVP |
| UC9 | Configurar Edição | Strapi | Alexandre | Victor | MVP |
| UC10 | Cadastrar Organização | Strapi | Alexandre | Dayvid | MVP |
| UC11 | Associar Organização à Edição | Strapi | Alexandre | Dayvid | MVP |
| UC12 | Critérios de Seleção | Strapi | Alexandre | Victor | MVP |
| UC13 | Beneficiamento e Certificação | Strapi | Alexandre | Victor | MVP |
| UC14 | Premiação (Textual) | Strapi | Alexandre | Victor | MVP |
| UC15 | Criar Módulo Educacional | Strapi | Alexandre | Victor | MVP |
| UC16 | Criar e Gerenciar Turma | App Gestor | Victor | Alexandre, José | MVP |
| UC17 | Alocar em Turma | App Gestor | Victor | José | MVP |
| UC18 | Transferir entre Turmas | App Gestor | Victor | José | MVP |
| UC19 | Pré-Cadastro | Portal Educacional | Victor | José, Alexandre | MVP |
| UC20 | Aceites LGPD/Cookies | Portal Educacional | Victor | José, Alexandre | MVP |
| UC21 | Inscrição Completa | Portal Educacional | Victor | José, Alexandre | MVP |
| UC22 | Histórico Legado / Recorrente | Portal Educacional | Victor | Juvenal, José | MVP |
| UC23 | Validar Elegibilidade | API / Motor | Yann | Victor, Alexandre | MVP |
| UC24 | Selecionar Participantes | App Gestor | Victor | José | MVP |
| UC25 | Comunicar Resultado Seleção | Mensageria | Dayvid | Victor, José | MVP |
| UC26 | Mini CRM (Leads) | App Gestor | Victor | José, Dayvid | Fase 3 |
| UC27 | Atualizar Dados Empreendedora | Portal / App Gestor | Victor | José | MVP |
| UC28 | Histórico de Participação | App Gestor | Victor | Juvenal, José | MVP |
| UC29 | Classificar Status | API / Motor | Yann | Victor | MVP |
| UC30 | Cancelamento / Desistência | App Gestor | Victor | José | MVP |
| UC31 | Gerenciar Negócio | App Gestor | Victor | José | MVP |
| UC32 | Mover entre Negócios | App Gestor | Victor | José | MVP |
| UC33 | Liberação Progressiva | API / Motor | Yann | Alexandre, Victor | MVP |
| UC34 | Calendário por Turma | App Gestor | Victor | José | MVP |
| UC35 | Conteúdo Extra | App Gestor | Victor | José | MVP |
| UC36 | Consumir Conteúdo | Portal Educacional | Victor | José | MVP |
| UC37 | Progresso em Videoaula | Portal Educacional | Victor | José, Yann | MVP |
| UC38 | Aula ao Vivo (YouTube) | Portal Educacional | Victor | José | MVP |
| UC39 | Responder Questionário | Portal Educacional | Victor | José | MVP |
| UC40 | Presença via QR Code | Portal Educacional | Victor | José | MVP |
| UC41 | Presença Manual | App Gestor | Victor | José | MVP |
| UC42 | Consultar Frequência | App Gestor | Victor | José | MVP |
| UC43 | Enviar Material/Evidência | Portal Educacional | Victor | José | MVP |
| UC44 | Avaliar Entrega | App Gestor | Victor | José | MVP |
| UC45 | Dados Financeiros Mensais | Portal Educacional | Victor | José | MVP |
| UC46 | Validar Dados Financeiros | App Gestor | Victor | José | MVP |
| UC47 | Indicadores Baseline/Endline | Portal / App Gestor | Victor | José, Juvenal | MVP |
| UC48 | Pesquisa NPS/Satisfação | Portal Educacional | Victor | José | MVP |
| UC49 | Mensagem Individual WhatsApp | Mensageria | Dayvid | Victor, José | MVP |
| UC50 | Comunicar para Grupo WhatsApp (Facilitador) | App Gestor | Victor | José, Alexandre | MVP |
| UC51 | Vídeo via WhatsApp | Mensageria | Dayvid | Victor | Fase 3 |
| UC52 | Mensagens Automáticas | Mensageria | Dayvid | Yann | MVP |
| UC53 | Lembrete Atividade Pendente | API / Motor | Yann | Dayvid | MVP |
| UC54 | Link com Autenticação | Mensageria | Dayvid | Victor, Yann | MVP |
| UC55 | Beneficiamento e Certificado | API / Motor | Yann | Dayvid, Victor | MVP |
| UC56 | Ranking e Engajamento | App Gestor | Victor | José, Juvenal | Fase 3 |
| UC57 | Registrar Premiação (Manual) | App Gestor | Victor | José | Fase 3 |
| UC58 | Capital Semente | App Gestor | Victor | José, Juvenal | Fase 3 |
| UC59 | Dashboard de Impacto (BI) | Painel de Dados | Juvenal | Alexandre, Victor | MVP |
| UC60 | Relatórios Quantitativos | Painel de Dados | Juvenal | Alexandre | MVP |
| UC61 | Relatórios Qualitativos | Painel de Dados | Juvenal | Alexandre | Fase 3 |
| UC62 | Base Legada (Consulta) | Painel de Dados | Juvenal | Alexandre, Dayvid | Fase 3 |
| UC63 | Certificado Autoatendimento | Portal Educacional | Victor | José, Dayvid | Fase 3 |
| UC64 | Chat de Dúvidas (IA) | API | Yann | Victor, José | Fase 3 |
| UC65 | Consumo Mensagens WhatsApp | Mensageria / BI | Dayvid | Juvenal, Victor | Fase 3 |
| UC66 | Cadastrar Unidade | Strapi | Alexandre | Victor | MVP |
| UC67 | Resgatar Sessão do Dispositivo (UUID) | Aplicativo Cliente / API | Victor | Yann, José | MVP |
| UC68 | Calendário Visual (Portal) | Portal Educacional | Victor | José | Fase 3 |
| UC69 | Inserir Dados em Nome | App Gestor | Victor | José, Yann | Fase 3 |
| UC70 | Registrar Mentoria | App Gestor | Victor | José, Alexandre | Fase 3 |
| UC71 | Totalizadores Pregressos | Painel de Dados | Juvenal | Alexandre, Yann | Fase 3 |
| UC72 | Alerta Compatibilidade Navegador | Portal Educacional | José | Victor | Fase 3 |
| UC73 | Cadastrar Voluntário/Mentor | Strapi | Alexandre | Victor | Fase 3 |
| UC74 | Ativar/Inativar Colaborador | Strapi | Alexandre | Victor | Fase 3 |
| UC75 | Migrar Colaborador entre Unidades | Strapi | Alexandre | Yann | Fase 3 |

---

## Cronograma sugerido por ondas (MVP)

### Onda 1 — Fundação (semanas 1–4)

| Entrega | UCs | Responsáveis |
| ------- | --- | ------------ |
| Infraestrutura e ambientes | Transversal | Mateus, Yann |
| Modelagem de dados e Strapi base | UC1–UC2, UC5–UC11, UC66 | Alexandre, Dayvid |
| Design System e protótipos | Transversal | Eduardo, Alexandre |
| APIs base e autenticação | UC3–UC6 | Yann, Victor, Dayvid |

### Onda 2 — Inscrição e seleção (semanas 5–8)

| Entrega | UCs | Responsáveis |
| ------- | --- | ------------ |
| Pré-inscrição e inscrição | UC19–UC22 | Victor, José, Eduardo |
| Módulos e turmas | UC12–UC18 | Alexandre, Victor |
| Seleção e comunicação | UC23–UC25 | Yann, Victor, Dayvid |

### Onda 3 — Aplicação do programa (semanas 9–14)

| Entrega | UCs | Responsáveis |
| ------- | --- | ------------ |
| Gestão de participantes | UC27–UC32 | Victor, José |
| Conteúdo e atividades | UC33–UC48 | Victor, José, Yann |
| Mensageria | UC49, UC52–UC54 | Dayvid, Victor |
| Comunicação grupo WhatsApp (manual) | UC50 | Victor, José |

### Onda 4 — Conclusão e BI (semanas 15–18)

| Entrega | UCs | Responsáveis |
| ------- | --- | ------------ |
| Beneficiamento e certificação | UC55 | Yann, Dayvid |
| Dashboard e relatórios | UC59–UC60 | Juvenal, Alexandre |
| Homologação e deploy | Transversal | Mateus, Yann, Alexandre |

### Onda 5 — Fase 3 (pós-MVP)

| Entrega | UCs | Responsáveis |
| ------- | --- | ------------ |
| Mini CRM, premiação, mentoria | UC26, UC56–UC58, UC70 | Victor, José |
| Complementares | UC51, UC63–UC65, UC68–UC75 | Conforme matriz |
| Chat IA | UC64 | Yann, Victor |

---

## Contagem final

| Prioridade | Quantidade |
| ---------- | :--------: |
| MVP | 54 |
| Fase 3 | 21 |
| **Total** | **75** |

---

_Documento gerado com base em `time_desenvolvimento.md` e `Casos de Uso - Consulado da Mulher_v2.md`._
