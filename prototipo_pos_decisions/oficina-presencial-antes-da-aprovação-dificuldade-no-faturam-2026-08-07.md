# Oficina presencial antes da aprovação + dificuldade no faturamento

## 1. Etapa de oficina presencial (presencial/híbrido)

Hoje a candidata vai de "qualificada" direto para a comunicação/jornada. Passa a existir uma etapa intermediária obrigatória nas edições presenciais e híbridas: a **oficina presencial de seleção**, onde as qualificadas são agrupadas, agendadas, comparecem e só então são **aprovadas** para o programa.

Novo fluxo na tela de Seleção e Classificação:

```text
inscrita -> qualificada -> agrupada em oficina -> presença na oficina -> aprovada -> comunicação (libera jornada)
```

- Nova aba/seção **Oficinas de seleção** dentro da página de Seleção (só aparece em edições presenciais/híbridas; em online a etapa não existe e o fluxo segue como hoje).
- Criar oficina: nome, data, hora, local, capacidade máxima. Lista de oficinas ordenada por data.
- Agrupar: selecionar várias qualificadas e "Agendar em oficina" (em lote ou individual), com aviso quando a capacidade é excedida. Permite remanejar entre oficinas.
- Painel de acompanhamento por oficina: agendadas, presentes, ausentes, saldo de vagas. Lista das qualificadas ainda sem oficina.
- Registro de presença da oficina: marcar quem compareceu; ausentes ficam pendentes para remarcação em outra oficina.
- Aprovação: só quem tem presença registrada pode ser marcada como **aprovada** (individual ou em lote). Botão de aprovar bloqueado com explicação para quem não compareceu.
- Comunicação de seleção (UC25) passa a considerar aprovadas em vez de qualificadas nas edições presenciais/híbridas; a liberação da jornada continua acontecendo só na comunicação.
- Novo status **aprovada** com selo próprio, filtro e contagem no painel de ocupação.

## 2. Seletor de dificuldade no registro de faturamento

Na atividade **Registro de Faturamento**, a empreendedora avalia o quanto achou difícil preencher aquele registro.

- Escala visual de 5 opções com emoticon de rosto: muito difícil 😣, difícil 🙁, tranquilo 😐, fácil 🙂, muito fácil 😄.
- Aparece como botões grandes lado a lado, com destaque na opção escolhida (não é dropdown).
- No app do gestor: o valor escolhido é exibido no modal de aprovação e na tabela do histórico por competência, e o gestor pode registrá-lo em nome da empreendedora quando estiver preenchendo por ela.
- Resumo por atividade: distribuição das respostas (quantas acharam difícil vs. fácil), para o gestor perceber turmas com dificuldade no preenchimento.

## Detalhes técnicos

- `src/lib/gestor-mock.ts`: adicionar `"aprovada"` ao tipo `StatusCandidata`, rótulo e variante de selo.
- Novo `src/lib/gestor-oficinas-store.ts`: store em memória com oficinas (`id, edicaoId, nome, data, hora, local, capacidade`), alocação candidata→oficina e presença; seletores de pendentes/presentes/ausentes.
- Novo `src/components/oficina-selecao.tsx`: criação de oficina, listas de agendamento em lote e registro de presença.
- `src/routes/gestor.e.$edicaoId.selecao.tsx`: nova seção condicionada a `!ehOnline(edicao)`, ação "Aprovar" dependente de presença, filtro por status aprovada.
- `src/routes/gestor.e.$edicaoId.comunicar-selecao.tsx`: elegibilidade por `aprovada` em presencial/híbrido, mantendo `qualificada` no online.
- `src/lib/gestor-faturamento.ts`: tipo `Dificuldade` (5 níveis) + campo no `RegistroFaturamento` e no histórico simulado.
- `src/components/atividade-acompanhamento.tsx`: seletor visual de dificuldade no bloco de faturamento, coluna no histórico e resumo de distribuição.
- Tudo continua com dados fictícios em memória, sem backend.
