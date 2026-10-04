# Questionário final — liberação para doação (online)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (questionário final) |
| **Perfil** | Empreendedora |
| **UCs** | UC39, UC38 |
| **Prioridade** | MVP |
| **Modalidade** | **Online** (após KW válida) |

> Questionário genérico (módulos): [13-atividade-questionario.md](13-atividade-questionario.md).

---

## Objetivo

Avaliação final do funil: **só 100% de acertos** → status ***liberada para doação*** (elegível à **seleção**, não ganhou). Não basta nota parcial. **Sem** botão de solicitar doação — o próximo passo é a gestora escolher quem recebe.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Questionário final        │
│  Questão 3 de 10                │
├─────────────────────────────────┤
│  (enunciado…)                   │
│  ( ) A  ( ) B  ( ) C            │
│  [ Confirmar ]                  │
├─────────────────────────────────┤
│  Prazo: 22/08 23:59             │
└─────────────────────────────────┘
```

### Resultado — passou (100%)

```
┌─────────────────────────────────┐
│  ✓ Questionário concluído       │
│  Status: Liberada para doação   │
│  ℹ Elegível ≠ ganhou.           │
│    Agora é torcer. A gestora    │
│    ainda escolhe quem recebe.   │
│  [ Voltar à home ]              │
└─────────────────────────────────┘
```

### Resultado — não passou

```
┌─────────────────────────────────┐
│  Ainda não liberada             │
│  Acertos: 8/10                  │
│  É preciso 100% de acertos      │
│  [ Tentar de novo ] ← se edição │
│    permitir dentro do prazo     │
└─────────────────────────────────┘
```

### Bloqueado (sem KW)

```
┌─────────────────────────────────┐
│  🔒 Confirme a presença (KW)    │
│  antes do questionário final    │
│  [ Ir à palavra-chave ]         │
└─────────────────────────────────┘
```

---

## Regras

- Gate: KW válida + prazo  
- Liberação doação = **100% certo**  
- Copy: **elegível ≠ ganhou / agora é torcer**
- Este quiz é o funil — **não** é o Encerramento de 30 dias
- Sem datas de pagamento  
