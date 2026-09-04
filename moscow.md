Com base no **Casos de Uso v4** e **[Design.md](http://Design.md)**, o modelo oficial é programa **online** ou **presencial**. **Híbrida** aqui significa edição **presencial** com atividades online pontuais (videoaulas, lives, tarefas no app) — sem orquestração Mautic como eixo principal.

---

## **Legenda MoSCoW**

| **Classificação** | **Significado**                                    |
| ----------------- | -------------------------------------------------- |
| **M** Must        | MVP; sem isso a jornada não opera                  |
| **S** Should      | Importante; pode entrar logo após o núcleo         |
| **C** Could       | Valor claro; Fase 3 ou refinamento                 |
| **W** Won't       | Explicitamente manual ou fora do escopo automático |

---

## **1. Automações transversais (online e presencial/híbrida)**

Aplicam-se em qualquer tipo de programa.

| **#** | **Automação**                                   | **UC**           | **M/S/C/W** | **Descrição**                                                                          |
| ----- | ----------------------------------------------- | ---------------- | ----------- | -------------------------------------------------------------------------------------- |
| 1     | **Validação de elegibilidade na inscrição**     | UC23             | **M**       | Regras automáticas (idade, renda, região, carência etc.) após inscrição completa       |
| 2     | **Comunicação do resultado da seleção**         | UC25             | **M**       | Disparo automático WhatsApp/e-mail (aprovada/reprovada)                                |
| 3     | **Geração e validação de link mágico**          | UC4, UC54        | **M**       | Token de sessão (~30 dias); acesso sem senha                                           |
| 4     | **Classificação de status da participante**     | UC29             | **M**       | Cálculo automático: inscrita → selecionada → em assessoria → beneficiada → certificada |
| 5     | **Notificação ao reprovar entrega**             | UC44             | **M**       | Gestor reprova → sistema notifica WhatsApp/e-mail + indicador no app                   |
| 6     | **Beneficiamento e emissão de certificado**     | UC13, UC55       | **M**       | Ao atingir % de conclusão configurado, certificado automático                          |
| 7     | **Registro de progresso em videoaula**          | UC37             | **S**       | % assistido; conclusão quando atinge meta                                              |
| 8     | **Interrupção de lembretes ao desistir**        | UC30             | **S**       | Cancelamento/desistência para liberações e lembretes                                   |
| 9     | **Consulta a histórico legado por CPF**         | UC22, UC62       | **S**       | Checagem automática na inscrição (somente leitura)                                     |
| 10    | **UUID + presença automática por deep link/QR** | UC67, UC40       | **S**       | Com sessão válida, abrir link registra presença sem passos extras                      |
| 11    | **Totalizadores BI com dados pregressos**       | UC71             | **C**       | Consolidação automática para relatórios                                                |
| 12    | **Anonimização LGPD após 5 anos**               | Segurança        | **C**       | Job de anonimização reversível (CPF, e-mail, telefone)                                 |
| 13    | **Premiação / capital semente / mentoria**      | UC57, UC58, UC70 | **W**       | Decisão e registro **manuais**                                                         |
| 14    | **Comunicação em grupo WhatsApp**               | UC50             | **W**       | Facilitador manual (clipboard + link); sem API de grupo                                |

---

## **2. Jornada ONLINE (Mautic como motor)**

Programa tipo **online**: alocação na turma (UC17) dispara webhook → **Mautic** orquestra cadência → **backend** executa envios.

| **#** | **Automação**                                                        | **UC**           | **M/S/C/W** | **Descrição**                                                                          |
| ----- | -------------------------------------------------------------------- | ---------------- | ----------- | -------------------------------------------------------------------------------------- |
| 1     | **Início da jornada ao alocar na turma**                             | UC17 → UC33      | **M**       | Webhook backend → Mautic inicia campanha                                               |
| 2     | **Liberação progressiva de atividades**                              | UC33, UC15       | **M**       | Próxima etapa só após conclusão da anterior + temporizador                             |
| 3     | **Temporizador entre atividades**                                    | UC15, UC33       | **M**       | Intervalo configurado no CMS (gestor **não** altera)                                   |
| 4     | **Envio de mensagem/link da atividade via WhatsApp**                 | UC49, UC54, UC33 | **M**       | Mautic aciona backend → Gupshup envia link mágico personalizado                        |
| 5     | **Geração de link com destino** (`turma_id`, `atividade_id`, `acao`) | UC54             | **M**       | Deep link para atividade, presença virtual, tarefa etc.                                |
| 6     | **Persistência de progresso e status**                               | UC33, UC29       | **M**       | Backend atualiza `tab_empreendedor_atividade` e status                                 |
| 7     | **Lembrete de atividade não concluída**                              | UC53             | **S**       | Gatilho Mautic (ex.: 48h) → lembrete via Gupshup                                       |
| 8     | **Envio em lote de vídeos após resposta**                            | UC33, UC51       | **S**       | Participante responde → backend envia todos os vídeos pendentes (`atividade_liberada`) |
| 9     | **Campanhas programadas** (lembretes de prazo, reengajamento)        | UC52             | **S**       | Agendamento no Mautic com gatilhos e templates                                         |
| 10    | **Texto aberto via WhatsApp** (etapa da jornada)                     | UC15, UC33       | **S**       | Mensagem automatizada como atividade do módulo                                         |
| 11    | **Desbloqueio da próxima etapa ao concluir videoaula**               | UC37, UC33       | **S**       | Conclusão registrada → libera sequência Mautic                                         |
| 12    | **Mini CRM — reengajar inscrição incompleta**                        | UC26             | **C**       | Disparo automático de link de retomada (se consentiu comunicação)                      |
| 13    | **Chat IA para dúvidas**                                             | UC64             | **C**       | Respostas automáticas; escala para humano                                              |
| 14    | **Comunicação em grupo da turma**                                    | UC50             | **W**       | Manual (não entra na jornada Mautic)                                                   |

---

## **3. Jornada PRESENCIAL / HÍBRIDA**

Programa tipo **presencial** (ou híbrido): **gestor de turma** conduz sequência (UC34); **Mautic não orquestra** o fluxo principal. Automações são pontuais e de apoio.

| **#** | **Automação**                                                         | **UC**      | **M/S/C/W** | **Descrição**                                             |
| ----- | --------------------------------------------------------------------- | ----------- | ----------- | --------------------------------------------------------- |
| 1     | **Comunicação pós-seleção**                                           | UC25        | **M**       | Igual à transversal — entrada na turma                    |
| 2     | **Registro de presença por QR / deep link**                           | UC40, UC54  | **M**       | URL com turma + atividade + `acao=presenca`               |
| 3     | **Presença automática com UUID/sessão**                               | UC67, UC40  | **M**       | Retorno ao link/QR sem reautenticar                       |
| 4     | **Status e certificado ao cumprir critérios**                         | UC29, UC55  | **M**       | Frequência + entregas aprovadas                           |
| 5     | **Notificação ao reprovar tarefa/financeiro**                         | UC44        | **M**       | Feedback automático para reenvio                          |
| 6     | **Link mágico para atividades no app**                                | UC4, UC54   | **S**       | Tarefas, formulários, videoaulas complementares           |
| 7     | **Registro de progresso em videoaulas** (se houver no módulo)         | UC37        | **S**       | Híbrido: lives/YouTube com tracking                       |
| 8     | **Lembrete individual de prazo** (disparo gestor ou campanha pontual) | UC49, UC52  | **C**       | Sem jornada Mautic contínua; lembrete avulso              |
| 9     | **Validação de pré-requisito MEI** (programas com capital semente)    | UC58, fluxo | **C**       | Monitoramento automático de documento MEI                 |
| 10    | **Calendário de atividades no app**                                   | UC68        | **C**       | Exibição automática do cronograma configurado pelo gestor |
| 11    | **Sequência e cadência da jornada**                                   | UC34        | **W**       | Reordenar encontros = **manual** do gestor                |
| 12    | **Aviso de encontro no grupo WhatsApp**                               | UC50        | **W**       | Gestor copia mensagem e publica manualmente               |
| 13    | **Temporizador entre atividades**                                     | UC33        | **W**       | Não se aplica — só faz sentido em online                  |
| 14    | **Liberação progressiva via Mautic**                                  | UC33        | **W**       | Presencial/híbrido não usa Mautic como eixo               |

---

## **4. Comparativo rápido**

| **Capacidade**                    | **Online**                        | **Presencial / Híbrida** |
| --------------------------------- | --------------------------------- | ------------------------ |
| Orquestração Mautic               | **M** — eixo da jornada           | **W** — não usa          |
| Temporizador entre etapas         | **M**                             | **W**                    |
| WhatsApp individual automatizado  | **M** (sequência)                 | **S/C** (pontual)        |
| Presença QR/deep link automática  | **C** (se houver encontro online) | **M**                    |
| Aprovação de entregas pelo gestor | **M** (notificação auto)          | **M**                    |
| Certificado automático            | **M**                             | **M**                    |
| Grupo WhatsApp                    | **W** (manual)                    | **W** (manual)           |

---

## **5. Top 5 “Must” por jornada**

**Online**

1. Webhook UC17 → Mautic (início da jornada)
2. Liberação progressiva + temporizador
3. Envio WhatsApp com link mágico (UC49/UC54)
4. Atualização de progresso/status (UC29)
5. Certificado automático (UC55)

**Presencial / Híbrida**

1. Presença por QR/deep link (UC40)
2. Notificação de reprovação de entregas (UC44)
3. Status + certificado (UC29/UC55)
4. Link mágico para atividades no app (UC4)
5. Comunicação de seleção (UC25)

---

**Nota:** No v4 o tipo de programa é binário (`online` | `presencial`). **Híbrida** na prática = presencial com atividades online no mesmo módulo; herda automações presenciais no eixo operacional e as transversais (videoaula, links, certificado) onde existirem atividades digitais.
