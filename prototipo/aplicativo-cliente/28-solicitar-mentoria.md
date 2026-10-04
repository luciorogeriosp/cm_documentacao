# Solicitar / diagnosticar mentoria

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/mentorias/solicitar` (a partir do hub [29](29-mentorias-hub.md)) |
| **Perfil** | Empreendedora |
| **UCs** | UC70 |
| **Prioridade** | Especificado |

> Invocado do hub Mentoria. **Não** entra no hambúrguer.  
> Gestor: [08-registrar-mentoria.md](../aplicativo-gestor/gestor-unidade/08-registrar-mentoria.md).  
> Card (Gestor / portal do voluntariado): [card-mentoria.md](../comum/card-mentoria.md).

---

## Quando o hub e o CTA aparecem

- **P/H:** atalho no programa, durante a formação.
- **Online:** atalho **só** depois de entrar no **lote** de encerramento.
- **Solicitar** bloqueado até concluir o módulo CMS do Início. Inclusão pelo Gestor **não** exige treino.

---

## Formulário (canônico)

Área CMS (select único) + 4 perguntas Caroline + períodos. **Sem data/hora** (P/H e online).

```
┌─────────────────────────────────┐
│  Solicitar mentoria             │
├─────────────────────────────────┤
│  Ajuda em que área? *           │
│  [ Finanças ▼]                  │
│  Motivo de empreender *         │
│  Maior dificuldade agora? *     │
│  O que resolver? *              │
│  Melhor período *               │
│  ☐ Manhã  ☐ Tarde  ☐ Noite  ☐ FDS│
├─────────────────────────────────┤
│  [ Cancelar ]  [ Enviar ]       │
└─────────────────────────────────┘
```

**P/H:** enviar → aberta (portal do voluntariado vê em **Em aberto**). Gestor pode alocar lote, recusar ou **Atendido pelo gestor**.  
**Online:** enviar → demanda aberta no pool (vagas da sessão default 1).

Dados bancários **não** entram neste fluxo (UC86).

---

## Origens

1. Ela solicita (este formulário) → aba Em aberto.
2. Gestor inclui / aloca lote → aba Minhas (ou Em aberto se ainda sem lote).

Não é visita técnica nem conteúdo extra.
