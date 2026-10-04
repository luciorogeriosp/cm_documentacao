# CMS — Comunicação (evento × mensagem)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/admin/comunicacao` · `/admin/comunicacao/pacotes` · `/admin/comunicacao/pacotes/[id]` · `/admin/comunicacao/alertas` |
| **Perfil** | Administrador do Sistema / Administrador de Programa |
| **UCs** | UC88, UC87, UC9, UC25, UC33, UC50, UC82 |
| **Prioridade** | MVP |
| **Fonte** | [Casos de Uso v10.2 — UC88](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v10.2.md) · [comunicacao.md](../../docs/jornadas/comunicacao.md) · [Tipos de Atividade](../../Tipos_de_Atividade.md) |

> **Área separada** de edição, módulos e atividades. A **Gupshup** é o repositório dos textos. O CMS **não** edita copy: só a relação **evento → mensagem** (tabela default obrigatória). Pacote ou edição troca o ponteiro. **Mesmo corpo** no WhatsApp (API), no e-mail (SendGrid) e no clipboard do grupo (P/H).

---

## Objetivo

A **tabela default** já liga cada evento oficial a um modelo da Gupshup. O pacote (e a edição, UC9) só **troca o ponteiro**. Jornada (UC33), seleção (UC25 + **convite ao grupo**), liberação (UC34/UC50) e alertas (UC87) resolvem o recado pelo evento. No **módulo**, a atividade pode ter texto próprio (apoio ao vídeo, recado customizado) **ou** apontar um modelo da Gupshup. A pesquisa após a formação usa os **dias definidos no CMS** (padrão cerca de 30); o backend dispara (UC82).

**Duas filas no Backend** (inalterado): jornada OK/lote (UC33) ≠ alertas/resgate (UC87). Só a **relação evento × mensagem** fica nesta tela.

---

## Navegação

```
┌──────────────────────────────────────────────────────────────┐
│ Comunicação / Templates                                      │
├──────────────────────────────────────────────────────────────┤
│ [ Pacotes de jornada ]  [ Alertas e resgate (UC87) ]         │
└──────────────────────────────────────────────────────────────┘
```

- **Pacotes:** mensagens proativas da jornada (por tipo de atividade + momentos).
- **Alertas:** mesma área CMS — aba dedicada; ver [01-alertas-automacoes.md](01-alertas-automacoes.md).

---

## Pacotes — lista

```
┌──────────────────────────────────────────────────────────────┐
│ Pacotes de comunicação              [ + Novo pacote ]        │
├──────────────────────────────────────────────────────────────┤
│ Nome                      Modalidade    Edições   Ativo      │
│ Empreende no Zap 2026     Online        4       [●]          │
│ Consulado presencial      P/H           12      [●]          │
│ Híbrido padrão            Ambos         2       [○]          │
└──────────────────────────────────────────────────────────────┘
```

Ações: **Duplicar** · **Enviar teste** · Histórico de versão.

---

## Pacote — detalhe (templates por tipo)

Um **template Gupshup/Meta** (e opcionalmente e-mail) por **tipo de atividade**. **Aula** = **dois** templates (presencial e ao vivo), mesmo tipo na enum.

```
┌──────────────────────────────────────────────────────────────┐
│ Pacote: Consulado presencial 2026                            │
│ Modalidade: [ Presencial / híbrido ▼ ]  Versão: 3  [● Ativo]│
├──────────────────────────────────────────────────────────────┤
│ Momentos de jornada (não são tipos UC15) — inventário UC88   │
│  inscricao_pos_inbound     WA [ inscricao_v1 ▼ ]             │
│  selecao_entrevista        WA [ entrevista_v1 ▼ ]      P/H   │
│  selecao_aprovacao (UC25)  WA [ aprovacao_v1 ▼ ]             │
│  convite_grupo_turma       WA [ convite_grupo_v1 ▼ ]   P/H   │
│  selecao_nao_aprovada      WA [ nao_aprovada_v1 ▼ ]          │
│  jornada_pedir_ok          WA [ boas_vindas_ok_v1 ▼ ]  online│
│  jornada_boas_vindas       WA [ boas_vindas_lote_v1 ▼] online│
│  jornada_comunidade        WA [ comunidade_v1 ▼ ]      online│
│  live_convite / mentoria_disponivel / doacao_* / certificado │
│  o programa acabou / pesquisa (dias no CMS) / link de acesso │
│  Rede: vol_cadastro_* · vol_acao_* · vol_mentoria_combinada  │
│        vol_certificado · link_magico_voluntario (e-mail)     │
│  Operação: link_magico_gestor (e-mail)                       │
├──────────────────────────────────────────────────────────────┤
│ Por tipo de atividade (Aula presencial e ao vivo + demais)   │
│ Tipo              Variante     Recado WhatsApp     E-mail    │
│ Aula              presencial   aula presencial     —         │
│ Aula              ao vivo      aula ao vivo        —         │
│ Vídeo Aula        —            vídeo aula          ✉ opt.    │
│ Atividade         —            atividade           ✉ opt.    │
│ Tarefa de Casa    —            tarefa              ✉ opt.    │
│ Saúde financeira  —            saúde financeira    ✉ opt.    │
│ Download          —            download            —         │
│ Plano de Ação     —            plano de ação       ✉ opt.    │
│ Visita Técnica    —            visita              ✉ opt.    │
│ Quest. Inicial    —            chegada             ✉ opt.    │
│ Quest. Final      —            prova da live       ✉ opt.    │
│ NPS               —            NPS                 ✉ opt.    │
│ (pesquisa pós-formação é momento da jornada, dias no CMS — não é 12º tipo) │
├──────────────────────────────────────────────────────────────┤
│ Placeholders: {nome_social} {nome_completo} {nome_programa}  │
│   {titulo} {data} {hora} {local} {link} {link_atividade}     │
│   {data_limite} {edicao} {unidade} {turma} …                 │
│ Sem variável “primeiro nome”. Documento oficial = nome completo. │
│ [ Salvar ]  [ Duplicar pacote ]  [ Enviar teste ]            │
└──────────────────────────────────────────────────────────────┘
```

