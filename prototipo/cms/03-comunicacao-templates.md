# CMS — Comunicação / Templates (catálogo unificado)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/admin/comunicacao` · `/admin/comunicacao/pacotes` · `/admin/comunicacao/pacotes/[id]` · `/admin/comunicacao/alertas` |
| **Perfil** | Administrador do Sistema / Administrador de Programa |
| **UCs** | UC88, UC87, UC9, UC25, UC33, UC50 |
| **Prioridade** | MVP |
| **Fonte** | [Casos de Uso v7 — UC88](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) · [Tipos de Atividade](../../Tipos_de_Atividade.md) |

> **Área separada** de edição, módulos e atividades. Todos os textos aprovados (Meta/Gupshup) e e-mail ficam aqui. **Mesmo corpo** alimenta envio via API (online) e facilitador de grupo (P/H — clipboard).

---

## Objetivo

Centralizar **pacotes de comunicação** reutilizáveis: a edição (UC9) **seleciona um pacote**; jornada (UC33), seleção (UC25), liberação (UC34/UC50) e alertas (UC87) **resolvem** o template pelo tipo, momento ou gatilho — **sem** cadastrar mensagens no módulo (UC15).

**Duas filas no Backend** (inalterado): jornada OK/lote (UC33) ≠ alertas/resgate (UC87). Só a **configuração** fica unificada nesta tela.

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

Um **template Gupshup/Meta** (e opcionalmente e-mail) por **`TipoAtividade`**. **Aula** = **dois** templates (presencial e ao vivo), mesmo tipo na enum.

```
┌──────────────────────────────────────────────────────────────┐
│ Pacote: Consulado presencial 2026                            │
│ Modalidade: [ Presencial / híbrido ▼ ]  Versão: 3  [● Ativo]│
├──────────────────────────────────────────────────────────────┤
│ Momentos de jornada (não são tipos UC15)                     │
│  inscricao_pos_inbound     WA [ inscricao_v1 ▼ ]             │
│  selecao_aprovacao (UC25)  WA [ aprovacao_grupo_v1 ▼ ]       │
│  selecao_nao_aprovada      WA [ nao_aprovada_v1 ▼ ]          │
│  jornada_pedir_ok          WA [ boas_vindas_ok_v1 ▼ ]  online│
│  jornada_solicitar_conteudo WA [ proximo_conteudo_v1 ▼ ]     │
├──────────────────────────────────────────────────────────────┤
│ Por tipo de atividade (11 + Aula×2)                          │
│ Tipo              Variante     Template Meta WA    E-mail    │
│ Aula              presencial   aula_presencial_v1  —         │
│ Aula              ao_vivo      aula_ao_vivo_v1     —         │
│ Vídeo Aula        —            videoaula_v1        ✉ opt.    │
│ Atividade         —            atividade_v1        ✉ opt.    │
│ Tarefa de Casa    —            tarefa_v1           ✉ opt.    │
│ Reg. Faturamento  —            faturamento_v1      ✉ opt.    │
│ Download          —            download_v1         —         │
│ Plano de Ação     —            plano_acao_v1       ✉ opt.    │
│ Visita Técnica    —            visita_v1           ✉ opt.    │
│ Quest. Inicial    —            quest_inicial_v1    ✉ opt.    │
│ Quest. Final      —            quest_final_v1       ✉ opt.    │
│ NPS               —            nps_v1              ✉ opt.    │
├──────────────────────────────────────────────────────────────┤
│ Placeholders globais: {titulo} {data} {hora} {local} {link}  │
│   {link_atividade} {data_limite} {nome_edicao} {nome_turma} …  │
│ [ Salvar ]  [ Duplicar pacote ]  [ Enviar teste ]            │
└──────────────────────────────────────────────────────────────┘
```

### Regras

- WhatsApp: **obrigatório** `template_key` Meta aprovado no Gupshup (corpo sincronizado, somente leitura no CMS).
- **Aula ao vivo** = encontro síncrono com link (P/H) — **não** confundir com edição 100% online (sem Aula na matriz).
- Módulo (UC15) **não** cadastra template; tipo herda do pacote da edição.
- Edição publicada congela **snapshot** do pacote (alterações futuras não afetam jornadas ativas).

---

## Uso na edição (UC9)

Campo isolado do wizard de módulos:

```
Pacote de comunicação: [ Consulado presencial 2026 ▼ ]
ℹ Templates de jornada, liberação e seleção vêm deste pacote.
```

---

## Uso no Gestor — P/H (UC34 / UC50)

1. Liberação preenche placeholders a partir do template do **tipo** (+ variante Aula).
2. **Gestor de Unidade** pode **editar o corpo** na prévia antes de comunicar.
3. **Gestor de Turma** usa texto pré-montado (sem override).
4. UC50 copia texto **final** para clipboard e abre grupo — **sem disparo API** (exceto UC25).

Wireframe liberação:

```
┌──────────────────────────────────────────────────┐
│ Liberar — Vídeo Aula                             │
│ Data limite * [ D+2 ]                            │
│ Mensagem (template videoaula_v1)                 │
│ [ Olá! {titulo} disponível até {data_limite}… ]  │
│ ℹ Gestor Unidade pode editar antes de enviar     │
│ [ Comunicar para Grupo ] → clipboard + abrir WA  │
│ [ Liberar ]                                      │
└──────────────────────────────────────────────────┘
```

---

## Uso online (UC33)

Backend envia via Gupshup o **mesmo** `template_key` do pacote, por `TipoAtividade` de cada item do lote pós-OK. Gestor **não** edita na liberação (automação).

**Download:** além do template, o lote **anexa os arquivos** no WhatsApp da empreendedora; os **mesmos documentos** permanecem no Aplicativo Cliente. Esse envio **não** usa o checkbox de videoaula (UC9).

---

## Alertas (aba UC87)

Mesma rota `/admin/comunicacao`, aba **Alertas**. Regras tipadas (`inscription_incomplete`, `risk_short_online`, …) referenciam templates deste catálogo ou do mesmo inventário Gupshup/SendGrid. Detalhe: [01-alertas-automacoes.md](01-alertas-automacoes.md).

---

## Critérios de aceite (CMS)

1. Existe área **Comunicação** separada de Módulos e Edição.
2. Pacote cobre **11 tipos**; Aula tem **presencial** e **ao_vivo**.
3. Edição seleciona pacote; módulo não leva template.
4. P/H: clipboard usa corpo do template Meta; Unidade pode override antes de copiar.
5. Online: UC33 usa templates do pacote via API.
6. Alertas configuráveis na **mesma** área CMS.
