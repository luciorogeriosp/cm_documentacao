# Inscrição — Dados do programa

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/programa` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC21 |
| **Prioridade** | MVP |

---

## Objetivo

Coletar informações específicas do programa/edição e aceite final do regulamento. **Não** inclui internet/WhatsApp como critério que impede cadastro (esses campos, se ativos, estão nos blocos 3–4 / [05](05-inscricao-dados-financeiros.md) e **pontuam** na régua — UC12/UC23).

---

## Wireframe

```
┌─────────────────────────────────┐
│  ●●●●○  Etapa 4 de 5            │
├─────────────────────────────────┤
│  Informações do programa        │
├─────────────────────────────────┤
│  [Campos customizados da edição]│
│  Ex.: motivação, expectativas,  │
│  como conheceu o programa       │
├─────────────────────────────────┤
│  [ ] Li e aceito o regulamento  │
│      desta edição *             │
│  [ Ver regulamento completo ]   │
├─────────────────────────────────┤
│  [ Voltar ]    [ Finalizar ]    │
└─────────────────────────────────┘
```

---

## Pós-ação

- Status: "finalizada — aguardando seleção"
- Vínculo: programa + edição + unidade selecionada
- Dispara validação automática de elegibilidade (UC23): bloqueio já aplicado no cadastro (idade / disponibilidade P/H); score **X/Y** só da régua pontuável (6 critérios ativáveis, incl. internet e WhatsApp se ativos)

---

## Navegação

- **Anterior:** dados financeiros | **Próximo:** [07-inscricao-confirmacao.md](07-inscricao-confirmacao.md)
