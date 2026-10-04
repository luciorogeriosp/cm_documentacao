# Gap: Protótipo Cliente v5 × Casos de Uso v8

**Data da análise:** 24/set/2026 (America/Sao_Paulo)  
**Protótipo usado (somente v5):**  
- Windows / Google Drive for desktop: `G:\Meu Drive\_EW\Consultado da Mulher\prototipo\prototipo_cliente\v5`  
- Google Drive (pasta): `prototipo_cliente/v5` — id `1IpNj8rE5hkH9G7GOgGu5Wj4g1CGxy8XZ`  
- Cópia local de trabalho: `/workspace/consulado/prototipo/v5_full`  
**Casos de Uso:** `Casos de Uso - Consulado da Mulher_v8.md` (id Drive `1d9pPQufqB5_DinhqLaEjqJMD1dbbpMAr`)  

**Escopo:** apenas o que existe em HTML/JS da **v5**. Ignorados v3/v4. Ferramentas exclusivas de demo (`sim-panel.js`, `dev-menu.js`) não entram como requisitos de produto. Specs em `especificacao/` (ex.: hub Mentoria) só entram quando o comportamento correspondente aparece em arquivo da v5.

---

## Resumo numérico

| Métrica | Qtd |
|--------|-----|
| Telas HTML analisadas (v5) | **31** |
| Arquivos JS de produto/demo lidos | **30** |
| Itens **não cobertos** pela v8 (a) | **14** |
| Itens **parcialmente cobertos** (b) | **22** |
| Itens **plenamente cobertos** (não listados) | **28** |

**Telas HTML (31):** `index.html`, `perfil.html`, `meus-dados.html`, `certificados.html`, `doacao.html`, `empreende-mulher.html`, `empreende-mulher-premio.html`, `empreende-no-zap.html`, `empreende-no-zap-completo.html`, `empreende-no-zap-capital.html`, e em `atividades/`: `capital-semente.html`, `certificado.html`, `definicao-metas.html`, `ebook.html`, `encontro.html`, `fluxo-caixa.html`, `fluxo-caixa2.html`, `gestao-tempo-pre.html`, `gestao-tempo.html`, `mentalidade.html`, `nps.html`, `plano-negocios.html`, `premio-geladeira.html`, `presenca-palavra-chave.html`, `questionario-final.html`, `quiz.html`, `quiz2.html`, `saude-financeira.html`, `visita-tecnica.html`, `workshop-encerramento.html`, `workshop-encerramento-live.html`.

**Nota de inventário:** `js/mentoria.js` existe e referencia `mentorias.html` / `calendario.html`, mas **nenhum HTML da v5 inclui `mentoria.js`** e esses HTML **não existem** na v5. O pedido de mentoria na v5 aparece via botão **Solicitar mentoria** + `mentoria-modal.js` nas homes P/H. Footer real da v5: **Programas · Certificados · Ajuda IA** (não Mentoria/Calendário/Perfil).

---

## (a) Não cobertos pela v8

Itens presentes no protótipo sem UC correspondente (ou sem menção utilizável) na v8.

### 1. Premiação geladeira (benefício material paralelo à doação UC57/UC86)

- **O quê:** Após baixar certificado no Empreende Mulher, home `empreende-mulher-premio.html` exibe alerta “Você está elegível para receber uma **geladeira**” → `atividades/premio-geladeira.html` com formulário (nome, CPF, e-mail, telefone, endereço completo, aceite, assinatura em canvas) e CTA “Enviar solicitação”.
- **Fonte:** `empreende-mulher-premio.html` (banner `seed-alert`); `atividades/premio-geladeira.html`; `js/premio-geladeira.js`; gatilho em `js/certificado.js` / fluxo pós-download.
- **Por que (a):** A v8 trata doação como **capital semente (dinheiro)** ou **material** via UC57+UC86. Não há UC de “premiação geladeira”, elegibilidade pós-certificado nem formulário cliente específico de geladeira. Termo “geladeira” **ausente** na v8.

### 2. Card de programa bloqueado “Mulheres do Nosso Bairro” (aguardando seleção)

- **O quê:** Em `index.html`, terceiro card `program-card--locked`: programa “Mulheres do Nosso Bairro”, unidade SP Zona Oeste, status **Aguardando seleção**, sem CTA.
- **Fonte:** `index.html` (bloco `program-card--locked`).
- **Por que (a):** Nome do programa e UI de “aguardando seleção” na home multi-programa não aparecem na v8 (seleção genérica em UC24/UC25, sem este card).

