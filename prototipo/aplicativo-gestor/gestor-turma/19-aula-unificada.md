# Especificação de alteração — Aula presencial e ao vivo no mesmo módulo

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/modulos` (detalhe da atividade tipo Aula) |
| **Perfil** | Ambos (Turma e Unidade) |
| **UCs** | UC15, UC34, UC35, UC38 (modo Aula P/H), UC40, UC41, UC50, UC68, UC80 |
| **Prioridade** | MVP |
| **Modalidade** | Presencial / híbrido — **não** se aplica à edição 100% online |
| **Fonte** | Reunião 24/ago. · [UC34](../../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) · [Tipos de Atividade §3.1](../../../Tipos_de_Atividade.md) · [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §23 |
| **Hub** | [12-sequencia-atividades.md](12-sequencia-atividades.md) |

---

## 1. Objetivo

Unificar no **Aplicativo Gestor** os antigos tipos **Evento Presencial** e **Aula ao Vivo** em um único tipo **Aula**, configurável **no mesmo módulo**. A **natureza original** (`presencial` ou `ao_vivo`) é definida no **CMS** (UC15); na liberação (UC34) o gestor recebe esse valor como **default** e pode **alterá-lo** enquanto a sessão ainda não foi ministrada.

O CMS define o conteúdo programático da Aula (**natureza original**, título, descrição, dica, anexos metodológicos). O Gestor **não** altera a estrutura do módulo: só operacionaliza data, hora, natureza (override opcional) e local **ou** link.

---

## 2. Situação atual (a substituir)

- A matriz trata **Evento Presencial** e **Aula ao Vivo** como dois tipos distintos.
- O gestor não troca o formato depois de o tipo estar na linha do módulo.
- Cada formato exige tela/campos próprios; o mesmo módulo não expressa “é a mesma Aula, só muda o canal”.
- Conteúdo extra ainda aparece em trechos legados como “aula presencial extra”.
- A decisão de 05/ago. ([atividades presenciais em edição online](../../../prototipo_pos_decisions/atividades-presenciais-em-edição-online-2026-08-05.md)) filtra os dois tipos na edição online, mas **não** os unifica no P/H.

---

## 3. Situação proposta

Um tipo **Aula** no catálogo de atividades. Cada ocorrência na turma tem:

```
natureza: presencial | ao_vivo
```

O **mesmo módulo** pode ter várias Aulas, cada uma com natureza própria (ex.: oficina presencial na semana 3 e encontro Meet na semana 4). Não há duas linhas de tipo na matriz.

```
CMS (tipo Aula no módulo)
  natureza_original + título + descrição
        │
        ▼
Gestor UC34 — default natureza_original + data + hora
  (gestor pode override presencial ↔ ao_vivo)
        │
        ├── presencial → endereço, QR (UC40/UC41), relato (UC80)
        ├── ao vivo    → link Meet/plataforma, comparecimento, replay
        └── extra UC35 → o mesmo seletor de natureza (não conta %/carga)
