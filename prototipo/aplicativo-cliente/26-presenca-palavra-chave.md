# Presença — palavra-chave (pós-live online)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (presença / KW) |
| **Perfil** | Empreendedora |
| **UCs** | UC38 |
| **Prioridade** | MVP |
| **Modalidade** | **Somente online** (funil de doação) |

---

## Objetivo

Após a live de encerramento, confirmar presença com **palavra-chave**. Validação case/acento-insensitive; **timestamp**; prazo rígido da edição. Sucesso **desbloqueia** o questionário final.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Confirme sua presença     │
│  Após a live de encerramento    │
├─────────────────────────────────┤
│  Prazo: até 22/08 23:59         │
│  Palavra-chave *                │
│  [____________________]         │
│  [ Confirmar ]                  │
│  ℹ Sem data de pagamento aqui   │
└─────────────────────────────────┘
```

### Sucesso

```
┌─────────────────────────────────┐
│  ✓ Presença registrada          │
│  [ Ir ao questionário final ]   │
└─────────────────────────────────┘
```

### Erro / prazo

```
┌─────────────────────────────────┐
│  ✗ Palavra-chave incorreta      │
│  — ou —                         │
│  ⏰ Prazo encerrado             │
│  Fale com sua educadora         │
└─────────────────────────────────┘
```

---

## Regras

- Só aparece se live liberada e empreendedora na base 100%  
- Não embutir KW no player YouTube  
- Timestamp alimenta ranking pós-elegibilidade (não auto-doa)  
- P/H: esta tela **não existe** para doação  
