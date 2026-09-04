# Protótipo — Aplicativo Cliente

**Versão:** consolidado — ago/2026 (alinhado à v6)  
**Fontes:** [Casos de Uso v7](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md), [Design.md](../Design.md), reuniões jun–ago/2026

Documentação consolidada de interfaces do **Aplicativo Cliente** (pré-inscrita/empreendedora).

**Perfis:** **Pré-inscrita (Lead)** no fluxo de inscrição; **Empreendedora** após inscrição completa — autenticação exclusiva por **link mágico** (sem senha).  
**Plataforma:** Next.js, mobile-first.

**Destaques v6:** ficha unificada em **4 blocos** (modelo Empreender); **nome social**; dados sensíveis no meio da ficha com **"Prefiro não responder"**; renda por **salário mínimo** + valor exato + dependentes (per capita da régua); perguntas da **régua pontuável** (tempo de negócio, CLT, cargo público, internet, WhatsApp — visíveis se ativos; **não bloqueiam** cadastro); bloqueio só idade &lt; 18 e indisponibilidade P/H; aceites obrigatórios (LGPD, cookies, **WhatsApp** de comunicação); **alocação automática** em unidade/turma única; confirmação com **CTA imperativo WhatsApp** + prazo estimado; **desligamento** pela empreendedora (questionário + motivo — UC79); revalidação de consentimento LGPD (UC76).

## Índice de telas

1. Componentes globais
2. Landing da edição (slug)
3. Termos e consentimentos
4. Pré-cadastro
5. Inscrição — bloco 1: instruções
6. Inscrição — bloco 2: dados pessoais (nome social, dados sensíveis, CEP)
7. Inscrição — bloco 3: dados do empreendimento
8. Inscrição — bloco 4: dados econômicos (salário mínimo + valor exato)
9. Inscrição — formulário variável e aceites finais
10. Confirmação de inscrição (status "em seleção" + prazo estimado)
11. Entrada por link mágico
12. Home — programa e módulos
13. Calendário de atividades
14. Atividade — videoaula
15. Atividade — aula ao vivo
16. Atividade — teste / questionário
17. Atividade — presença via QR Code
18. Atividade — tarefa de casa
19. Atividade — dados financeiros mensais
20. Atividade — indicadores
21. Atividade — pesquisa de satisfação
22. Atividade — download
23. Atividade — link externo
24. Meu perfil
25. Meu histórico
26. Certificados
27. Solicitar desligamento (UC79)
28. Chat de dúvidas (IA)

---

| Campo | Valor |
| ----- | ----- |
| **Tipo** | Componentes transversais |
| **Perfil** | Empreendedora |
| **UCs** | UC72 |
| **Prioridade** | MVP |

---

## Objetivo

Elementos reutilizados em todas as telas autenticadas e no fluxo de inscrição.

---

## Componentes

### Header autenticado

- Logo Consulado da Mulher
- Nome da edição/programa (truncado em mobile)
- Menu hambúrguer: Home, Calendário, Meu perfil, Meu histórico, Certificados, Sair

### Barra de progresso (inscrição)

- Etapas (4 blocos + confirmação): Pré-cadastro → Instruções → Dados pessoais → Empreendimento → Dados econômicos → Aceites → Confirmação
- Indicador "Etapa X de N"

### Card de atividade

- Título, tipo (ícone), status: liberada | em andamento | concluída | aguardando aprovação | em revisão | bloqueada
- Badge de atenção (**Revisar** — UC44)
- Barra de progresso do módulo

### Alerta compatibilidade navegador (UC72)

- Banner não bloqueante no topo se navegador incompatível
- Texto: recomenda Chrome, Safari ou Firefox atualizados
- Link "Continuar mesmo assim"

### Toast / notificações

- Sucesso, erro, aviso (ex.: sessão expirada — solicitar novo link mágico)

### Estados vazios

- Ilustração + texto orientativo + CTA quando aplicável

---

## Regras

- Layout mobile-first; largura máxima ~480px no fluxo de inscrição
- Contraste WCAG AA mínimo
- Sem campo de senha em qualquer tela

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]` |
| **Perfil** | Lead / Empreendedora (público) |
| **UCs** | UC19, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Ponto de entrada via URL pública da edição. Consulta **UUID** no localStorage (UC67) e redireciona: inscrição pendente, home da edição (já cadastrada) ou pré-cadastro.

---

## Ações

| Ação | Comportamento |
| ---- | ------------- |
| Iniciar inscrição | Sem UUID → UC19. Com UUID mas inscrição incompleta → UC21 (etapa pendente) |
| Já cadastrada | UUID válido + sessão → home da edição (`/app/edicao/[id]`) |
| Continuar inscrição | UUID/progresso incompleto → retoma UC21 |

---

## Estados

| Estado | Exibição |
| ------ | -------- |
| Inscrições abertas | CTA ativo |
| Inscrições encerradas | Mensagem informativa; sem CTA |
| Edição não encontrada | 404 amigável |
| Pré-inscrição detectada | Botão "Continuar inscrição" |
| UUID válido (inscrição OK) | Redirect automático para home ou destino da URL |

---

## Navegação

- **Próximo:** pré-cadastro ou retomada da inscrição (blocos 1–4)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | Modal / etapa embutida em `/e/[slug]/...` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC20 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar aceites na **base de consentimentos** (LGPD). Aceites **obrigatórios** (LGPD, cookies/armazenamento, **WhatsApp**) e aceites específicos (dados sensíveis, uso de imagem/divulgação, comunicados gerais, regulamento por link/PDF).

---

## Wireframe

```
┌─────────────────────────────────┐
│  Termos e privacidade           │
├─────────────────────────────────┤
│  [scroll] Texto LGPD resumido   │
│  Obrigatórios:                  │
│  [ ] Li e aceito a Política de  │
│      Privacidade (LGPD) *       │
│  [ ] Aceito cookies e           │
│      armazenamento local *      │
│  [ ] Autorizo contato via       │
│      WhatsApp *                 │
│  Opcionais / específicos:       │
│  [ ] Autorizo tratamento de     │
│      dados sensíveis            │
│  [ ] Autorizo uso de imagem e   │
│      divulgação                 │
│  [ ] Aceito receber comunicados │
│      gerais do Consulado        │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