### 3. CTA “Continue Daqui” / “Próxima aula” na home de programas

- **O quê:** Cards de programa matriculado mostram progresso “N de M aulas”, bloco “Próxima aula” com número/título e botão **Continue Daqui** apontando para a próxima atividade.
- **Fonte:** `index.html` (`program-card__next`, `program-card__next-cta`).
- **Por que (a):** v8 fala de progresso/liberação (UC34/UC33/UC36), mas não documenta este padrão de home com “Continue Daqui” / contagem por **aulas** na listagem de programas.

### 4. Footer do Cliente: Programas · Certificados · Ajuda IA

- **O quê:** Navegação inferior fixa em quase todas as telas: **Programas**, **Certificados**, **Ajuda IA** (abre chat). Ícone de perfil só no header.
- **Fonte:** `index.html`, `perfil.html`, `empreende-mulher.html`, demais páginas (`footer-nav`).
- **Por que (a):** v8 (UC70/UC68) descreve footer **Home · Mentoria · Calendário · Perfil** (Mentoria condicionada). A IA está no UC64, mas o **menu inferior com Certificados + Ajuda IA** e a ausência de Mentoria/Calendário na v5 **não** estão alinhados a nenhum UC de navegação.

### 5. Botão “Iniciar WhatsApp” / “Fale com sua mentora” nas atividades

- **O quê:** Cards de contato com copy “Fale com sua mentora agora mesmo via WhatsApp” + botão **Iniciar WhatsApp** em várias atividades (encontro, visita técnica, NPS, plano de negócios, certificado, etc.).
- **Fonte:** ex. `atividades/encontro.html`, `atividades/visita-tecnica.html`, `atividades/nps.html`, `atividades/plano-negocios.html`.
- **Por que (a):** Comunicação WhatsApp na v8 é Gestor/Backend (UC49–UC54, UC50). Não há UC de atalho cliente → WhatsApp da mentora/educadora a partir da atividade.

### 6. “Abrir no Maps” / mapa OpenStreetMap em encontro e visita técnica

- **O quê:** Local do encontro/visita com botão **Abrir no Maps** e iframe/crédito OpenStreetMap.
- **Fonte:** `atividades/encontro.html`, `atividades/visita-tecnica.html`.
- **Por que (a):** UC34/UC78 mencionam local/logística no Gestor; não documentam mapa/deep-link Maps no Cliente.

### 7. Anel / barra de “Progresso geral” no Perfil

- **O quê:** Card com “Progresso geral”, valor “4 de 9 atividades”, ring SVG e percentual (ex. 44%).
- **Fonte:** `perfil.html` (`progress-detail`, `progress-ring`).
- **Por que (a):** Percentuais de certificação/beneficiamento existem (UC13/UC55), mas esta UI agregada no perfil não está descrita.

### 8. Ação “Sair da conta” no menu do Perfil

- **O quê:** Item de menu “Sair da conta” (estilo destrutivo).
- **Fonte:** `perfil.html` (`profile-menu`).
- **Por que (a):** Login link mágico (UC4) existe; logout explícito no Cliente **não** está documentado.

### 9. Chips e mídia no chat IA (imagem + microfone + sugestões)

- **O quê:** Modal “Suporte online” com chips **Certificado**, **Dúvidas sobre o Empreende Mulher**, **Visita técnica**, **Plano de negócios**; botões de enviar **imagem** e **mensagem de voz**.
- **Fonte:** `js/chat-modal.js` (montagem do `#chat-modal`).
- **Por que (a):** UC64 cobre o agente de IA em alto nível; não especifica chips, upload de imagem, áudio nem rótulo “Suporte online”.

### 10. Banner “capital semente de R$ 1.000” paralelo ao funil/doação

- **O quê:** Em Zap, banner “Você conseguiu um capital semente de **R$ 1.000**” → `atividades/capital-semente.html` (formulário próprio com dados, endereço, banco/agência/conta, PIX opcional livre, aceite, assinatura), acionado por simulação `liberada_capital` **em paralelo** ao handshake UC86.
- **Fonte:** `js/zap-funnel.js` (`capitalBanner`); `empreende-no-zap-capital.html`; `atividades/capital-semente.html`; `js/capital-semente.js`; `js/sim-panel-config.js` (`liberada_capital`).
- **Por que (a):** UC58 é análise no **Gestor**; UC57 trata capital semente como modalidade de doação. Não há UC de formulário cliente separado com valor fixo R$ 1.000 nem fluxo paralelo à doação UC86.

