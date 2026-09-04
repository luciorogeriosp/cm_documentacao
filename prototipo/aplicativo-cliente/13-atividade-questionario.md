# Atividade — Teste / Questionário

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/atividade/[id]` (tipo: teste/resposta aberta) |
| **Perfil** | Empreendedora |
| **UCs** | UC39 |
| **Prioridade** | MVP |

---

## Objetivo

Responder questões de múltipla escolha ou abertas com feedback educativo imediato.

---

## Wireframe

```
┌─────────────────────────────────┐
│  [←]  Teste — Módulo 1          │
│  Questão 2 de 5                 │
├─────────────────────────────────┤
│  Qual a melhor forma de         │
│  calcular o preço de venda?     │
│  ( ) Opção A                    │
│  ( ) Opção B                    │
│  ( ) Opção C                    │
├─────────────────────────────────┤
│  [ Confirmar resposta ]         │
├─────────────────────────────────┤
│  ✓ Feedback: A opção correta... │  ← após confirmar
│  [ Próxima questão ]            │
└─────────────────────────────────┘
```

---

## Regras

- Feedback explicativo após cada resposta — **sem nota numérica** ao participante (questionário de módulo)
- Pontuação interna opcional (gestor — UC56)
- Resposta incompleta bloqueia envio final
- Ao finalizar: atividade marcada como concluída
- **Questionário final de doação (online):** ver [13b-questionario-final-doacao.md](13b-questionario-final-doacao.md) — gate KW + **100% certo**