> O **aceite do regulamento** (link/PDF) é apresentado ao **final da inscrição** (bloco de aceites — tela 9).

---

## Regras

- **Obrigatórios** (LGPD, cookies/armazenamento, **WhatsApp**) — o não preenchimento de qualquer um **bloqueia** o avanço (reuniões 13/15 jul.)
- **Dados sensíveis**: se não autorizado, o dado é gravado como **"não informado"** e não é exibido em perfil nem no BI
- Cookies/localStorage recusados — fluxo permitido sem retomada automática (UC67)
- Registrar na base de consentimentos: **data/hora, versão do termo, finalidade, dispositivo** (base para anonimização/revalidação — UC76)
- **Revalidação (UC76)**: consentimento expirado (5 anos após o aceite) exige novo aceite ao retornar

---

## Navegação

- Embutido em pré-cadastro e inscrição
- **Anterior:** landing | **Próximo:** pré-cadastro ou inscrição

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/pre-cadastro` |
| **Perfil** | Lead |
| **UCs** | UC19, UC20, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Capturar lead mínimo (nome, telefone, e-mail) e os **aceites obrigatórios** (LGPD, cookies, **WhatsApp**) antes do formulário completo. O aceite de **WhatsApp é obrigatório** aqui para permitir o resgate de inscrições incompletas (UC26/UC19).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●○○○○  Etapa 1                 │
├─────────────────────────────────┤
│  Pré-cadastro                   │
│  Preencha para começar sua      │
│  inscrição no programa.         │
├─────────────────────────────────┤
│  Nome completo *                │
│  [________________________]     │
│  Telefone (DDD) *               │
│  [(__) _____-____]              │
│  E-mail *                       │
│  [________________________]     │
├─────────────────────────────────┤
│  [bloco termos UC20 —           │
│   LGPD + cookies + WhatsApp *]  │
├─────────────────────────────────┤
│  [ Continuar ]                  │
└─────────────────────────────────┘
```

---

## Validações

- Nome: mínimo 3 caracteres
- Telefone: formato BR com DDD
- E-mail: formato válido

---

## Pós-ação

- Grava lead "pré-cadastro concluído" na base de leads
- Persiste identificador no **localStorage**
- Se a inscrição **não for concluída**, o Backend pode disparar alerta `inscription_incomplete` (UC87); Mini CRM (UC26) permite reforço **manual** (e-mail prioritário; WhatsApp opcional)
- Redireciona para inscrição completa (UC21)

---

## Navegação

- **Anterior:** [01-landing-edicao.md](01-landing-edicao.md)
- **Próximo:** inscrição completa (blocos 1–4)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/instrucoes` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21 |
| **Prioridade** | MVP |

---

## Objetivo

**Bloco 1 — Instruções.** Orientar o preenchimento da **ficha unificada** (modelo Empreender): tempo estimado, dados necessários e o caráter das perguntas (não há resposta certa/errada). Em **presencial/híbrido**, pergunta de **disponibilidade** no início (**bloqueio de cadastro** — UC12). **Internet** e **WhatsApp** **não** aparecem aqui como critério que impede cadastro.

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●○○○  Bloco 1 — Instruções     │
├─────────────────────────────────┤
│  Antes de começar               │
│  • Leva ~10 min                 │
│  • Tenha em mãos CPF e dados    │
│    do seu negócio               │
│  • Suas respostas não têm       │
│    certo ou errado              │
│  • Você pode retomar depois     │
│    pelo mesmo link              │
├─────────────────────────────────┤
│  P/H — Disponibilidade *        │
│  Você pode participar dos       │
│  encontros presenciais?         │
│  ( ) Sim  ( ) Não               │
│  Preferência: ( ) Manhã ( ) Tarde│
│  ℹ Preferência é informativa    │
├─────────────────────────────────┤
│  [ Voltar ]    [ Começar ]      │
└─────────────────────────────────┘
```

---

## Regras

- **P/H:** se responder **Não** à disponibilidade → aviso + confirmação; se recusar, **encerra o cadastro** (não pontua).
- **Internet / WhatsApp:** **não** bloqueiam inscrição; perguntas da régua nos blocos 3–4, se os critérios estiverem ativos na edição.

