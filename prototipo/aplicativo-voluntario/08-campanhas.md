# Ações (voluntariado)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/voluntario/acoes` — alias `/voluntario/campanhas` |
| **Perfil** | Voluntário ativo + módulo CMS + modalidade **Ações** (ou interesse compatível) |
| **UCs** | UC90 |
| **Prioridade** | Especificado |

O **Gestor de Voluntariado** **abre** a ação (pode existir **sem** edição). Cada ação tem **`slug`** e landing pública `/voluntario/a/[slug]`. No portal autenticado, o voluntário vê as ativas no período e se inscreve. GV confirma ou recusa. Horas no **diário da ação**. Ao **concluir** a ação, certificado genérico de participação para todas as pessoas `confirmado` (UC63 / UC90) — visível em [09-certificados.md](09-certificados.md).

Quem chega pelo slug já entra `inscrito` (e `em_analise` na rede). Convite: texto personalizado + mesmo slug.

Abas sugeridas no portal: **Em aberto · Minhas · Encerradas** (espelho das mentorias): abertas para inscrição; minhas (`inscrito`/`confirmado`); encerradas (`recusado` / ação encerrada).

```
┌──────────────────────────────────────────────────┐
│  Ações                                           │
│  [ Em aberto ] [ Minhas ] [ Encerradas ]         │
│  Gravação de depoimentos · 10–20/09              │
│  Tipo: Gravação · Áreas: Comunicação             │
│  Vagas: 3 restantes                              │
│  [ Inscrever-me ]                                │
├──────────────────────────────────────────────────┤
│  Oficina pontual — precificação · 22/09          │
│  Inscrito · aguardando confirmação               │
└──────────────────────────────────────────────────┘
          ↓ após Gestor de Voluntariado confirmar
┌──────────────────────────────────────────────────┐
│  Ação confirmada                                 │
│  Diário                                          │
│  22/09  90 min  Gravação no estúdio…             │
│  [ + Data *  Minutos *  Descrição * ]            │
│  [ Registrar ]                                   │
└──────────────────────────────────────────────────┘
```

Status: `inscrito` → `confirmado` | `recusado`. Recusado some da lista operacional; confirmado permanece com diário próprio. BI agrupa por **programa/ação**. Inscrição exigem módulo CMS.

Convite recebido do GV (e-mail / lista): a ação aparece em Em aberto com CTA **Aceitar convite**. Link do e-mail = `/voluntario/a/[slug]`.
