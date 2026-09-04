# Adequação das telas do Aplicativo Gestor à v6

Foco desta rodada: ajustar as telas que já existem e criar as duas experiências de Home da Edição — **presencial/híbrido** e **online (Empreende no Zap)**. Telas ainda em placeholder (doação, negócios, engajamento, observações, comunicação, leads, histórico) ficam para a próxima rodada.

## 1. Modalidade como eixo da edição

Hoje `modalidade` existe nos dados da edição, mas nenhuma tela muda de comportamento por causa dela. Passa a ser o eixo que define o que o gestor vê.

- Adicionar uma segunda edição de exemplo no mock: uma **online** (unidade e turma únicas, ~1 turma grande) ao lado da atual presencial.
- Presencial e híbrido têm comportamento idêntico; a diferença é só rótulo.
- Selo de modalidade no cabeçalho da edição e no card do dashboard de edições.

## 2. Home da Edição — duas versões

**Presencial/híbrido** (evolução da tela atual)
- KPIs: inscritas, qualificadas, alocadas, presença média, certificadas.
- Bloco "Próximos encontros" da(s) turma(s) e próxima visita técnica.
- Pendências operacionais: chamadas em aberto, entregas a aprovar, visitas a agendar.
- Ações rápidas: módulos, presença, comunicar grupo WhatsApp, sugerir doação.
- Aviso quando a turma não tem link do grupo WhatsApp cadastrado (bloqueia o facilitador UC50).

**Online (Empreende no Zap)**
- KPIs: aprovadas, **OK recebidos** (gatilho de envio), conteúdos entregues, respostas pendentes, evasão em risco.
- Bloco **temporizador** (UC33): atividades liberadas por tempo, quantas foram enviadas e quantas aguardam o "OK" — somente leitura para Gestor de Turma.
- Bloco **mensagens direcionadas** (UC53): quem não fez a última atividade e quem está em risco de cancelamento, com contagem de disparos pagos.
- Sem presença/visita técnica; sem facilitador de grupo WhatsApp.

## 3. Seleção e classificação (UC24/UC17/UC18)

- Painel de **ocupação em tempo real** no topo: meta da edição, vagas, inscritos, qualificados, alocados e saldo — por unidade e por turma.
- Alerta de desbalanceamento (turma acima das vagas ou muito abaixo da média).
- Alocar/remanejar unidade e turma direto na lista e na ficha, com confirmação mostrando o impacto na ocupação.
- Deixar explícito na tela que **qualificar libera a jornada**; comunicar resultado é ação separada.
- Em edição online (unidade/turma únicas), esconder os controles de alocação e manter só classificar/aprovar.

## 4. Módulos e atividades (UC34)

- Facilitador "Comunicar pelo grupo WhatsApp" só em presencial/híbrido; em online, substituir por "link mágico + disparo do temporizador".
- Prazo padrão **D+2** com bloqueio de data no passado e sugestão automática.
- Entrega fora do prazo: aceitar com marcação de penalidade de engajamento.
- Tarefa/faturamento: três listas explícitas — **não fez / em análise / aprovada** — e atalho `wa.me` para o responsável pelo empreendimento.
- Questionário passa a ter subtipos inicial / final / NPS coerentes com o acompanhamento em pizza.

## 5. Beneficiamento e certificação por edição (UC13)

- Percentuais passam a vir da edição (padrão 50% beneficiamento / 75% certificação) em vez de fixos.
- Exibir os percentuais na home e usar como base dos indicadores de progresso e das cores de adesão.

## 6. Nomenclatura e empreendimento coletivo

- Substituir "premiação/contemplado" por **doação / recebeu doação** em todos os textos.
- Participantes e aprovações passam a mostrar o **empreendimento** (individual ou coletivo) como unidade de obrigação: presença e faturamento pertencem ao negócio, com as sócias vinculadas.

## Detalhes técnicos

- `src/lib/gestor-data.ts`: nova edição online, campos `metaEdicao`, `percentuais.beneficiamento/certificacao`, `linkGrupoWhatsapp` por turma.
- `src/lib/gestor-menu.ts`: filtro de itens por modalidade (presença/visitas ocultos no online; mensagens direcionadas visíveis só no online).
- `src/routes/gestor.e.$edicaoId.index.tsx`: divide em `HomePresencial` e `HomeOnline` (componentes em `src/components/`), escolhidos por `edicao.modalidade`.
- `src/routes/gestor.e.$edicaoId.selecao.tsx`: painel de ocupação + ações de alocação.
- `src/components/atividade-config.tsx`: prazo D+2, penalidade de atraso, comunicação condicionada à modalidade.
- Continua tudo com dados fictícios em memória, sem backend.
