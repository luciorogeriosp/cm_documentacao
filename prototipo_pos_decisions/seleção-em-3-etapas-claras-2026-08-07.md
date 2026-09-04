# Seleção em 3 etapas claras

Hoje a tela mistura tudo: a alocação em turma aparece já na listagem de inscritas, a oficina fica no meio da página e aprovar é um botão em lote solto. Vamos reorganizar a página de Seleção e classificação numa sequência linear.

## Etapa 1 — Inscritas

Listagem completa das inscrições da unidade, com busca, filtros (status, pontos, elegibilidade, período, unidade) e ordenação por score.

- Ações em lote: **Qualificar**, **Em análise**, **Não qualificar**.
- Sai a coluna **Turma** e o filtro por turma.
- Sai o bloco "Alocar em lote" desta etapa.
- Duplo clique continua abrindo a ficha completa; o acordeão de critérios continua igual.

## Etapa 2 — Oficina presencial de seleção

Bloco logo abaixo, alimentado pelas qualificadas.

- Criar oficinas (nome, data, hora, local, capacidade) e agrupar as qualificadas.
- Registrar presença/ausência de cada agendada.
- A decisão passa a ser por candidata que compareceu: **Aprovar** ou **Não aprovar**, além do botão de aprovar em lote quem compareceu.
- Quem não compareceu ou não foi agendada não pode ser aprovada nem reprovada nesta etapa.

## Etapa 3 — Alocação em turmas (só aprovadas)

Novo bloco final, visível apenas em edições presenciais/híbridas.

- Painel de ocupação por turma (vagas/alocadas/saldo) e alerta de desbalanceamento — movido para cá.
- Lista das aprovadas ainda sem turma, com seleção múltipla e **Alocar em lote** numa turma compatível com a unidade da candidata.
- Lista das já alocadas, agrupadas por turma, com opção de mover ou remover a alocação.
- Alocar deixa de definir status "qualificada" — nesta etapa a candidata já está aprovada.

Em edições **online** não há oficina: a etapa 2 é omitida e a etapa 3 também (turma única), mantendo o fluxo qualificar → comunicar.

## Detalhes técnicos

- `src/routes/gestor.e.$edicaoId.selecao.tsx`: reestruturado em três seções numeradas; remove coluna/filtro de turma e o bloco de alocação em lote da barra de ações; a barra de ações da etapa 1 perde o botão "Aprovar (pós-oficina)".
- `src/components/oficina-selecao.tsx`: adiciona ações por candidata presente (aprovar / não aprovar) via nova prop `onNaoAprovar`, mantendo o lote existente.
- Novo `src/components/turma-alocacao.tsx`: bloco da etapa 3 (ocupação, aprovadas sem turma, alocação em lote, alocadas por turma).
- `src/lib/gestor-selecao-store.ts`: `definirTurma` deixa de forçar status "qualificada" (alocação agora ocorre depois da aprovação).
- Nenhuma mudança em `comunicar-selecao` — continua sendo o passo que libera a jornada.
