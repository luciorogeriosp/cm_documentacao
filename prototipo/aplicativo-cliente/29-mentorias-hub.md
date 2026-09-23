# Hub Mentoria

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/app/mentorias` |
| **Perfil** | Empreendedora |
| **UCs** | UC70, UC73 |
| **Prioridade** | Especificado |

Área própria no menu inferior. **P/H:** sempre, durante o programa. **Online:** só após lote de encerramento. Sem Mentoria no hambúrguer.

Gestor: [08-registrar-mentoria.md](../aplicativo-gestor/gestor-unidade/08-registrar-mentoria.md).  
Formulário: [28-solicitar-mentoria.md](28-solicitar-mentoria.md).  
Card (Gestor / portal do voluntariado): [card-mentoria.md](../comum/card-mentoria.md).

---

## Início / treinamento

Módulo educacional no CMS (mesmos tipos de atividade do programa: videoaula, questionário, download, tarefa, etc.). **Solicitar** bloqueado até concluir.

Inclusão pelo Gestor **não** exige treino: o caso aparece em Minhas (ou Em aberto se ainda sem lote).

```
┌─────────────────────────────────┐
│  Mentoria                       │
├─────────────────────────────────┤
│  Treino  1/3 atividades         │
│  [▶] O que é a sessão           │
│  [ ] Questionário de alinhamento│
│  [ ] Material de apoio   [PDF]  │
├─────────────────────────────────┤
│  [ Em aberto ] [ Minhas ] [ Encerradas ]
└─────────────────────────────────┘
```

---

## Abas

| Aba | Conteúdo |
| --- | -------- |
| Em aberto | Pedidos aguardando mentor; recusadas |
| Minhas | Alocada / em andamento; contato do líder **só aqui** |
| Encerradas | NPS pendente, finalizada, atendida pelo gestor |

### Em aberto

```
┌─────────────────────────────────┐
│  [ Em aberto ] Minhas Encerradas│
│  Crochê · Finanças · Aguardando │
│  [ Solicitar mentoria ]         │
└─────────────────────────────────┘
```

CTA **Solicitar** bloqueado se o módulo CMS estiver incompleto (aviso + link para Início).

### Minhas

```
┌─────────────────────────────────┐
│  Em aberto [ Minhas ] Encerradas│
│  Finanças · Em andamento        │
│  Líder: Ana · WhatsApp          │
└─────────────────────────────────┘
```

### Encerradas

```
┌─────────────────────────────────┐
│  Em aberto Minhas [ Encerradas ]│
│  Finanças · NPS pendente        │
│  [ Texto + NPS plataforma + NPS mentor ]
│  Gestão · Atendida pelo gestor  │
│  (sem certificado)              │
└─────────────────────────────────┘
```

---

## Encerramento (ela)

Quando o líder encerra (P/H) ou a sessão encerra (online):

- Texto sobre a mentoria *
- NPS da plataforma *
- NPS do mentor *

`atendida_gestor`: sem NPS de mentor, sem certificado.

---

## Duas origens

1. Ela solicita (formulário canônico, sem slot) → Em aberto.
2. Gestor inclui / aloca lote → Minhas (ou Em aberto se ainda sem lote).
