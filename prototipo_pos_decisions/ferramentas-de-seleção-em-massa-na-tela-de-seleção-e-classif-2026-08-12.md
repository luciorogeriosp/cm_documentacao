# Ferramentas de seleção em massa na tela de Seleção e Classificação

Objetivo: em cada etapa do fluxo presencial/híbrido, permitir agir sobre muitas empreendedoras de uma vez, sem clicar uma a uma.

## O que muda

### 1. Barra de seleção reutilizável (em todas as listas)
Cada lista com caixas de seleção ganha a mesma barra de controle no topo:
- "Selecionar todas" / "Limpar seleção" / "Inverter seleção"
- Contador "N de M selecionadas"
- Seleção por intervalo com Shift+clique
- Ações em massa aparecem só quando há algo selecionado

### 2. Etapa 2 — Oficina (`oficina-selecao.tsx`)
- **Alocar em massa nas oficinas**: além do botão atual, adicionar "Selecionar todas as qualificadas sem oficina" e "Distribuir automaticamente" — divide as marcadas entre as oficinas com vaga, respeitando capacidade, e avisa quantas ficaram de fora.
- **Presença em massa**: dentro de cada oficina, checkboxes por candidata mais botões "Marcar todas presentes", "Marcar todas ausentes" e "Marcar selecionadas como presente/ausente".
- **Aprovação em massa**: "Aprovar selecionadas" e "Não aprovar selecionadas" na lista da oficina; continua valendo a regra de só aprovar quem tem presença registrada (quem não tem é ignorada com aviso).
- **Desagendar em massa**: remover várias candidatas de uma oficina de uma vez.

### 3. Etapa 3 — Alocação em turmas (`turma-alocacao.tsx`)
- "Selecionar todas sem turma" e "Selecionar todas de uma unidade" (respeita a regra de lote por unidade única).
- "Distribuir automaticamente": equilibra as marcadas entre as turmas da unidade conforme vagas livres, priorizando a preferência de período (manhã/tarde) quando o nome da turma indica; informa sobrantes se faltarem vagas.
- "Remover selecionadas da turma" na lista de já alocadas.

### 4. Etapa 1 — Inscritas (tabela)
Manter as ações atuais (Qualificar / Em análise / Não qualificar) e acrescentar na barra: "Selecionar todas da fila filtrada", "Selecionar apenas elegíveis" e "Limpar seleção", já que os filtros e o score definem o recorte.

## Regras preservadas
- Só qualificadas entram em oficina; só quem compareceu pode ser aprovada; só aprovadas entram em turma.
- Edições online continuam sem oficina e sem turma — nada muda lá além da barra de seleção da etapa 1.
- Toda ação em massa mostra um resumo em toast (quantas aplicadas, quantas ignoradas e por quê).

## Detalhes técnicos
- Novo componente `src/components/selecao-massa-barra.tsx` com a barra de ações e um hook `useSelecaoMultipla` (toggle, todas, inverter, shift-range) em `src/lib/use-selecao-multipla.ts`.
- `gestor-oficinas-store.ts`: adicionar `registrarPresencaEmLote(ids, compareceu)` e `desagendarEmLote(ids)`; `agendarEmOficina` já aceita lote.
- `gestor-selecao-store.ts`: `definirTurma` já é unitária — adicionar `definirTurmaEmLote(ids, turmaId)` para um único emit por operação.
- Distribuição automática: função pura de balanceamento (capacidade/vagas restantes) em `src/lib/gestor-distribuicao.ts`, testável isoladamente.
- Sem mudanças de backend; tudo em estado local já existente.
