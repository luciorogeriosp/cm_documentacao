# Cancelamento e reativação de atividade liberada

## Contexto
Hoje o gestor pode liberar uma atividade, mas não existe ação de cancelar. A pergunta é sobre permitir cancelar uma liberação feita por engano e, depois, liberar novamente.

## O que será feito
1. Adicionar estado de cancelamento na liberação
   - Incluir flag `cancelada: boolean` no tipo `Liberacao` do store.
   - Criar função `cancelarAtividade(turmaId, atividadeId)` que marca a liberação como cancelada.
   - Criar função `reativarAtividade(...)` que remove a liberação cancelada (volta ao estado não liberado).

2. Regra de negócio: só cancelar se não houver registros
   - Bloquear o cancelamento quando já existir chamada (`chamadas`) ou entregas (`presencas`/`entregas`) para aquela atividade/turma.
   - Exibir mensagem explicativa quando o botão estiver desabilitado.

3. Atualizar acompanhamento e progresso
   - Atividades canceladas não entram no cálculo de adesão nem nos totalizadores.
   - Na lista de atividades, mostrar badge "cancelada" ao lado de "liberada".

4. Ajustar UI de configuração da atividade
   - Quando liberada: mostrar botão "Cancelar liberação" com confirmação.
   - Quando cancelada: mostrar botão "Liberar novamente" (reabre o formulário de configuração).
   - Manter o acordeão da atividade acessível em todos os estados.

5. Atualizar telas consolidadas de pendências
   - Remover atividades canceladas das listas de aprovações, presença e visitas pendentes.

## Arquivos envolvidos
- `src/lib/gestor-atividades-store.ts` — estado e funções de cancelamento/reativação.
- `src/components/atividade-config.tsx` — botões e fluxo de cancelamento.
- `src/lib/gestor-progresso.ts` — ignorar atividades canceladas nos cálculos.
- `src/routes/gestor.e.$edicaoId.aprovacoes.tsx`, `presenca.tsx` — filtros de pendências.
- `src/lib/gestor-modulos.ts` (se necessário) — nenhuma mudança estrutural, apenas leitura.

## Critérios de aceitação
- Gestor consegue cancelar uma atividade recém-liberada sem registros.
- Tentativa de cancelar atividade com presença/entrega exibe aviso e não altera estado.
- Atividade cancelada não aparece nos totalizadores de adesão.
- Gestor consegue liberar novamente a mesma atividade após cancelamento.
