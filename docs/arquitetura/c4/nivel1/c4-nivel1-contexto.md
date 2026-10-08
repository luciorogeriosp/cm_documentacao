# C4 — Nível 1: Diagrama de Contexto

**Sistema:** Sistema de Gestão de Programas Sociais — Consulado da Mulher
**Fonte:** Casos de Uso — Consulado da Mulher v7

## Objetivo deste nível

Mostrar o sistema como uma caixa única (black box) e suas interações com pessoas (atores) e sistemas externos. É o nível de maior abstração do C4 — não entra em tecnologia nem em estrutura interna (isso é o Nível 2 — Container).

## Diagrama (preview — flowchart Mermaid)

Visualização compatível com o preview de Markdown no Cursor/VS Code (sem dialeto C4).

```mermaid
flowchart TB
  subgraph Pessoas["Pessoas (atores)"]
    leadPerson["Pré-inscrita (Lead)<br/>UC19/UC20/UC21"]
    empreendedora["Empreendedora<br/>Inscrição completa"]
    gestorUnidade["Gestor de Unidade"]
    gestorTurma["Gestor de Turma"]
    adminSistema["Administrador do Sistema"]
    adminPrograma["Administrador de Programa"]
  end

  sistema(("Sistema de Gestão de Programas Sociais<br/>(Consulado da Mulher)"))

  subgraph Externos["Sistemas externos"]
    gupshup["Gupshup<br/>WhatsApp Business API"]
    sendgrid["SendGrid<br/>E-mail transacional"]
    youtube["YouTube<br/>Videoaulas e lives"]
  end

  leadPerson -->|Pré-cadastro e termos| sistema
  empreendedora -->|Inscrição, conteúdo, entregas, jornada| sistema
  gestorUnidade -->|Classificar, entrevistar, alocar, comunicar, doação| sistema
  gestorTurma -->|Liberar atividades, entregas, presença| sistema
  adminSistema -->|Usuários, programas, unidades, segurança| sistema
  adminPrograma -->|Conteúdos, edições, critérios do escopo| sistema

  sistema -->|Mensagens WhatsApp| gupshup
  sistema -->|E-mails transacionais| sendgrid
  sistema -->|Referência e embed de vídeos| youtube
```

## Diagrama (fonte C4)

Notação oficial C4 para editores com suporte a `C4Context` (ex.: [mermaid.live](https://mermaid.live)).

```mermaid
C4Context
    title Diagrama de Contexto — Sistema de Gestão de Programas Sociais (Consulado da Mulher)

    Person(leadPerson, "Pré-inscrita (Lead)", "Iniciou a inscrição mas ainda não a concluiu (UC19/UC20/UC21)")
    Person(empreendedora, "Empreendedora", "Mulher empreendedora em situação de vulnerabilidade social, com inscrição completa")
    Person(gestorUnidade, "Gestor de Unidade", "Opera seleção, turmas e doação de todas as turmas da unidade")
    Person(gestorTurma, "Gestor de Turma", "Opera a própria turma: liberação de atividades, entregas, presença")
    Person(adminSistema, "Administrador do Sistema", "Perfil master: usuários, programas, unidades, configuração global")
    Person(adminPrograma, "Administrador de Programa", "Escopo restrito: conteúdos, programas, edições, unidades do seu escopo")

    System(sistema, "Sistema de Gestão de Programas Sociais", "Gerencia o ciclo completo: inscrição, seleção, aplicação educacional, doação e certificação de empreendedoras")

    System_Ext(gupshup, "Gupshup", "Provedor de WhatsApp Business API: textos, links mágicos, vídeos, templates Meta")
    System_Ext(sendgrid, "SendGrid", "Provedor de e-mail transacional: links mágicos, lembretes, alertas")
    System_Ext(youtube, "YouTube", "Hospedagem de videoaulas gravadas e transmissões ao vivo")

    Rel(leadPerson, sistema, "Realiza pré-cadastro e aceita termos")
    Rel(empreendedora, sistema, "Realiza inscrição, consome conteúdo, envia entregas, acompanha jornada")
    Rel(gestorUnidade, sistema, "Classifica, entrevista, aloca, comunica, aprova doação")
    Rel(gestorTurma, sistema, "Libera atividades, aprova entregas, acompanha turma")
    Rel(adminSistema, sistema, "Configura usuários, programas, unidades, configuração global")
    Rel(adminPrograma, sistema, "Configura conteúdos, edições, critérios do seu escopo")

    Rel(sistema, gupshup, "Envia/recebe mensagens WhatsApp", "API/Webhook")
    Rel(sistema, sendgrid, "Envia e-mails transacionais", "API")
    Rel(sistema, youtube, "Hospeda e referencia vídeos", "Links/Embed")
```

## Elementos

### Pessoas (atores)

| Ator | Papel no contexto |
|---|---|
| Pré-inscrita (Lead) | Iniciou o processo, ainda sem inscrição completa |
| Empreendedora | Usuária final da jornada educacional, via Aplicativo Cliente |
| Gestor de Unidade | Opera seleção e turmas de toda a unidade, via Aplicativo Gestor |
| Gestor de Turma | Opera apenas a própria turma, via Aplicativo Gestor |
| Administrador do Sistema | Controle total do CMS de Administração |
| Administrador de Programa | Escopo restrito a programas/edições no CMS |

> Colaborador, Voluntário/Mentor e Organização são **entidades de domínio**, não atores — não interagem diretamente com o sistema (ver convenção da spec v7).

### Sistema em foco

**Sistema de Gestão de Programas Sociais (Consulado da Mulher)** — plataforma única no diagrama de contexto; sua decomposição interna (CMS, Aplicativo Gestor, Aplicativo Cliente, Painel de Dados BI, Backend) é tratada no **Nível 2 — Container**.

### Sistemas externos

| Sistema | Papel | Acionado por |
|---|---|---|
| Gupshup | WhatsApp Business API (mensagens, links mágicos, templates Meta) | Somente pelo Backend |
| SendGrid | E-mail transacional (links mágicos, alertas) | Somente pelo Backend |
| YouTube | Videoaulas e transmissões ao vivo | Aplicativo Cliente (consumo) |

## Pendências / pontos a confirmar

- **Organização (Patrocinador/Parceiro):** hoje é entidade de domínio, mas a spec cita possível acesso restrito ao BI (UC59). Se confirmado, vira ator secundário neste diagrama.
- **Agente de IA (UC64):** é uma capacidade do Aplicativo Cliente, não um sistema externo — não entra como caixa própria neste nível.

## Notação

- **Preview local:** Mermaid `flowchart` (seção acima) — funciona no preview embutido de Markdown.
- **Fonte C4:** Mermaid `C4Context` — use mermaid.live ou extensão com suporte C4 para editar/visualizar o bloco da seção “fonte C4”.