---

## Navegação

- **Anterior:** pré-cadastro | **Próximo:** bloco 2 — dados pessoais

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/pessoal` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21, UC22 |
| **Prioridade** | MVP |

---

## Objetivo

**Bloco 2 — Dados pessoais.** Coletar identificação (incluindo **nome social**), documento, endereço via CEP e **dados sensíveis no meio da ficha** (opção **"Prefiro não responder"**). A **unidade não é escolhida** pela empreendedora: a alocação é **automática** (unidade/turma única) ou definida pelo Gestor de Unidade (UC17).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●●○○  Bloco 2 — Dados pessoais │
├─────────────────────────────────┤
│  Nome de registro *             │
│  [________________________]     │
│  Nome social (como prefere ser  │
│  chamada)                       │
│  [________________________]     │
│  CPF * (ou RNE p/ estrangeira)  │
│  [___.___.___-__]               │
│  Data de nascimento *           │
│  ℹ Menor de 18: cadastro        │
│     encerrado (UC12)            │
│  CEP *  [_____-___] [Buscar]    │
│  Endereço, bairro, cidade, UF   │
│  (auto-preenchido pelo CEP)     │
├─────────────────────────────────┤
│  Dados sensíveis (meio da ficha)│
│  Raça/cor, deficiência, etc.    │
│  ( ) informar  ( ) Prefiro não  │
│      responder                  │
├─────────────────────────────────┤
│  ℹ Histórico em programas       │  ← somente leitura (UC22/62)
│  anteriores (via hash de CPF)   │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Campos principais

| Campo | Regra |
| ----- | ----- |
| Nome de registro | Obrigatório |
| Nome social | Opcional; usado como nome de exibição no app quando informado |
| CPF | Validação; **hash (HMAC)** no backend; recorrente identificado pelo hash |
| RNE | Alternativa para estrangeiras |
| CEP | Valida elegibilidade geográfica; auto-preenche endereço |
| Dados sensíveis | Coletados no meio da ficha com aceite (UC20); **"Prefiro não responder"** grava "não informado" e não entra no BI |
| Data de nascimento | **Bloqueio** se idade &lt; 18 (UC12; não pontua) |

---

## Fluxos alternativos

- **Menor de 18 anos:** encerra inscrição (bloqueio de cadastro — UC12)
- **Recorrente (UC22):** identificação por **hash de CPF** contra a base (ativa + legada pré-anonimizada — UC62); a pergunta "já participou?" tende a ser dispensada
- **Edição encerrada durante preenchimento:** bloqueia envio com mensagem

---

## Navegação

- **Anterior:** bloco 1 — instruções | **Próximo:** bloco 3 — dados do empreendimento

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/empreendimento` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21 |
| **Prioridade** | MVP |

---

## Objetivo

**Bloco 3 — Dados do empreendimento.** Caracterizar o negócio: formalização (filtro, **não pontua**), segmento, **tempo de negócio** (critério 1 da régua, se ativo), **acesso à internet** e **WhatsApp** (critérios 5 e 6, se ativos — **não bloqueiam** inscrição).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●●●○  Bloco 3 — Empreendimento │
├─────────────────────────────────┤
│  Possui negócio próprio? *      │
│  ( ) Sim  ( ) Não (ideia)       │
│  Nome do negócio                │
│  Formalização * (não pontua)    │
│  ( ) Informal ( ) MEI ( ) ME    │
│  CNPJ * se MEI ou ME            │
│  Segmento / ramo de atividade * │
│  Tempo de negócio * (régua, se  │
│  ativo)                         │
│  ( ) Menos de 6 meses           │
│  ( ) 6 meses a 1 ano            │
│  ( ) Mais de 1 ano              │
│  Tem acesso à internet? *       │
│  (régua, se ativo — não bloqueia)│
│  ( ) Sim  ( ) Não               │
│  ( ) Internet móvel no celular  │
│  Tem WhatsApp? *                │
│  (régua, se ativo — não bloqueia)│
│  ( ) Sim  ( ) Não               │
│  Redes sociais / site (opcional)│
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Regras

- CNPJ obrigatório quando formalização = MEI ou ME
- **Segmento de atividade** alimenta relatórios e o **gráfico por segmento** (UC56)
- Formalização **não pontua** (UC12)
- Tempo de negócio, internet e WhatsApp: visíveis **se o critério estiver ativo** na edição; respostas negativas **não** encerram o cadastro (UC23 pontua depois)
- Campos da régua omitidos quando o critério está inativo

---

## Navegação