```

**Fora desta especificação**

- Edição 100% online (Empreende no Zap): **sem** Aula e **sem** “+ conteúdo extra”.
- Live de encerramento do funil de doação (UC38 online, YouTube + KW) **não** é este tipo.
- Visita técnica permanece UC78 (agendamento 1 a 1), não é Aula.
- Encerramento P/H que conta carga = Aula (ou módulo de encerramento), **não** o funil Live/KW.

---

## 4. CMS — cadastrar Aula no módulo (UC15)

Rota CMS: **Módulos → adicionar atividade → tipo Aula**.

Campos no cadastro (Admin). **Não** incluem data, hora, local ou link.

```
┌─────────────────────────────────┐
│ Adicionar atividade — Aula      │
│ Título * [________________]     │
│ Descrição * [______________]    │
│ Natureza original *             │
│   (•) Presencial  ( ) Ao vivo   │
│ [ Cancelar ] [ Salvar ]         │
└─────────────────────────────────┘
```

| Campo | Obrigatório | Observação |
| ----- | ----------- | ---------- |
| Título | Sim | Propaga para o Gestor (somente leitura na liberação) |
| Descrição | Sim | Idem |
| Natureza original | Sim | `presencial` ou `ao_vivo` — default na liberação UC34 |

Spec CMS: [02-modulo-aula-evento.md](../../../cms/02-modulo-aula-evento.md).

---

## 5. Lista do módulo

Na expansão do accordion, a atividade da matriz aparece como **uma** linha `Aula`. Depois de configurada, a linha ganha badge da natureza.

```
┌──────────────────────────────────────────────────┐
│ Módulo: Finanças (3/16)                       V  │
│   Liberada · Aula · Presencial · 20/03 14h       │
│   Liberada · Aula · Ao vivo · 27/03 19h          │
│   Não liberada · Aula                         V  │
│   Liberada · Videoaula …                         │
│ ───────────────────────────────────────────────  │
│   Extra · Ao vivo · Oficina de fotografia        │
│   ℹ Não entra no % / carga                       │
└──────────────────────────────────────────────────┘
```

| Elemento | Comportamento |
| -------- | ------------- |
| `Aula` sem badge | Ainda não liberada — abre configuração |
| Badge `Presencial` / `Ao vivo` | Natureza vigente da ocorrência |
| `V` na linha liberada | Acompanhamento no mesmo acordeão |
| Duas linhas Evento Presencial + Aula ao Vivo | **Não** existem |

---

## 6. Liberar Aula

Ao marcar a atividade e abrir a configuração (UC34). A natureza vem **pré-selecionada** conforme `natureza_original` do CMS; o gestor pode trocar antes de salvar.

```
┌──────────────────────────────────────────────────┐
│ Liberar — Aula                                   │
│ Título (CMS, somente leitura)                    │
│ Oficina de precificação                          │
│ Descrição (CMS, somente leitura)                 │
│ …                                                │
│                                                  │
│ Natureza *  (•) Presencial  ( ) Ao vivo          │
│ ℹ Padrão do módulo: Presencial — você pode alterar│
│ Data * [__/__/____]  Hora * [__:__]              │
│                                                  │
│ Local / endereço *          ← só se presencial   │
│ [ Rua X, 100 — Centro — Rio Claro ___________ ]  │
│                                                  │
│ Link Meet/plataforma *      ← só se ao vivo      │
│ [ https://meet.google.com/… ________________ ]   │
│ Anexos (CMS) · [ + anexo operacional ]           │
├──────────────────────────────────────────────────┤
│ [ Comunicar aula pelo grupo WhatsApp ]           │
│ ℹ Msg com {data}, {hora} e {local} ou {link}     │
│   → clipboard → abre o grupo da turma (UC50)     │
├──────────────────────────────────────────────────┤
│ [ Cancelar ]  [ Liberar atividade ]              │
└──────────────────────────────────────────────────┘
```

### Campos

| Campo | Presencial | Ao vivo |
| ----- | ---------- | ------- |
| Data | Obrigatória, não retroativa | Obrigatória, não retroativa |
| Hora | Obrigatória | Obrigatória |
| Endereço | Obrigatório | Oculto; não persistir |
| Link Meet/plataforma | Oculto; não persistir | Obrigatório |
| Anexos CMS | Somente leitura | Somente leitura |

Endereço e link são **mutuamente exclusivos** (`xor`): a UI mostra só o campo da natureza selecionada. Trocar o rádio **antes de salvar** limpa o campo que deixa de valer e exige o novo.

Data no passado bloqueia a liberação.

---

## 7. Alterar sessão (foco desta especificação)

Enquanto a Aula **não foi ministrada**, o gestor altera natureza, data, hora e local **ou** link **no mesmo detalhe**, sem criar outra atividade e sem voltar ao CMS. A troca de natureza pode **divergir** de `natureza_original` do CMS (registrar em log/auditoria leve, se couber no protótipo).

```
┌──────────────────────────────────────────────────┐
│ Aula — Liberada · Presencial · 20/03 14h         │
│ Local: Rua X, 100                                │
│ [ Alterar sessão ]                               │
└──────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────┐
│ Alterar sessão — Oficina de precificação         │
│ Natureza *  ( ) Presencial  (•) Ao vivo          │
│ Data * [20/03/2026]  Hora * [19:00]              │
│ Link Meet/plataforma *                           │
│ [ https://meet.google.com/… ________________ ]   │
│ ℹ O endereço presencial será descartado.         │
│ [ ] Comunicar alteração pelo grupo WhatsApp      │
├──────────────────────────────────────────────────┤
│ [ Cancelar ]  [ Salvar alteração ]               │
└──────────────────────────────────────────────────┘
```

### O que pode mudar (não ministrada)

| Ação | Efeito |
| ---- | ------ |
| Presencial → ao vivo | Exige link; descarta endereço; some QR/relato da UI operacional (ainda sem registros) |
| Ao vivo → presencial | Exige endereço; descarta link; some replay da UI operacional |
| Reagendar data/hora | Atualiza calendário da turma e do Cliente (UC68) |
| Trocar local ou link | Mantém a natureza; atualiza Cliente |
| Comunicar UC50 | Opcional no save; mensagem usa os placeholders da **natureza atual** |

### Trava — sessão ministrada

**Ministrada** = existe ao menos **uma** presença registrada (QR, deep link ou manual) **ou** um comparecimento ao vivo.

Nesse estado:

- Natureza **bloqueada** (rádio desabilitado).
- Cancelar liberação **bloqueado** (regra já existente).
- Alterar data/hora/local/link **bloqueado** — a sessão já ocorreu para quem registrou presença.
- Continua permitido: relato (presencial), registro adicional de presença, link de replay (ao vivo).

Tentativa de trocar natureza após a primeira presença: recusa com aviso *“Não é possível alterar a natureza depois que há presença registrada.”*

Sem presença, a liberação pode ser **cancelada** ou a sessão **alterada**.

---

## 8. Acompanhamento no mesmo acordeão

O gestor não sai de Módulos para ver presença, relato ou comparecimento.

### Presencial (após liberada)

```
┌──────────────────────────────────────────────────┐
│ Aula · Presencial — Liberada · 20/03 14h         │
│ Local: Rua X, 100                                │
│ [ Alterar sessão ]  ← oculto se ministrada       │
├──────────────────────────────────────────────────┤
│ Relato do encontro (UC80)                        │
│ [ Como foi o encontro… ________________ ]        │
│ [ Salvar relato ]                                │
├──────────────────────────────────────────────────┤
│ Presença                                         │
│ [ QR Code — tela cheia / imprimir ]              │
│ Busca: [nome ou CPF________]                     │
│ ☑ Maria Silva  ☐ Ana Costa  ☐ Joana Lima         │
│ [ Registrar presença manual ]                    │
│ Presentes: 14/18                                 │
└──────────────────────────────────────────────────┘
```

Pendências de presença (`/gestor/e/[edicaoId]/presenca`) abrem este detalhe via `?atividade=`.

### Ao vivo (após liberada)

```
┌──────────────────────────────────────────────────┐
│ Aula · Ao vivo — Liberada · 27/03 19h            │
│ Link: [ Abrir Meet ]                             │
│ [ Alterar sessão ]  ← oculto se ministrada       │
├──────────────────────────────────────────────────┤
│ Compareceram (12)     │ Não compareceram (6)     │
│ Maria Silva           │ Joana Lima               │
│ …                     │ [ WhatsApp ] por linha   │
├──────────────────────────────────────────────────┤
│ Replay (opcional)                                │
│ [ https://… ________________ ]  [ Salvar ]       │
│ ℹ Assistir o replay não gera nova presença       │
└──────────────────────────────────────────────────┘
```

Sem QR físico. Comparecimento no horário (Cliente) registra presença. Replay **não** conta nova presença (UC38 modo Aula P/H).

---

## 9. Conteúdo extra (UC35)

O extra usa o **mesmo seletor de natureza**. Não é tipo da enum; **não** entra em `(X/Y)` nem em “Atividades para Beneficiar”.

Tela de criação/edição: [13-atividade-extra.md](13-atividade-extra.md).

| Natureza | Campos |
| -------- | ------ |
| Presencial | Local obrigatório; sem Meet |
| Ao vivo | Link obrigatório; sem local |

Troca presencial ↔ ao vivo **livre até ministrar**, com a mesma trava da Aula da matriz. Reagendar data/local/link + aviso UC50. Só P/H.

---

## 10. Comunicação (UC50)

Em P/H, **Comunicar aula pelo grupo WhatsApp** resolve template do **pacote UC88** (Aula: `presencial` ou `ao_vivo`; demais tipos: 1 template por tipo), preenche placeholders, copia para clipboard e abre o grupo. **Gestor de Unidade** pode editar corpo antes de copiar. Envio manual — **sem API** no grupo (mesmo cadastro Meta/Gupshup).

Placeholders conforme a natureza **vigente**:

| Natureza | Placeholders |
| -------- | ------------ |
| Presencial | `{data}`, `{hora}`, `{local}` |
| Ao vivo | `{data}`, `{hora}`, `{link}` |

Link do grupo ausente: permite liberar/alterar; bloqueia só o facilitador até cadastrar o convite (UC16).

---

## 11. Regras

- **P/H apenas.** Edição online: ocultar Aula e “+ conteúdo extra”.
- Perfis Turma e Unidade; Unidade opera o que a Turma opera.
- Gestor **não** altera a estrutura do módulo no CMS nem os temporizadores da jornada online (UC33).
- Data obrigatória e não retroativa; Aula (ambas as naturezas) exige horário.
- Uma Aula da matriz liberada conta para % / carga / beneficiamento (UC13). Extra não.
- Cancelar liberação só se **não** houver chamada nem entregas; cancelada some para as participantes e **não** conta no beneficiamento; o gestor pode reativar.
- Calendário da turma e do Cliente (UC68) refletem a natureza e o horário vigentes.

---

## 12. Impactos (fora das telas deste documento)

| Superfície | O que muda | O que não se especifica aqui |
| ---------- | ---------- | ----------------------------- |
| **CMS** | Matriz usa tipo `Aula`; cadastro com `natureza_original` + título + descrição | Wireframe: [02-modulo-aula-evento.md](../../../cms/02-modulo-aula-evento.md) |
| **Cliente** | Tela única: endereço **ou** botão Meet, conforme natureza | Wireframes em [12-atividade-aula-ao-vivo.md](../../aplicativo-cliente/12-atividade-aula-ao-vivo.md) |
| **Backend** | `natureza` na liberação; trava após primeira presença; sync calendário | Contrato de API |
| **BI** | Frequência da Aula; natureza como atributo da sessão | Painéis |

---

## 13. Critérios de aceite (Gestor)

1. No módulo P/H aparece o tipo **Aula**, não Evento Presencial + Aula ao Vivo.
2. O mesmo módulo pode listar uma Aula presencial e outra ao vivo como ocorrências do mesmo tipo.
3. Liberar com natureza presencial exige endereço; ao vivo exige link; os campos são mutuamente exclusivos.
4. Trocar natureza **antes** da primeira presença atualiza Cliente e calendário e permite novo UC50.
5. Trocar natureza **depois** da primeira presença é recusada com aviso; cancelar liberação também fica bloqueado.
6. Extra com natureza ao vivo não pede local; extra presencial não pede Meet.
7. Extra não altera `(X/Y)` nem “Atividades para Beneficiar”.
8. Em edição online, Aula e “+ conteúdo extra” não aparecem.
9. Replay de Aula ao vivo não gera nova presença.
10. Encerramento P/H de carga usa Aula (ou módulo de encerramento), não o funil Live/KW do online.
