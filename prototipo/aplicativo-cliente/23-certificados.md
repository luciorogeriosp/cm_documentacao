# Certificados

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/certificados` |
| **Perfil** | Empreendedora |
| **UCs** | UC63, UC55, UC70 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar e baixar certificados emitidos automaticamente: **Programa** (critérios UC13) e **Mentoria** (um por caso ao `finalizada` — UC70). Sem certificado se `atendida_gestor`.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Meus certificados         │
│  [ Programa ] [ Mentoria ]      │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ Programa Empreenda 2027 │    │
│  │ Emitido: 15/08/2027     │    │
│  │ [ Baixar PDF ]          │    │
│  └─────────────────────────┘    │
├─────────────────────────────────┤
│  ┌─────────────────────────┐    │
│  │ Mentoria · Finanças     │    │
│  │ Emitido: 22/09/2027     │    │
│  │ [ Baixar PDF ]          │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘
```

---

## Regras

- Filtro **Programa | Mentoria**
- Mentoria: um certificado por caso ao status `finalizada`
- `atendida_gestor`: **sem** certificado de mentoria
- PDF gerado pelo backend (UC55)
- Envio também pode ocorrer via WhatsApp (Gupshup)
