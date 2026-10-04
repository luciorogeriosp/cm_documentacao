# Certificados

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/certificados` |
| **Perfil** | Empreendedora |
| **UCs** | UC63, UC55, UC70 |
| **Prioridade** | MVP |

---

## Objetivo

Consultar e baixar certificados (item **Certificados** do rodapé). **Não há evento de entrega.** Programa (UC13) e Mentoria (um por caso ao encerrada). Sem certificado se atendida pelo gestor.

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

- Item do rodapé; filtro **Programa | Mentoria**
- Copy: **não há evento de entrega** — o PDF é o certificado
- Mentoria: um por caso ao status encerrada
- Atendida pelo gestor: **sem** certificado de mentoria
- PDF gerado pelo backend (UC55); também pode ir por WhatsApp
