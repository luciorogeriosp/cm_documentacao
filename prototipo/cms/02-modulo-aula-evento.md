# CMS — Módulo: atividade tipo Aula (evento)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/admin/modulos` · `/admin/modulos/[id]` · adicionar atividade → tipo **Aula** |
| **Perfil** | Administrador do Sistema / Administrador de Programa |
| **UCs** | UC15 |
| **Prioridade** | MVP |
| **Fonte** | [Casos de Uso v7 — UC15](../../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v7.md) · [Tipos de Atividade §3.1](../../Tipos_de_Atividade.md) |
| **Gestor (liberação)** | [19-aula-unificada.md](../aplicativo-gestor/gestor-turma/19-aula-unificada.md) |

> **Decisão operacional (27/ago. 2026):** natureza original, título e descrição no **CMS**; data, hora e local/link na **liberação** do Gestor (UC34), com natureza editável até ministrar.

---

## Objetivo

Cadastrar no módulo reutilizável uma atividade tipo **Aula** (encontro síncrono presencial ou ao vivo). O Admin define o **conteúdo programático** e a **natureza original**; a operação (quando e onde ocorre) fica com o Gestor de Turma/Unidade.

---

## Adicionar Aula ao módulo

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

### Campos

| Campo | Obrigatório | Observação |
| ----- | ----------- | ---------- |
| **Título** | Sim | Exibido no Gestor (somente leitura na liberação) e no Cliente |
| **Descrição** | Sim | Contexto da sessão; somente leitura no Gestor na liberação |
| **Natureza original** | Sim | `presencial` ou `ao_vivo` — **default** na liberação UC34; gestor pode alterar até ministrar |

Dica de realização e anexos metodológicos seguem regras gerais de módulo (UC15), quando previstos.

---

## O que **não** entra no CMS

Estes campos são **operacionais** e pertencem exclusivamente ao **App Gestor** (UC34):

- **Data**
- **Hora**
- **Local / endereço** (presencial)
- **Link** Meet/plataforma (ao vivo)

O Admin **não** agenda nem informa onde a Aula ocorrerá — isso é definido por turma/edition na liberação.

---

## Terminologia na UI

- **Presencial** — encontro síncrono em local físico (QR, relato UC80).
- **Ao vivo** — encontro online síncrono com link (Meet/plataforma); **não** confundir com modalidade da **edição** (online/P/H).

---

## Fluxo resumido

```
CMS (UC15)                    Gestor (UC34)                 Cliente (UC68)
──────────                    ─────────────                 ──────────────
natureza_original      →    default + override opcional
título, descrição      →    somente leitura
                         →    data, hora, local ou link  →  calendário + detalhe
```

---

## Regras

- Tipo **Aula** unifica antigos Evento Presencial e Aula ao Vivo (reunião 24/ago.).
- **Não** existe Aula em edição **100% online** (matriz filtrada).
- Encerramento P/H de carga = Aula no módulo; funil Live/KW do online (UC38) é **outro** mecanismo.
- Visita técnica (UC78) permanece tipo separado — **não** é Aula.

---

## Critérios de aceite (CMS)

1. Ao adicionar tipo Aula, o formulário exige título, descrição e natureza original.
2. Formulário **não** exibe data, hora, local ou link.
3. Módulo salvo propaga `natureza_original` para a liberação no Gestor.
4. Edição posterior do módulo atualiza título/descrição/natureza original para **novas** liberações; sessões já liberadas mantêm snapshot operacional no Gestor (comportamento a confirmar no backend).
