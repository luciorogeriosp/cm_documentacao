# Termos e consentimentos

| Campo | Valor |
| ----- | ----- |
| **Rota** | Modal / etapa embutida em `/e/[slug]/...` |
| **Perfil** | Lead / Empreendedora |
| **UCs** | UC20 |
| **Prioridade** | MVP |

---

## Objetivo

Registrar aceites LGPD, comunicação, cookies, localStorage e regulamento da edição antes de coletar dados pessoais.

---

## Wireframe

```
┌─────────────────────────────────┐
│  Termos e privacidade           │
├─────────────────────────────────┤
│  [scroll] Texto LGPD completo   │
│  [ ] Li e aceito a Política de  │
│      Privacidade (obrigatório)  │
│  [ ] Autorizo comunicações por  │
│      WhatsApp e e-mail          │
│  [ ] Aceito uso de cookies      │
│  [ ] Aceito armazenamento local │
│      para retomar inscrição     │
│  [ ] Aceito regulamento da      │
│      edição (uso de imagem)     │
├─────────────────────────────────┤
│  [ Voltar ]    [ Continuar ]    │
└─────────────────────────────────┘
```

---

## Regras

- LGPD obrigatório — bloqueia continuidade se desmarcado
- Comunicação opcional — impacta Mini CRM (UC26)
- Cookies/localStorage recusados — fluxo permitido sem retomada automática (UC67)
- Registrar: data/hora, versão do termo, dispositivo

---

## Navegação

- Embutido em pré-cadastro e inscrição
- **Anterior:** landing | **Próximo:** pré-cadastro ou inscrição
