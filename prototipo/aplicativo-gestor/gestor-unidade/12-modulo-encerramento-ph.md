# Módulo Encerramento (P/H) — carga horária

| Campo | Valor |
| ----- | ----- |
| **Onde** | Grade de **Módulos** da edição (não menu “Workshop”) |
| **Perfil** | Gestor libera/configura como demais aulas |
| **UCs** | UC15, UC34, UC38 (só se for aula/encontro — **sem** funil doação) |
| **Modalidade** | **Presencial / híbrido** |
| **Prioridade** | MVP |

---

## Objetivo

Quando formatura / integração / encerramento **conta na carga horária**, cadastrar como **módulo (ou aula) obrigatório de encerramento** — não como “conteúdo extra”.

| Isto | Não é |
| ---- | ----- |
| Módulo/aula de encerramento P/H | Funil online Live → KW → Quiz |
| Conta % / carga / beneficiamento | Liberação automática para doação |
| Tipo **aula** (presencial ou Meet) | Conteúdo extra |

Doação em P/H continua **manual a qualquer momento** (UC57) — independente deste módulo.

---

## Wireframe — na visão Módulos

```
┌──────────────────────────────────────────────────┐
│ Módulos — Empreende Mulher 2027 (P/H)            │
│ … Módulo 5 — Finanças                            │
│ ▼ Módulo Encerramento (obrigatório)              │
│   └ Aula — Formatura / integração                │
│      Data · Local (ou link Meet) · Liberar       │
│   ℹ Conta na carga horária                       │
│   ℹ Não libera doação — Unidade aprova em Doação │
│ [ + Conteúdo extra ]  ← não conta %/carga        │
└──────────────────────────────────────────────────┘
```

## Regras

- Configurar natureza da sessão na liberação: **presencial** (endereço) ou **ao vivo** (link)  
- **Conteúdo extra** (ex. oficina de foto) fica registrado, mas **fora** do % obrigatório  
- Online (Empreende no Zap): usar [09-workshop-encerramento.md](09-workshop-encerramento.md) (Live + Funil), não este arquivo  