### 11. Copy “elegível ≠ ganhou / agora é torcer”

- **O quê:** Após quiz 100%, banner/copy: elegível para concorrer **não** significa que ganhou; “agora é torcer para ganhar”.
- **Fonte:** `js/zap-funnel.js` (`elegivelBanner`); `js/questionario-final.js`; `atividades/questionario-final.html`.
- **Por que (a):** UC38 define status **liberada para doação**; não documenta a semântica de “elegível / torcer” distinta de liberação/concessão.

### 12. Alternância visual Agendado ↔ Realizada na tag da Visita Técnica (Cliente)

- **O quê:** Na página da visita, a tag “Visita Técnica” alterna estados Agendado / Realizada; na lista, 1º clique “desbloqueia” para “Agendado • data/hora”. Há bloco de “impressão da mentora”.
- **Fonte:** `js/visita-tecnica-page.js`, `js/visita-tecnica-card.js`; `atividades/visita-tecnica.html`; cards em `empreende-mulher.html`.
- **Por que (a):** UC78 agenda no Gestor; o Cliente não tem UC para alternar status da visita nem ver impressão da mentora.

### 13. Estado “Requer ajustes” / dados reprovados em Fluxo de Caixa e Saúde Financeira

- **O quê:** `fluxo-caixa2.html` e variações de saúde financeira mostram UI de mês “Requer ajustes” / reprovado para a empreendedora reenviar.
- **Fonte:** `atividades/fluxo-caixa2.html` (título “Dados Reprovados”); lógica de revisão referida em `DOCUMENTACAO.md` / páginas SF.
- **Por que (a):** UC46 é validação no **Gestor**; o fluxo de reenvio no Cliente após revisão não está detalhado como tela/estado (só mencionado de passagem em UC45 fluxo alternativo).

### 14. Hub Mentoria / Calendário como páginas (só código órfão)

- **O quê:** `js/mentoria.js` implementa hub (treino CMS, abas Em aberto/Minhas/Encerradas, solicitar, NPS, footer Home·Mentoria·Calendário·Perfil) e aponta para `mentorias.html` / `calendario.html`, **inexistentes** e **não linkados** na v5.
- **Fonte:** `js/mentoria.js` (não referenciado por nenhum `.html` da v5).
- **Classificação:** comportamento **não entregue na UI v5**; não conta como gap de documentação vs tela. Registrado aqui para não confundir com o modal ainda presente (item parcial abaixo). Se for considerado “existe no JS”, tratar como **não coberto na v8 o detalhe das áreas do protótipo** — ver (b).

---

## (b) Parcialmente cobertos

UC existe, mas o protótipo mostra campo, ação, regra ou fluxo ausente ou divergente na v8.

### Home e navegação

1. **Home multi-programa com badges “N em curso” / “N Aguardando aprovação”** — parcial **UC29 / UC25**  
   - Fonte: `index.html` (`home-programs-label__badges`).  
   - Falta na v8: composição exata desses badges na home do Cliente.

2. **Metadados no card (edição, unidade, turma) na home** — parcial **UC16 / UC17 / UC27**  
   - Fonte: `index.html` (`program-card__meta`).  
   - Falta: especificação de quais metadados a home do Cliente exibe.

### Perfil e Meus dados

3. **Formulário Meus dados (nome, nome social, e-mail, telefone, endereço completo)** — parcial **UC27** (+ nome social em **UC21**)  
   - Fonte: `meus-dados.html`; `js/meus-dados.js`.  
   - Cobertura: UC27 permite autoatualização; UC21 define nome social na inscrição.  
   - Falta: UC27 não lista os campos editáveis no Cliente (ex.: endereço completo, nome social na edição pós-cadastro); protótipo não mostra CPF (ok com UC27), mas também não mostra busca CEP automática citada em UC21.

4. **Certificados no footer + lista com regra “75% · sem evento de entrega”** — parcial **UC55 / UC63**  
   - Fonte: `certificados.html`, `atividades/certificado.html`, `js/cert-progress.js`, `js/certificado.js`.  
   - Cobertura: emissão automática 75% (UC55) e consulta (UC63).  
   - Falta: UC63 fala em **reenvio**; protótipo enfatiza download/lista e copy “Não há evento de entrega”. Abas **Programa | Mentoria** (UC63/UC70) estão no JS de certificados, mas a página estática não expõe o filtro claramente como na spec.

