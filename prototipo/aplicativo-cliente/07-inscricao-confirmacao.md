# Confirmação de inscrição

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]/inscricao/confirmacao` |
| **Perfil** | Empreendedora (inscrita) |
| **UCs** | UC21 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Cliente.md](../Aplicativo%20Cliente.md) |

---

## Objetivo

Confirmar envio da inscrição e orientar o **próximo passo no WhatsApp** (CTA imperativo) + prazo estimado de resultado.

---

## Wireframe

```
┌─────────────────────────────────┐
│  ✓  Inscrição enviada!          │
├─────────────────────────────────┤
│  ●●●●●  Concluído               │
│                                 │
│  Sua inscrição foi registrada   │
│  com sucesso.                   │
│                                 │
│  Programa: [nome]               │
│  Edição: [nome]                 │
│  Unidade: [alocada auto/def.]   │
│  Status: Em seleção             │
├─────────────────────────────────┤
│  Próximo passo — WhatsApp       │
│  Fale agora no WhatsApp para    │
│  confirmar sua inscrição:       │
│  (11) 9xxxx-xxxx                │
│  [ Falar no WhatsApp agora ]    │
│       ← wa.me (CTA imperativo)  │
│  Texto sugerido: "Quero         │
│  confirmar minha inscrição no   │
│  [nome da edição]"              │
│  ℹ Confirmação automática após  │
│    o inbound                    │
├─────────────────────────────────┤
│  Resultado previsto até:        │
│  [dd/mm] (prazo estimado)       │
│  Aprovadas serão avisadas por   │
│  WhatsApp (UC25).               │
├─────────────────────────────────┤
│  [ Ir para página inicial ]     │
└─────────────────────────────────┘
```

---

## Regras

- CTA **imperativo** abre `wa.me` com texto pré-preenchido; inbound dispara template Meta de inscrição (**não** inicia jornada)
- Programa Pílulas: pode exibir aprovação imediata se configurado
- Não exige login; sessão pode ser criada após seleção

---

## Navegação

- Fim do fluxo público de inscrição