### Regras

- WhatsApp: modelo Meta **aprovado na Gupshup**. O CMS só escolhe o ponteiro (corpo **somente leitura**).
- Sem as variáveis **obrigatórias** do evento, o envio **não sai**.
- Recado e app: **nome social**. Certificado e recibo: **nome completo**.
- **Aula ao vivo** = encontro síncrono com link (P/H) — canal Meet ou YouTube + StreamYard, escolhido pelo gestor.
- Módulo (UC15) **não** cadastra template; tipo herda do pacote da edição.
- Pacote ou edição só troca o ponteiro. Edição publicada congela o snapshot.

---

## Uso na edição (UC9)

Campo isolado do wizard de módulos:

```
Pacote de comunicação: [ Consulado presencial 2026 ▼ ]
ℹ Ponteiros evento → Gupshup (tabela default). Pesquisa: N dias após o fim.
```

---

## Uso no Gestor — P/H (UC34 / UC50)

1. Liberação preenche placeholders a partir do template do **tipo** (+ variante Aula).
2. **Gestor de Unidade** e **Gestor de Turma** recebem o template sugerido e **podem editar na hora** (vale só aquele envio).
3. UC50 copia o texto final para clipboard e abre grupo — **sem disparo API** (exceto o envio pago da UC25 + convite ao grupo).

Wireframe liberação:

```
┌──────────────────────────────────────────────────┐
│ Liberar — Vídeo Aula                             │
│ Data limite * [ D+2 ]                            │
│ Mensagem (template videoaula_v1)                 │
│ [ Olá! {titulo} disponível até {data_limite}… ]  │
│ ℹ Unidade ou Turma edita o template sugerido na hora │
│ [ Comunicar para Grupo ] → clipboard + abrir WA  │
│ [ Liberar ]                                      │
└──────────────────────────────────────────────────┘
```

---

## Uso online (UC33)

Backend envia via Gupshup o **mesmo** modelo de mensagem no WhatsApp do pacote, por tipo de atividade de cada item do lote pós-OK. Gestor **não** edita na liberação (automação).

**Download:** além do template, o lote **anexa os arquivos** no WhatsApp da empreendedora; os **mesmos documentos** permanecem no Aplicativo Cliente. Esse envio **não** usa o checkbox de videoaula (UC9).

---

## Alertas (aba UC87)

Mesma rota `/admin/comunicacao`, aba **Alertas**. Os **seis** tipos (ficha incompleta, prazo, backlog, fim perto, risco curto, meio do curso) apontam modelos da Gupshup. Detalhe: [01-alertas-automacoes.md](01-alertas-automacoes.md).

---

## Critérios de aceite (CMS)

1. Existe área **Comunicação** separada de Módulos e Edição. CMS **não** edita copy.
2. Tabela default cobre os eventos da UC88 (jornada, tipos, alertas, benefícios, voluntariado, operação), **incluindo convite ao grupo**.
3. Edição seleciona pacote (só troca ponteiros). Pesquisa: **dias no CMS**; backend dispara. Encerramento **não** é 12º tipo nesta entrega.
4. P/H: clipboard usa o mesmo corpo da Gupshup; Unidade pode ajustar na hora de colar. UC25 + convite ao grupo podem ir no mesmo envio pago.
5. Online: UC33 usa os modelos da Gupshup via API. E-mail = mesmo corpo (SendGrid).
6. Alertas (os 6 tipos) na **mesma** área CMS.
7. Rede de voluntariado e links mágicos estão na mesma tabela default. Inventário e variáveis: UC88 / [comunicacao.md](../../docs/jornadas/comunicacao.md).