- **Anterior:** bloco 2 — dados pessoais | **Próximo:** bloco 4 — dados econômicos

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/economico` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21, UC12, UC23 |
| **Prioridade** | MVP |

---

## Objetivo

**Bloco 4 — Dados econômicos.** Coletar renda familiar + dependentes para **renda per capita** (critério 2 da régua, se ativo), **CLT** e **cargo público** (critérios 3 e 4, se ativos). Score **X/Y** calculado no backend (UC23) — apoia a qualificação no Gestor; **não** há aprovação automática. Distinto da elegibilidade à doação (UC14/UC85).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●●●●  Bloco 4 — Dados econôm.  │
├─────────────────────────────────┤
│  Renda familiar mensal *        │
│  ( ) Até 1 salário mínimo       │
│  ( ) 1 a 2 salários mínimos     │
│  ( ) 2 a 3 salários mínimos     │
│  ( ) Acima de 3                 │
│  Valor aproximado (R$, opcional)│
│  [___________]                  │
│  Nº de pessoas na casa *        │
│  Nº de dependentes *            │
│  ℹ Per capita = renda ÷ pessoas │
│     (critério 2, se ativo)      │
│  Tem carteira assinada (CLT)? * │
│  (régua, se ativo)              │
│  ( ) Sim  ( ) Não               │
│  É funcionária pública? *       │
│  (régua, se ativo)              │
│  ( ) Sim  ( ) Não               │
│  Faturamento mensal do negócio  │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Regras

- Faixas de renda por **salário mínimo nacional** (parametrizável); campo de **valor exato** opcional
- Backend calcula **renda per capita** (renda ÷ pessoas na casa) para o critério 2 da régua (UC12/UC23)
- CLT e cargo público visíveis **se ativos** na edição; **não ter** CLT / **não ser** funcionária pública = 1 ponto cada
- Validações de consistência básica (renda × faturamento)
- Internet e WhatsApp **não** são critério fixo de bloqueio neste bloco nem no cadastro

---

## Navegação

- **Anterior:** bloco 3 — empreendimento | **Próximo:** formulário variável e aceites finais

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/programa` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21 |
| **Prioridade** | MVP |

---

## Objetivo

Coletar o **formulário variável** da edição (perguntas específicas) e registrar os **aceites finais** — especialmente o **regulamento** (por link/PDF) e o uso de imagem/divulgação.

---

## Wireframe

```
┌─────────────────────────────────┐
│  Formulário e aceites finais    │
├─────────────────────────────────┤
│  [Campos variáveis da edição]   │
│  Ex.: motivação, expectativas,  │
│  como conheceu o programa       │
├─────────────────────────────────┤
│  [ ] Li e aceito o regulamento  │
│      desta edição *             │
│  [ Ver regulamento (PDF) ↗ ]    │
│  [ ] Autorizo uso de imagem e   │
│      divulgação                 │
├─────────────────────────────────┤
│  [ Voltar ]    [ Finalizar ]    │
└─────────────────────────────────┘
```

---

## Pós-ação

- Backend gera o **identificador automático (ID)** da inscrição
- **Alocação automática** em unidade/turma única (UC17); caso contrário, fica pendente para o Gestor de Unidade
- Status: "finalizada — **em seleção**"
- Aceites gravados na **base de consentimentos** (UC20)
- Dispara cálculo de elegibilidade/score (UC23): bloqueios de cadastro já aplicados (idade / disponibilidade P/H); score **X/Y** só da régua pontuável (internet e WhatsApp pontuam se ativos; **não** bloqueiam)

---

## Navegação

- **Anterior:** bloco 4 — dados econômicos | **Próximo:** confirmação de inscrição

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/confirmacao` |
| **Perfil** | Empreendedora (inscrita) |
| **UCs** | UC21 |
| **Prioridade** | MVP |

---

## Objetivo

Confirmar envio da inscrição, mostrar o **ID** gerado, orientar o **1º contato WhatsApp** (número da organização no Strapi) e o **prazo estimado** de resultado.

---

## Wireframe

```
┌─────────────────────────────────┐
│  ✓  Inscrição enviada!          │
├─────────────────────────────────┤
│  ●●●●●  Concluído               │
│                                 │
│  Sua inscrição foi registrada   │
│  com sucesso.                   │
│                                 │
│  ID da inscrição: #2027-000123  │
│  Programa: [nome]               │
│  Edição: [nome]                 │
│  Unidade: [alocada auto/def.]   │
│  Status: Em seleção             │
├─────────────────────────────────┤
│  Próximo passo — WhatsApp       │
│  Fale agora no WhatsApp para    │
│  confirmar sua inscrição:       │
│  (11) 9xxxx-xxxx                │
│  [ Falar no WhatsApp agora ]    │
│       ← wa.me (CTA imperativo)  │
│  Texto sugerido: "Quero         │
│  confirmar minha inscrição no   │
│  [nome da edição]"              │
│  ℹ Você receberá a confirmação  │
│    automática de inscrição      │
├─────────────────────────────────┤
│  Resultado previsto até:        │
│  [dd/mm] (prazo estimado)       │
│  Aprovadas serão avisadas por   │
│  WhatsApp (comunicação manual). │
├─────────────────────────────────┤
│  [ Ir para página inicial ]     │
└─────────────────────────────────┘
```

---

## Regras

- **Número WhatsApp da organização** vem do CMS (Strapi) — global ou por edição
- CTA **imperativo** abre `wa.me` / deep link com texto pré-preenchido; o **inbound** dispara o **template Meta de inscrição** da edição (**não** inicia a jornada educacional)
- **Prazo estimado** calculado a partir da data de encerramento das inscrições/seleção da edição
- **Comunicação de aprovação** é disparo manual pelo Gestor de Unidade (UC25) — inicia jornada online / convite ao grupo em P/H
- Não aprovadas: **CPF anonimizado** após o encerramento, conforme regra LGPD (UC76)
- Programa Pílulas: pode exibir aprovação imediata se configurado
- Ao concluir UC21, backend emite **UUID** e persiste no localStorage (UC67)
- Retornos futuros pelo slug reconhecem participante pelo UUID (sem reiniciar inscrição)

---

## Navegação

- Fim do fluxo público de inscrição

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/auth/magic?token=...&turma_id=&atividade_id=&acao=` |
| **Perfil** | Empreendedora |
| **UCs** | UC4, UC54, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Validar token de sessão e autenticar. Persiste **UUID de dispositivo** no localStorage (UC67). Se URL contiver `turma_id`, `atividade_id` e `acao` (ex.: `presenca`), executa ação automaticamente quando sessão válida.

