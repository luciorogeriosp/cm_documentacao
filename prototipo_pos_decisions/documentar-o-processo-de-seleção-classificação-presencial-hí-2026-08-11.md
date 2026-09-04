# Documentar o processo de seleção/classificação presencial/híbrido nos casos de uso

Atualizar os documentos de referência para refletir o fluxo de 3 etapas que está implementado na tela de seleção e classificação, separando claramente classificação, oficina presencial, alocação e comunicação.

## Escopo

- `docs/Casos_de_Uso_v7.md` — UC24, UC17, UC25, UC80.
- `docs/Aplicativo_Gestor.md` — seções 5 (Seleção), 6 (Comunicar), 7 (Alocar).

## O que documentar

### 1. UC24 – Selecionar e Classificar Participantes da Edição

Reescrever o fluxo principal para:

- A tela é acessível apenas ao **Gestor de Unidade** e já filtra as inscritas pela(s) unidade(s) do gestor.
- A listagem exibe **score da régua dinâmica (UC23)** no formato X/Y, com acordeão de critérios por candidata.
- Filtros obrigatórios na UI: status, busca por nome, faixa de pontos, elegibilidade, período de preferência (manhã/tarde) e unidade.
- Ordenação padrão por score.
- Ações em lote: **Qualificar**, **Em análise**, **Não qualificar**.
- Duplo clique abre a ficha completa da candidata; a decisão também pode ser tomada por lá.
- **Classificar não libera a jornada** — a comunicação é feita em UC25.
- Em edições **presencial/híbrido**, as qualificadas seguem para a **oficina presencial de seleção (UC80)**; em edições **online**, por termos unidade e turma unicas (quando ha unidade e turma unica, o candidato ja eh automaticamente inscrito na unidade e turma disponivel na edicao), a qualificada já pode ser comunicada (UC25) sem oficina nem turma. Se por um acaso uma edicao presencial/hibrida tem uma unidade, e nessa unidade tem apenas uma turma, as empreendedoras qualificadas automaticamente entram na turma unica, nao necessitando selecao de turma.
- Remover do UC24 o texto que trata alocação em turma como ação da mesma tela; a alocação agora ocorre na etapa 3, após a oficina.

### 2. UC80 – Oficina Presencial de Seleção (novo detalhamento)

Expandir ou criar subseção específica para a oficina que ocorre entre a qualificação e a aprovação em programas presenciais/híbridos:

- O gestor cria oficinas com nome, data, hora, local e capacidade.
- As candidatas qualificadas são agendadas nas oficinas, com alerta de capacidade excedida.
- Na oficina, o gestor registra **presença** ou **ausência** de cada candidata agendada.
- **Apenas quem compareceu** pode ser aprovado ou não aprovado.
- Decisão individual (Aprovar / Não aprovar) e em lote (Aprovar quem compareceu).
- Aprovadas recebem status `aprovada`; não aprovadas, status `nao-qualificada`.
- Candidatas ausentes devem ser Nao Aprovadas, por precisar passar pela oficina de aprovaçao. As não agendadas permanecem com o statos atual e não podem ser decididas nesta etapa. Apos uma primeira triagem das qualificadas, da oficina presencial, e da aprovacao / nao aprovacao, podemos qualificar novamente mais empreendedoras para proximas oficinas presenciais, ate que a meta da edicao seja alcancada. A meta pode ultrapassar um pouco contando que sempre ha desistencia ao longo do programa, e a meta eh chegar ao final do programa com o numero de participantes ativos, beneficiados e certificados dentro da meta.

### 3. UC17 – Alocar Empreendedora em Turma

Atualizar para o novo contexto:

- Em edições **presencial/híbrido**, a alocação em turma ocorre **após a aprovação na oficina**, não na qualificação.
- A tela mostra painel de ocupação por turma (alocados/vagas/saldo) e alerta de desbalanceamento.
- Lista de aprovadas sem turma, com seleção múltipla e alocação em lote.
- Restrição: só é possível alocar em turmas compatíveis com a unidade da candidata.
- Lista de já alocadas, agrupadas por turma, com opção de mover ou remover.
- A alocação em turma **não altera o status** da candidata (já está aprovada).
- Em edições **online**, turma única ou alocação automática; a alocação não dispara a jornada (alterar a UC33), o que dispara eh passar as selecionadas que estao aptas para a etapa de comunicar resultados da selecao.

### 4. UC25 – Comunicar Resultado da Seleção

Reescrever para deixar claro:

- A comunicação é disparada manualmente pelo Gestor de Unidade.
- Canais: WhatsApp (templates aprovados no Gupshup) ou e-mail.
- Em edições **presencial/híbrido**, a jornada só é liberada na comunicação das **aprovadas na oficina**.
- Para liberar a jornada em presencial/híbrido, a candidata precisa estar **alocada em uma turma** e, se WhatsApp, sao enviadas mensagens de whatsapp comunicando via API. Se não whatsapp, a comunicacao tem que ser feita uma a uma pelo link de whatsapp direto com a empreendedora. Para a comunicacao no programa a turma precisa ter **código de grupo de WhatsApp** cadastrado.
- Outras comunicações (qualificada, em análise, não qualificada) apenas informam, sem liberar jornada.
- Em edições **online**, a qualificada já pode ser comunicada diretamente e a jornada é liberada sem exigir turma. Nao é sem exigir turma, é que a turma é unica, entao o cadastro eh automatico. É obrigatorio uma edicao ter pelo menos uma unidade e uma turma.
- Histórico de envios e contador de jornadas liberadas.
- Anonimização do CPF das não qualificadas 1 dia após o fim da seleção (UC76).
- Os candidatos que não foram aprovados tambem precisam ser avisados da mesma forma que nao participarao do programa.

### 5. `docs/Aplicativo_Gestor.md`

- Seção 5 (Seleção e classificação): descrever as 3 etapas numeradas, os filtros, o score, a ficha completa e as ações em lote.
- Seção 6 (Comunicar resultado): detalhar os grupos (qualificadas, aprovadas na oficina, em análise, não qualificadas), requisito de turma/código de grupo e liberação da jornada.
- Seção 7 (Alocar em turma): mover para após a oficina, incluir painel de ocupação, alocação em lote e gerenciamento de alocadas.

## Entregáveis

- `docs/Casos_de_Uso_v7.md` atualizado.
- `docs/Aplicativo_Gestor.md` atualizado.