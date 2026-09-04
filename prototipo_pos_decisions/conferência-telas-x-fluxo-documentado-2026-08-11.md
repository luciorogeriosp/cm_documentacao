# Conferência: telas x fluxo documentado

Inspecionei a tela de Seleção (3 etapas), o bloco de Oficina, a Alocação em turmas e a tela de Comunicar seleção, e comparei com o que acabamos de escrever em UC24, UC17, UC25 e UC80.

## O que já está de acordo

- Etapa 1 — Inscritas: fila ordenada por score X/Y, acordeão de critérios, filtros (status, busca, pontos, elegibilidade, período, unidade), ações em lote Qualificar / Em análise / Não qualificar, ficha completa por duplo clique, e escopo restrito à(s) unidade(s) do gestor.
- Etapa 2 — Oficina presencial: criação de oficina (nome, data, hora, local, capacidade), agendamento em lote com alerta de capacidade excedida, presença presente/ausente, decisão individual e lote "Aprovar quem compareceu", com aprovação bloqueada para quem não tem presença.
- Etapa 3 — Alocação: apenas aprovadas, painel de ocupação por turma, alerta de desbalanceamento, alocação em lote restrita a turmas da mesma unidade.
- Online: sem oficina e sem turma; qualificar leva direto a Comunicar seleção.
- Comunicar seleção: abas por resultado, canal WhatsApp (template APPROVED) ou e-mail, prévia, histórico, e liberação da jornada só na comunicação (aprovada em presencial/híbrido, qualificada em online), com bloqueio de aprovadas sem turma e sem código de grupo.

## Divergências encontradas (documentado, mas não implementado)

1. **Ausentes na oficina (UC80, passo 5)** — o documento diz que quem não comparece é marcada como não aprovada. A tela só mostra a etiqueta "ausente", sem ação.
2. **Relato da oficina e exportação de presença (UC80)** — não existe campo de relato nem exportação PDF/CSV no bloco de oficina.
3. **Turma única = alocação automática (UC24/UC17, fluxo alternativo)** — a Etapa 3 sempre exige escolha manual de turma, mesmo quando a unidade tem uma única turma.
4. **Fallback sem API no WhatsApp (UC25)** — o documento prevê link direto de WhatsApp para falar individualmente com a candidata quando não se usa a API; a tela só tem template Gupshup e e-mail.
5. **Volume acima da meta (UC24, fluxo alternativo)** — o cabeçalho mostra meta e contagens, mas não há sinalização quando as qualificadas/aprovadas ultrapassam ou ficam abaixo da meta.

## Ajustes propostos

### Oficina (`src/components/oficina-selecao.tsx`)
- Botão em lote "Marcar ausentes como não aprovadas", agindo sobre agendadas com presença = falso.
- Campo de relato por oficina (objetivos, resultados, observações), salvo em `gestor-oficinas-store.ts`.
- Botão "Exportar presença (CSV)" por oficina, gerando o arquivo no cliente com nome, unidade, presença e decisão.

### Alocação em turmas (`src/components/turma-alocacao.tsx`)
- Quando a unidade da aprovada tem apenas uma turma, alocar automaticamente ao entrar na etapa e exibir aviso "alocada automaticamente na turma única"; manter a possibilidade de remanejar.

### Comunicar seleção (`src/routes/gestor.e.$edicaoId.comunicar-selecao.tsx`)
- Terceira opção de canal: "WhatsApp manual (link direto)", que lista as marcadas com link `wa.me` individual e registra o envio no histórico como manual, sem exigir template aprovado.

### Seleção (`src/routes/gestor.e.$edicaoId.selecao.tsx`)
- Faixa de progresso contra a meta: qualificadas / aprovadas / meta, com destaque quando abaixo da meta (sugerir repescagem) ou acima.

## Notas técnicas

- Todo o estado continua nos stores em memória (`gestor-oficinas-store.ts`, `gestor-selecao-store.ts`); nenhum backend é introduzido.
- O CSV é gerado com `Blob` + `URL.createObjectURL`, sem dependência nova.
- O canal manual adiciona `"whatsapp-manual"` ao tipo `Canal` e é tratado no histórico como envio registrado pelo gestor.