---

## Regras

- Token único por participante/sessão
- Sessão ativa até **30 dias** no dispositivo
- Após auth: grava/atualiza **UUID** no localStorage (UC67)
- **Deep link**: `acao=presenca` → UC40 automático; `acao=videoaula` → abre atividade
- UUID + sessão válidos **sem token na URL**: resolve participante via `GET /sessao/dispositivo/{uuid}`
- CPF (HMAC) como chave no backend — UUID opaco no cliente

---

## Navegação

- **Sucesso:** [09-home-programa.md](09-home-programa.md) ou atividade alvo

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app` ou `/app/edicao/[id]` |
| **Perfil** | Empreendedora |
| **UCs** | UC36, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Tela principal após autenticação: visão do programa, módulos, progresso geral e atividades liberadas.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [≡]  Olá, Maria!        [📅]   │
├─────────────────────────────────┤
│  Programa X — Edição 2027       │
│  Unidade: Centro | Turma: A     │
│  Status: Em assessoria          │
│  ████████░░  72% concluído      │
├─────────────────────────────────┤
│  Próxima atividade              │
│  ┌─────────────────────────┐    │
│  │ 📹 Videoaula 3          │    │
│  │ Liberada — Iniciar →    │    │
│  └─────────────────────────┘    │
├─────────────────────────────────┤
│  Módulos                        │
│  ▼ Módulo 1 — Fundamentos  ✓    │
│    • Videoaula 1        ✓       │
│    • Teste 1            ✓       │
│    • Tarefa casa        ⚠       │  ← aguardando aprovação
│  ▼ Módulo 2 — Vendas      ○     │
│    • Videoaula 2        ○       │
│    • Dados financeiros  🔒      │
├─────────────────────────────────┤
│  [ Calendário ]  [ Meu perfil ] │
└─────────────────────────────────┘
```

---

## Elementos

- Badge de status da participante (UC29)
- Cards de atividade com ícone por tipo (UC15) e **prazo** quando aplicável (ex.: liberada após encontro presencial com **48h** ou prazo predeterminado — UC34)
- Indicador de atenção em entregas **em revisão** (UC44)
- Atividades bloqueadas até conclusão da anterior (online sequencial)

---

## Navegação

- Cada atividade → tela específica (11–20)
- Calendário → [10-calendario-atividades.md](10-calendario-atividades.md)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/calendario` |
| **Perfil** | Empreendedora |
| **UCs** | UC68, UC34 |
| **Prioridade** | MVP |

---

## Objetivo

Visualizar cronograma da turma: encontros presenciais, lives, prazos de entrega.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Calendário                │
├─────────────────────────────────┤
│  < Junho 2027 >                 │
│  D  S  T  Q  Q  S  S            │
│        1  2  3  4  5  6          │
│  7  8  9 10 11 12 13            │
│ 14 15●16 17 18 19 20            │
├─────────────────────────────────┤
│  15/06 — Encontro presencial    │
│  Local: Rua X, 100 — 14h        │
│  [ Ver detalhes ] [ Check-in QR]│
│  ─────────────────────────────  │
│  16/06 — Live YouTube           │
│  Tema: Precificação — 19h       │
│  [ Acessar live ]               │
│  ─────────────────────────────  │
│  20/06 — Prazo tarefa de casa   │
└─────────────────────────────────┘
```

---

## Modos de visualização

- Mês (padrão mobile)
- Lista semanal (alternativa)

---

## Ações

- Toque no evento → detalhe ou atividade correspondente
- Encontro presencial → [14-atividade-presenca-qrcode.md](14-atividade-presenca-qrcode.md)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: videoaula) |
| **Perfil** | Empreendedora |
| **UCs** | UC36, UC37 |
| **Prioridade** | MVP |

---

## Objetivo