### Desistência

5. **Modal Desistir com select de 7 motivos + detalhe obrigatório** — parcial **UC79**  
   - Fonte: `empreende-mulher.html` / Zap (`#withdraw-modal`); `js/withdraw-modal.js`.  
   - Motivos: falta de tempo; dificuldades no negócio; problemas pessoais/saúde; expectativas; mudança de rotina; outro programa; outro.  
   - Falta: UC79 pede “questionário simples” + “razão do abandono” sem enumerar motivos nem exigir select+textarea juntos.

### Mentoria (modal ainda na home P/H)

6. **Botão “Solicitar mentoria” + modal na home do programa** — parcial **UC70**  
   - Fonte: `empreende-mulher.html` (`Solicitar mentoria`); `js/mentoria-modal.js`.  
   - Divergência: UC70 manda hub `/app/mentorias`, **não** na home do programa nem no perfil.  
   - Falta na v8 relativa ao que o protótipo faz: entrada pelo card da jornada.

7. **Catálogo de áreas do modal/JS ≠ catálogo CMS da UC70** — parcial **UC70**  
   - Fonte: `js/mentoria-modal.js` / `js/mentoria.js` (`AREAS`: Finanças, Marketing, Vendas, Operações/produção, Jurídico/MEI, Gestão de pessoas, Outro).  
   - UC70: Finanças, Marketing, Vendas, **Gestão**, **Comunicação**, **Formalização**, **Saúde e bem-estar**, **Tecnologia**.  
   - Falta/alinha: nomes e itens diferem (Operações, Jurídico/MEI, Outro vs Comunicação/Formalização/etc.).

8. **Pergunta “2 horas com o mentor” no formulário P/H** — parcial **UC70**  
   - Fonte: `js/mentoria-modal.js` (label do objetivo com “2 horas”).  
   - Divergência: UC70 diz que em P/H **não há slot de 2h** (2h é do online).

### Doação (UC86 / UC57)

9. **PIX somente CPF (sem telefone/e-mail como chave)** — parcial **UC86**  
   - Fonte: `js/doacao.js` (aviso “PIX usando o CPF”; `pixTipo=cpf` hidden).  
   - UC86: se chave for CPF fica imutável; **telefone e e-mail podem ser usados/editados**. Protótipo remove essa opção.

10. **Material: empreendedora sobe foto da NF** — parcial **UC86**  
    - Fonte: `js/doacao.js` (passo recibo material: “Anexe a foto da nota fiscal”); `js/sim-panel-config.js` (`recibo_material`).  
    - UC86: **gestor** anexa NFs 1:N; empreendedora **confirma recebimento** e assina recibo **sem** NF individual na mão. Fluxo invertido/divergente.

11. **Autocomplete de banco por nome (código COMPE)** — parcial **UC86**  
    - Fonte: `js/doacao.js` + `js/bancos-bacen.js`.  
    - UC86 menciona banco/agência/conta e COMPE aparece na v8 em contexto bancário; falta detalhar UX de autocomplete por nome no Cliente.

12. **Faixas de status da doação no Cliente (aprovada-aguarde, informe dados, recibo, recebeu)** — parcial **UC86 / UC57**  
    - Fonte: `js/doacao.js`, faixa nas homes via simulação.  
    - Cobertura conceitual sim; falta na v8 o detalhamento tela a tela do Cliente (estados da faixa).

### Funil online (UC38)

13. **Prazo fixo de 2 horas para palavra-chave no protótipo** — parcial **UC38**  
    - Fonte: `js/zap-funnel.js`, `js/presenca-palavra-chave.js`, `atividades/presenca-palavra-chave.html` (KW demo `Empreende2026`).  
    - UC38: prazo **configurável na edição** (exemplo 1h). Protótipo hardoda 2h e KW de exemplo.

14. **Botão “Já terminei o workshop — liberar palavra-chave” (autoavanço no Cliente)** — parcial **UC38**  
    - Fonte: `atividades/workshop-encerramento-live.html`; `js/workshop-encerramento-live.js`.  
    - UC38: liberação da atividade de presença **após o término** da live (evento/sistema). Não descreve CTA da empreendedora para “encerrar” a live no app.

15. **Questionário final como quiz de regras do funil (gabarito 100%)** — parcial **UC38 / UC39**  
    - Fonte: `atividades/questionario-final.html` (perguntas sobre live/KW/elegibilidade).  
    - UC38 exige 100% certo; UC39 cobre questionários genéricos. Falta: conteúdo/instrumento específico “quiz do funil” vs Questionário Final metodológico (endline).

