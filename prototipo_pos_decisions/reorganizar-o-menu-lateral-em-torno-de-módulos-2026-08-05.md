# Reorganizar o menu lateral em torno de Módulos

Sim — hoje há sobreposição real. Verifiquei no código:

- `presenca` (menu) registra presença por encontro, mas a chamada com QR Code e busca por nome/CPF já acontece dentro da atividade presencial, em `atividade-config.tsx`.
- `aprovacoes` (menu) é uma fila de entregas, mas a aprovação com modal de dados e comentário já acontece por atividade, em `atividade-acompanhamento.tsx`.
- `visitas` (menu) ainda é um stub; a agenda real de visitas está dentro da atividade "Visita Técnica", em `visita-tecnica-agenda.tsx`.

Ou seja: o trabalho é executado em **Módulos**, e os itens do menu viraram atalhos duplicados ou vazios.

## Recomendação

Manter Módulos como o lugar onde o gestor **executa** a atividade, e transformar Aprovações, Presença e Visitas em **visões consolidadas** (todos os módulos de uma vez), que sempre levam de volta à atividade correspondente. Nada de tela duplicada: a consolidada lista e filtra, a execução continua no acordeão do módulo.

## Novo menu lateral

```text
Edição
  Home da edição

Unidade  (apenas Gestor de Unidade)
  Seleção e classificação
  Comunicar seleção
  Alocar / Mover

Turma
  Turmas
  Participantes
  Módulos            <- execução: configurar, liberar, acompanhar

Pendências           <- visões consolidadas, entram na atividade
  Aprovações         (todas as entregas aguardando avaliação)
  Presença           (encontros sem chamada registrada)
  Visitas técnicas   (agenda da semana, todas as turmas do escopo)

Negócio
  Negócios
  Doação
  Capital semente
  Mentoria

Apoio
  Histórico, Ranking e engajamento, Observações,
  Comunicação WhatsApp, Mini CRM (leads)
```

Mudanças em relação ao atual: novo grupo "Pendências" com contadores ao lado do título, grupo "Operação" dividido em "Turma" e "Negócio", e Mentoria/Capital semente saindo de "Apoio" para junto de Negócio.

## Comportamento das telas consolidadas

- **Aprovações**: lista única de entregas pendentes de todos os módulos, com filtro por turma, módulo e tipo. Aprovar/devolver direto na linha; "Abrir na atividade" navega para Módulos com o acordeão daquela atividade aberto.
- **Presença**: lista de encontros já liberados sem chamada registrada, ordenados por data. "Registrar chamada" abre a atividade presencial correspondente (QR + lista manual que já existe).
- **Visitas técnicas**: agenda consolidada por dia, somando todas as turmas do escopo, com os não agendados por turma. Reaproveita o componente de agenda já construído.

## Contadores no menu

Cada item de Pendências mostra um badge com o número de itens abertos no escopo atual (unidade = soma das turmas; turma = só ela). Os números vêm dos mesmos dados fictícios já usados nas telas.

## Detalhes técnicos

- `src/lib/gestor-menu.ts`: reagrupar itens, adicionar campo opcional `contador?: (ctx) => number` por item e novo grupo "Pendências".
- `src/routes/gestor.e.$edicaoId.tsx`: renderizar o badge de contador no `SidebarMenuButton`; manter `collapsible="icon"` e o comportamento de rota ativa.
- Estado de liberação/configuração de atividades hoje é local em `gestor.e.$edicaoId.modulos.tsx`. Para as telas consolidadas conversarem com Módulos, mover esse estado para um store compartilhado (`src/lib/gestor-atividades-store.ts`, em memória, mesmo padrão dos mocks atuais).
- Navegação "abrir na atividade": Módulos aceita `?atividade=<id>` e abre o módulo/acordeão correspondente.
- `visitas` deixa de ser stub e passa a usar `VisitaTecnicaAgenda` em modo multi-turma.