Assistir videoaula no YouTube e registrar progresso para conclusão e certificação.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Videoaula: Precificação   │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │   [Player YouTube]      │    │
│  └─────────────────────────┘    │
│  Progresso: ██████░░  65%       │
│  Meta para conclusão: 70%         │
├─────────────────────────────────┤
│  Descrição e materiais            │
│  [ PDF complementar ]           │
├─────────────────────────────────┤
│  [ Marcar como concluída ]      │  ← habilitado ao atingir meta
└─────────────────────────────────┘
```

---

## Regras

- Engajamento = conclusão da atividade (meta % configurável, ex. 70%)
- Ao concluir: desbloqueia próxima etapa (jornada online sequencial)
- Player embed YouTube responsivo

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: live) |
| **Perfil** | Empreendedora |
| **UCs** | UC38 |
| **Prioridade** | MVP |

---

## Objetivo

Participar de transmissão ao vivo. **P/H:** aula (Meet ou local), presença no acesso. **Online — Live de Encerramento (UC38):** só com **100%** das atividades; stream **fora** da plataforma (YouTube); **sem** campo de KW nesta tela.

Após a live online: atividade de **presença/KW** → depois **questionário final** (liberação = **100% certo**). Detalhe: [12-atividade-aula-ao-vivo.md](aplicativo-cliente/12-atividade-aula-ao-vivo.md) · [26-presenca-palavra-chave.md](aplicativo-cliente/26-presenca-palavra-chave.md) · [13b-questionario-final-doacao.md](aplicativo-cliente/13b-questionario-final-doacao.md).

---

## Wireframe — Live de encerramento (online)

```
┌─────────────────────────────────┐
│  [←]  Live de encerramento      │
├─────────────────────────────────┤
│  ✓ 100% concluído — pode assistir│
│  🔴 AO VIVO — 19/06 19h         │
│  [ Abrir no YouTube ]           │
│  ℹ Após a live: confirme a      │
│    presença com a palavra-chave │
└─────────────────────────────────┘
```

**Não** embutir KW nem quiz nesta tela. Pós-live: KW (timestamp, prazo) → quiz 100%. Liberada ≠ garantia de doação. Recibo/PIX: [27-doacao-pix-recibo.md](aplicativo-cliente/27-doacao-pix-recibo.md).

---

## Estados

| Estado | UI |
| ------ | -- |
| Agendada | Countdown + "Adicionar ao calendário" |
| Ao vivo | Link YouTube / Meet / local |
| Encerrada | Replay se houver; online segue para KW |
| Bloqueada online | Conclua 100% das atividades |

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: teste/resposta aberta) |
| **Perfil** | Empreendedora |
| **UCs** | UC39 |
| **Prioridade** | MVP |

---

## Objetivo

Responder questões de múltipla escolha ou abertas com feedback educativo imediato.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Teste — Módulo 1          │
│  Questão 2 de 5                 │
├─────────────────────────────────┤
│  Qual a melhor forma de         │
│  calcular o preço de venda?     │
│  ( ) Opção A                    │
│  ( ) Opção B                    │
│  ( ) Opção C                    │
├─────────────────────────────────┤
│  [ Confirmar resposta ]         │
├─────────────────────────────────┤
│  ✓ Feedback: A opção correta... │  ← após confirmar
│  [ Próxima questão ]            │
└─────────────────────────────────┘
```

---

## Regras

- Feedback explicativo após cada resposta — **sem nota numérica** ao participante
- Pontuação interna opcional (gestor — UC56)
- Resposta incompleta bloqueia envio final
- Ao finalizar: atividade marcada como concluída

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/...?turma_id=&atividade_id=&acao=presenca` ou scanner QR |
| **Perfil** | Empreendedora |
| **UCs** | UC40, UC67, UC54 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar presença via **QR Code** ou **deep link**. Com **UUID + sessão válidos** (UC67), presença registrada **automaticamente** ao abrir o link — exibe apenas confirmação.

---

## Wireframe — Deep link (UUID válido)

```
┌─────────────────────────────────┐
│  ✓  Presença registrada!          │
│  Encontro: Módulo 2 — Aula 3    │
│  15/06/2027 — 14h05             │
│  Turma A — Unidade Centro       │
└─────────────────────────────────┘
```

---

## Wireframe — QR Code (sem UUID ou fallback)

```
┌─────────────────────────────────┐
│  [←]  Registrar presença        │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │   [Câmera / Scanner QR] │    │
│  └─────────────────────────┘    │
│  Aponte para o QR do gestor     │
└─────────────────────────────────┘
```

---

## Regras

- URL/QR: `turma_id` + `atividade_id` + `acao=presenca` (UC54)
- **UUID + sessão OK**: registro automático, sem scanner (UC67)
- **Sem UUID/sessão**: autentica via token na URL (UC4) → registra → persiste UUID
- Alternativa: gestor UC41

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: tarefa_casa) |
| **Perfil** | Empreendedora |
| **UCs** | UC43, UC44 |
| **Prioridade** | MVP |

---

## Objetivo

Enviar documentos/fotos da tarefa de casa para aprovação do gestor de turma.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Tarefa de casa            │
│  Status: Aguardando aprovação   │  ← ou Reprovada ⚠
├─────────────────────────────────┤
│  Descrição da atividade         │
│  [texto do gestor/CMS]          │
├─────────────────────────────────┤
│  ⚠ Observação do gestor:        │  ← se em revisão
│  "Refaça com foto do produto"   │
├─────────────────────────────────┤
│  Arquivos enviados              │
│  📷 foto1.jpg  [x]              │
│  [ + Adicionar arquivo ]        │
│  Máx: 5 arquivos, 10MB cada     │
├─────────────────────────────────┤
│  [ Enviar para avaliação ]      │
└─────────────────────────────────┘
```

---

## Regras

