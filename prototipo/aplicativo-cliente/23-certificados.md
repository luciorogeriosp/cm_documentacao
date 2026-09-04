# Certificados

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/certificados` |
| **Perfil** | Empreendedora |
| **UCs** | UC63, UC55 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar e baixar certificados emitidos automaticamente quando critérios de UC13 forem atendidos.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meus certificados         │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ 🎓 Certificado          │    │
│  │ Programa Empreenda 2027 │    │
│  │ Emitido: 15/08/2027     │    │
│  │ [ Baixar PDF ]          │    │
│  └─────────────────────────┘    │
├─────────────────────────────────┤
│  Nenhum certificado pendente.   │
│  Continue suas atividades!      │
└─────────────────────────────────┘
```

---

## Regras

- PDF gerado pelo backend (UC55)
- Disponível após classificação como certificada
- Envio também pode ocorrer via WhatsApp (Gupshup)
