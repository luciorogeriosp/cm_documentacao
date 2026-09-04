# Atividade — Tarefa de casa (upload)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: tarefa_casa) |
| **Perfil** | Empreendedora |
| **UCs** | UC43, UC44 |
| **Prioridade** | MVP |

---

## Objetivo

Enviar documentos/fotos da tarefa de casa para aprovação do gestor de turma.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Tarefa de casa            │
│  Status: Aguardando aprovação   │  ← ou Reprovada ⚠
├─────────────────────────────────┤
│  Descrição da atividade         │
│  [texto do gestor/CMS]          │
├─────────────────────────────────┤
│  ⚠ Observação do gestor:        │  ← se em revisão
│  "Refaça com foto do produto"   │
├─────────────────────────────────┤
│  Arquivos enviados              │
│  📷 foto1.jpg  [x]              │
│  [ + Adicionar arquivo ]        │
│  Máx: 5 arquivos, 10MB cada     │
├─────────────────────────────────┤
│  [ Enviar para avaliação ]      │
└─────────────────────────────────┘
```

---

## Regras

- Aprovação **obrigatória** do gestor (UC44)
- Reprovação: notificação WhatsApp/e-mail + badge de atenção na home
- Permite reenvio até aprovação
- Gestor pode inserir em nome da participante (UC69)