- Aprovação **obrigatória** do gestor (UC44)
- Reprovação: notificação WhatsApp/e-mail + badge de atenção na home
- Permite reenvio até aprovação
- Gestor pode inserir em nome da participante (UC69)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: dados_financeiros) |
| **Perfil** | Empreendedora |
| **UCs** | UC45, UC44 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar dados financeiros do mês de referência para acompanhamento de impacto.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Dados financeiros         │
│  Mês de referência: Maio/2027   │
│  Status: Aprovado ✓             │
├─────────────────────────────────┤
│  Faturamento (R$) *             │
│  [___________]                  │
│  Renda pessoal (R$) *           │
│  Investimento no negócio (R$)   │
│  Poupança (R$)                  │
│  Despesas fixas (R$)            │
│  Nº de clientes                 │
│  Nº de produtos vendidos        │
├─────────────────────────────────┤
│  Quão difícil foi preencher? *  │
│  [😣] [🙁] [😐] [🙂] [😄]         │
│  muito difícil … muito fácil    │
├─────────────────────────────────┤
│  Documentos comprobatórios      │
│  [ + Anexar ]                   │
├─────────────────────────────────┤
│  [ Enviar para avaliação ]      │
└─────────────────────────────────┘
```

---

## Regras

- Coleta **mensal** recorrente pelo Cliente (reporte ao programa — não é fluxo de caixa pessoal)
- Validação: renda ≤ faturamento (alerta se inconsistente)
- Valor **0** em faturamento ou renda: **observação obrigatória**
- Mês sem movimento: permite zeros com justificativa
- **Dificuldade** obrigatória (5 níveis com emoticon); visível ao gestor na aprovação e no resumo da turma
- Aprovação obrigatória gestor (UC44/UC46); gestor pode marcar **revisão**
- Acessível também via link mágico WhatsApp (UC54)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: indicadores) |
| **Perfil** | Empreendedora |
| **UCs** | UC47 |
| **Prioridade** | MVP |

---

## Objetivo

Preencher formulário de indicadores qualitativos/quantitativos em momentos configurados (início, meio, fim).

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Indicadores — Baseline    │
├─────────────────────────────────┤
│  Momento: Início do programa    │
│  Preencha com atenção. Não há   │
│  respostas certas ou erradas.   │
├─────────────────────────────────┤
│  [Perguntas padronizadas da     │
│   edição — escalas, múltipla    │
│   escolha, texto aberto]        │
├─────────────────────────────────┤
│  [ Salvar rascunho ]            │
│  [ Enviar ]                     │
└─────────────────────────────────┘
```

---

## Regras

- Associa respostas ao momento (baseline/endline)
- Gestor pode auxiliar preenchimento (UC69) se necessário
- Dados alimentam relatórios qualitativos (UC61)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: pesquisa) |
| **Perfil** | Empreendedora |
| **UCs** | UC48 |
| **Prioridade** | MVP |

---

## Objetivo

Avaliar curso, aulas e oficinas em escala 0–5 ou NPS.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Pesquisa de satisfação    │
├─────────────────────────────────┤
│  De 0 a 10, o quanto você       │
│  recomendaria este programa?    │
│  [0][1][2]...[10]               │
├─────────────────────────────────┤
│  Avalie o módulo de vendas:     │
│  ☆ ☆ ☆ ☆ ☆  (0-5)               │
├─────────────────────────────────┤
│  Comentários (opcional)         │
│  [________________________]     │
├─────────────────────────────────┤
│  [ Enviar avaliação ]           │
└─────────────────────────────────┘
```

---

## Regras

- Pode ser liberada via link mágico isolado
- Consolidação por turma/edição no BI

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: download) |
| **Perfil** | Empreendedora |
| **UCs** | UC36 |
| **Prioridade** | MVP |

---

## Objetivo

Baixar PDF, planilha ou guia educacional e registrar conclusão da atividade.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Ferramenta: Planilha      │
│       de fluxo de caixa         │
├─────────────────────────────────┤
│  Descrição do material          │
├─────────────────────────────────┤
│  📄 planilha-fluxo-caixa.xlsx   │
│  [ Baixar arquivo ]             │
├─────────────────────────────────┤
│  [ Marcar como concluída ]      │
└─────────────────────────────────┘
```

---

## Regras

- Download registrado como engajamento no **Aplicativo Cliente** (baixou / marcou como concluída)
- Arquivos hospedados no backend/CMS
- **Online:** após o OK da jornada, o mesmo material é **enviado no WhatsApp** (template Download + arquivos) **e** permanece nesta tela
- Receber o arquivo no WhatsApp **não** conclui a atividade por si só

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: link_externo) |
| **Perfil** | Empreendedora |
| **UCs** | UC36 |
| **Prioridade** | MVP |

---

## Objetivo

Direcionar a recurso externo e registrar conclusão ao retornar ou confirmar acesso.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Atividade complementar    │
├─────────────────────────────────┤
│  Acesse o conteúdo no link       │
│  abaixo e retorne para marcar   │
│  como concluída.                │
├─────────────────────────────────┤
│  [ Abrir link externo ↗ ]       │
├─────────────────────────────────┤
│  [ Já acessei — Concluir ]      │
└─────────────────────────────────┘
```

---

## Regras

- Abre em nova aba (aviso de saída do app)
- Registro de clique e conclusão manual

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/perfil` |
| **Perfil** | Empreendedora |
| **UCs** | UC27 |
| **Prioridade** | MVP |