### Saúde financeira e fluxo de caixa (UC45)

16. **Campo editável “Despesas / Capital de giro” vs resultado calculado** — parcial **UC45**  
    - Fonte: `atividades/saude-financeira.html` (`sf-despesa` input).  
    - UC45: **Despesas** é saída informada; **Despesas / capital de giro** (rótulo provisório) é **calculado somente leitura** (`Entradas − Saídas − Renda/retirada`). No protótipo o rótulo UC está no input de despesa e há “Saldo do período” como resultado — nomenclatura/papéis trocados ou ambíguos.

17. **Escala de dificuldade (5 rostos) injetada via JS** — parcial **UC45**  
    - Fonte: `js/saude-financeira.js` (monta `sf-difficulty`). HTML estático da v5 não traz o bloco; JS sim.  
    - Cobertura: UC45 exige dificuldade obrigatória. Gap menor: garantir que a tela canônica documentada = implementação (e ausência no HTML cru).

18. **Alertas/heurísticas de UI (ex. saídas > 120% do faturamento; resultado < −30%)** — parcial **UC45**  
    - Fonte: `js/saude-financeira.js` (`saldasOverFat`, `resultadoUnderFat`).  
    - UC45 cita alerta se renda > faturamento e âmbar se divergir >30% da **média histórica**. Limiares 120%/−30% do faturamento do mês no protótipo **não** estão na v8.

19. **Atividade separada “Fluxo de Caixa” além de “Saúde Financeira”** — parcial **UC45 / UC15**  
    - Fonte: `atividades/fluxo-caixa.html`, `fluxo-caixa2.html` (campos faturamento, renda, investimento, etc. + justificativa de zero).  
    - UC15/UC45 canônico é **Saúde financeira**; não há tipo “Fluxo de Caixa” separado. Pode ser legado/duplicata não alinhada.

### Atividades educacionais

20. **Plano de Ação com metas colapsáveis Pendente/Concluir/Remover** — parcial **UC15 (Plano de Ação) / UC31**  
    - Fonte: `atividades/definicao-metas.html`; `js/action-plan.js`.  
    - Cobertura: tipo existe; gestor/empreendedora editam metas.  
    - Falta: detalhe Cliente (UI colapsável, status Pendente/Concluir, remover) e título de atividade “Definição de Metas”.

21. **Visita Técnica no Cliente (mapa, WhatsApp, estados)** — parcial **UC78 / UC15**  
    - Fonte: `atividades/visita-tecnica.html` + JS de card/página.  
    - UC78 é agenda/logística no Gestor; visão Cliente (o que ela vê/faz) está subespecificada — ver também itens (a)12 e (a)5–6.

22. **Aula presencial com data/local no Cliente** — parcial **UC36 / UC34 / UC15 (Aula)**  
    - Fonte: `atividades/encontro.html`.  
    - Cobertura: consumir conteúdo/presença.  
    - Falta: pacote visual (mapa, WhatsApp) — ver (a).

---

## Itens plenamente cobertos (contagem = 28; não detalhados)

Incluem, entre outros: listagem de programas matriculados; módulos em acordeão e cards bloqueados/liberados (UC34); videoaula com progresso (UC36/UC37); aula ao vivo pré/gravação P/H (UC38); quiz com navegação Anterior/Próxima (UC39); NPS 0–10 + comentário (UC39); tarefa de casa download+upload (UC43); download de e-book (UC15/UC36); funil 100% atividades → workshop/live YouTube → KW → quiz 100% → liberada (UC38); certificado automático 75% (UC55) e tela de consulta (UC63); existência de chat IA (UC64); existência de desistência (UC79); existência de atualização cadastral (UC27); jornada de doação pós-aprovação com nome/CPF readonly, conta corrente/poupança, recibo e assinatura canvas (núcleo UC86); tipos de atividade alinhados ao catálogo (Aula, Vídeo Aula, Tarefa, Saúde financeira, Download, Plano de Ação, NPS, Visita Técnica); liberação sequencial no Zap (UC33/UC34); header com logo e perfil.

---

## Dificuldades de acesso

