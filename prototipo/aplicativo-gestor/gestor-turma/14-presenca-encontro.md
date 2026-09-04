# Presença no encontro

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/presenca/[encontroId]` |
| **Perfil** | Gestor de Turma |
| **UCs** | UC40, UC41, UC42 |
| **Prioridade** | MVP |

---

## Objetivo

Exibir QR Code para check-in das participantes e registrar presença manual quando necessário.

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ Presença — Encontro Módulo 2                     │
│ 15/06/2027 14h | Local: Unidade Centro           │
├──────────────────────────────────────────────────┤
│ QR Code para participantes                       │
│ ┌─────────────┐                                  │
│ │  [QR CODE]  │  [ Tela cheia ] [ Imprimir ]    │
│ └─────────────┘                                  │
│ Aponte a câmera do celular para registrar        │
├──────────────────────────────────────────────────┤
│ Registro manual (UC41)                           │
│ Busca: [CPF ou nome________] [Registrar presença]│
├──────────────────────────────────────────────────┤
│ Presentes: 14/18                                 │
│ ☑ Maria Silva — 14:05 — QR                       │
│ ☑ Ana Costa — 14:12 — QR                         │
│ ☐ Joana Lima — —                                   │
│ ☑ Carla Souza — 14:20 — Manual                   │
└──────────────────────────────────────────────────┘
```

---

## Regras

- QR vinculado ao evento/turma
- Presença manual registra origem "manual"
- Atualiza frequência UC42
