# Atividade — Download de ferramenta

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: download) |
| **Perfil** | Empreendedora |
| **UCs** | UC36 |
| **Prioridade** | MVP |

---

## Objetivo

Baixar PDF, planilha ou guia educacional e registrar conclusão da atividade.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Ferramenta: Planilha      │
│       de fluxo de caixa         │
├─────────────────────────────────┤
│  Descrição do material          │
├─────────────────────────────────┤
│  📄 planilha-fluxo-caixa.xlsx   │
│  [ Baixar arquivo ]             │
├─────────────────────────────────┤
│  [ Marcar como concluída ]      │
└─────────────────────────────────┘
```

---

## Regras

- Download registrado como engajamento no **Aplicativo Cliente** (baixou / marcou como concluída)
- Arquivos hospedados no backend/CMS
- **Online:** após o OK da jornada, o mesmo material é **enviado no WhatsApp** (template Download + arquivos) **e** permanece nesta tela
- Receber o arquivo no WhatsApp **não** conclui a atividade por si só