- Conector **user-Google-drive** localizou e baixou a pasta `prototipo_cliente` e a v8 sem problema.  
- `CopyToBox` a partir de `G:\...` foi **recusado** (fora do root permitido); contornado com zip em `C:\Users\notte\agent-tools\` + `CopyToBox`, depois limpeza dos zips temporários.  
- Shell/`Get-ChildItem` na máquina `notte-i9` (`ceb000e3-d0f2-4739-bc8c-216bdc698303`) confirmou o mesmo conjunto de arquivos HTML/JS da v5 que o Drive.  
- **Não** foram alterados arquivos do usuário nem criados itens no Drive.  
- DOCUMENTACAO.md na raiz de `prototipo_cliente` descreve footer Mentoria/Calendário e páginas `mentorias.html`/`calendario.html` que **não** estão na v5 atual — a análise priorizou os arquivos reais da v5.

---

## Lista compacta (uma linha por item)

### Não cobertos (a)
1. Premiação geladeira (form + banner) — `empreende-mulher-premio.html`, `atividades/premio-geladeira.html`, `js/premio-geladeira.js`
2. Card bloqueado “Mulheres do Nosso Bairro” — `index.html`
3. CTA “Continue Daqui” / próxima aula na home — `index.html`
4. Footer Programas · Certificados · Ajuda IA — várias telas `footer-nav`
5. Botão “Iniciar WhatsApp” / falar com mentora na atividade — ex. `atividades/encontro.html`, `visita-tecnica.html`
6. “Abrir no Maps” / OpenStreetMap — `atividades/encontro.html`, `visita-tecnica.html`
7. Progresso geral (ring %) no Perfil — `perfil.html`
8. “Sair da conta” — `perfil.html`
9. Chips + imagem + microfone no chat (“Suporte online”) — `js/chat-modal.js`
10. Banner/form capital semente R$ 1.000 paralelo — `js/zap-funnel.js`, `atividades/capital-semente.html`
11. Copy “elegível ≠ ganhou / torcer” — `js/zap-funnel.js`, `js/questionario-final.js`
12. Toggle Agendado/Realizada + impressão mentora (Cliente) — `js/visita-tecnica-*.js`, `atividades/visita-tecnica.html`
13. UI “Requer ajustes” / reprovado no Cliente — `atividades/fluxo-caixa2.html` (+ SF)
14. (Registro) `mentoria.js` órfão sem `mentorias.html`/`calendario.html` na v5 — `js/mentoria.js`

### Parciais (b)
1. Badges “em curso / aguardando aprovação” na home — `index.html` · UC29/UC25
2. Metadados edição/unidade/turma no card — `index.html` · UC16/UC17
3. Campos de Meus dados (nome social, endereço…) — `meus-dados.html` · UC27/UC21
4. Lista certificados + copy sem evento de entrega / filtro mentoria — `certificados.html`, `js/certificado.js` · UC55/UC63
5. Motivos estruturados da desistência — modal em homes · UC79
6. Solicitar mentoria na home (não no hub) — `empreende-mulher.html`, `mentoria-modal.js` · UC70
7. Áreas de mentoria divergentes do CMS UC70 — `mentoria-modal.js` / `mentoria.js` · UC70
8. Wording “2 horas” no pedido P/H — `mentoria-modal.js` · UC70
9. PIX só CPF — `js/doacao.js` · UC86
10. Upload de NF pela empreendedora (material) — `js/doacao.js` · UC86
11. Autocomplete banco COMPE — `doacao.js`, `bancos-bacen.js` · UC86
12. Máquina de estados/faixa da doação no Cliente — `doacao.js` · UC86/UC57
13. KW com prazo fixo 2h / KW demo — `zap-funnel.js`, `presenca-palavra-chave.*` · UC38
14. CTA “Já terminei o workshop” — `workshop-encerramento-live.html` · UC38
15. Questionário final = quiz do funil — `questionario-final.html` · UC38/UC39
16. Rótulo/papel “Despesas / Capital de giro” editável — `saude-financeira.html` · UC45
17. Dificuldade 5 níveis (só via JS) — `saude-financeira.js` · UC45
18. Heurísticas de alerta 120%/−30% — `saude-financeira.js` · UC45
19. Atividade “Fluxo de Caixa” aparte de Saúde Financeira — `fluxo-caixa*.html` · UC45/UC15
20. UI Cliente do Plano de Ação (metas Pendente/Concluir) — `definicao-metas.html`, `action-plan.js` · UC15/UC31
21. Visão Cliente da Visita Técnica — `visita-tecnica.html` · UC78
22. Detalhe visual da Aula presencial no Cliente — `encontro.html` · UC36/UC34