---

## Objetivo

Visualizar e editar dados cadastrais, exceto CPF validado.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meu perfil                │
├─────────────────────────────────┤
│  Nome de registro: Maria Silva  │
│  Nome social: Mari  (editável)  │
│  CPF: ***.***.***-**  🔒        │  ← não editável
│  E-mail *                       │
│  [________________________]     │
│  Telefone (DDD) *               │
│  [(__) _____-____]              │
│  Endereço (CEP, rua, etc.)      │
│  Unidade: Centro (somente leitura│
│  para empreendedora)            │
├─────────────────────────────────┤
│  Programa / Edição / Turma      │
│  (somente leitura)              │
├─────────────────────────────────┤
│  [ Salvar alterações ]          │
│  [ Solicitar desligamento ]     │  → UC30/UC79
└─────────────────────────────────┘
```

---

## Regras

- CPF validado: **bloqueado** para edição pela empreendedora
- **Nome social**: editável; usado como nome de exibição no app
- Unidade: somente **Gestor de Unidade** altera/move (UC17/UC18) — Gestor de Turma não move
- Vínculos programa/edição/unidade/turma preservados

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/historico` |
| **Perfil** | Empreendedora |
| **UCs** | UC28 |
| **Prioridade** | MVP |

---

## Objetivo

Linha do tempo dos programas, edições, status e certificações da própria participante.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meu histórico             │
├─────────────────────────────────┤
│  2027 — Programa Empreenda      │
│  Edição 1º semestre             │
│  Status: Em assessoria          │
│  Unidade Centro | Turma A       │
│  ─────────────────────────────  │
│  2024 — Programa X (legado)     │
│  Status: Certificada            │
│  ─────────────────────────────  │
│  2019 — Programa Y (legado)     │
│  Status: Beneficiada            │
└─────────────────────────────────┘
```

---

## Regras

- Consolida base ativa + consulta legada (somente leitura para dados antigos)
- Reconhecimento de participações anteriores por **hash de CPF** (base legada pré-anonimizada — UC62)
- Sem edição nesta tela

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/certificados` |
| **Perfil** | Empreendedora |
| **UCs** | UC63, UC55 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar e baixar certificados emitidos automaticamente quando critérios de UC13 forem atendidos.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meus certificados         │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ 🎓 Certificado          │    │
│  │ Programa Empreenda 2027 │    │
│  │ Emitido: 15/08/2027     │    │
│  │ [ Baixar PDF ]          │    │
│  └─────────────────────────┘    │
├─────────────────────────────────┤
│  Nenhum certificado pendente.   │
│  Continue suas atividades!      │
└─────────────────────────────────┘
```

---

## Regras

- PDF gerado pelo backend (UC55)
- Disponível após classificação como certificada
- Envio também pode ocorrer via WhatsApp (Gupshup)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/desligamento` (empreendedora) |
| **Perfil** | Empreendedora (quando habilitado) |
| **UCs** | UC30, UC79, UC29 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar solicitação de **desligamento** (desistência/cancelamento) com **motivo padronizado**, campo aberto e **data do desligamento** (pode ser retroativa).

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Solicitar desligamento    │
├─────────────────────────────────┤
│  Tem certeza? Esta ação encerra │
│  sua participação ativa.        │
├─────────────────────────────────┤
│  Tipo *                         │
│  ( ) Desistência                │
│  ( ) Cancelamento               │
│  Motivo * (lista padronizada)   │
│  [ Selecione           ▼ ]      │
│  Outro motivo / observações     │
│  [________________________]     │
│  Data do desligamento *         │
│  [__/__/____]  (pode retroagir) │
├─────────────────────────────────┤
│  [ Voltar ]  [ Confirmar ]      │
└─────────────────────────────────┘
```

---

## Regras

- Atualiza status para desligada/desistente (UC29/UC79)
- **Motivo por lista fechada** + campo **aberto** para complemento
- **Data do desligamento** registrada (pode ser retroativa) para relatórios de evasão
- **Remove a participante das automações** (lembretes/liberações — fila de alertas UC87 e fila de jornada UC33)
- Notifica o Gestor de Turma
- Gestor também registra via [09-cancelamento-desistencia.md](../aplicativo-gestor/gestor-turma/09-cancelamento-desistencia.md)

---

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/ajuda` ou widget flutuante |
| **Perfil** | Empreendedora |
| **UCs** | UC64 |
| **Prioridade** | Fase 3 |

---

## Objetivo

Canal de autoatendimento com IA para dúvidas frequentes sobre o programa e uso do aplicativo.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Ajuda                     │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ Olá! Como posso ajudar? │    │
│  │                         │    │
│  │ [mensagens do chat]     │    │
│  └─────────────────────────┘    │
│  [ Digite sua dúvida...    ] [→]│
├─────────────────────────────────┤
│  Perguntas frequentes:          │
│  • Como enviar tarefa?          │
│  • Onde vejo meu certificado?   │
└─────────────────────────────────┘
```

---

## Regras

- Fora do escopo MVP imediato (evolução contratual)
- Não substitui contato humano do gestor
- Custos de IA reportados na Fase 3 (contrato)

---
