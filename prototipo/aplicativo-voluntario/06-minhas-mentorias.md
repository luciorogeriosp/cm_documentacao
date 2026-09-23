# Minhas e Encerradas

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/voluntario/mentorias` (abas Minhas · Encerradas) |
| **Perfil** | Voluntário |
| **UCs** | UC70, UC63 |
| **Prioridade** | Especificado |

Abas: [Em aberto](04-demandas-abertas.md) · **Minhas** · **Encerradas**. Só entram as mentorias do **lote** desta pessoa.

---

## Minhas — líder

Agenda, registra consulta, encerra. Só opera depois do **módulo CMS**.

```
┌──────────────────────────────────────────────────┐
│  Mentorias  [ Em aberto | Minhas | Encerradas ]  │
│  Crochê da Edilene · Finanças · Você é líder     │
│  [ Card completo ]                               │
│  1ª consulta  18/09 14:00                        │
│  Ocorreu? ( ) Sim  ( ) Não                       │
│  Como foi *   Tempo (min) *                      │
│  Haverá próxima? ( ) Sim  ( ) Não                │
│  [ Salvar registro ]                             │
│  Se não ocorreu: [ Remarcar ] [ Encerrar… ]      │
│  [ Encerrar mentoria ]                           │
└──────────────────────────────────────────────────┘
```

**Encerrar:** motivo (lista CMS) + **texto sobre a mentoria** * + NPS **plataforma** * + NPS **mentorada** *. Dispara o mesmo par (texto + NPSes) dos acompanhantes e da mentorada. Status: encerrada / NPS pendente até todos enviarem.

---

## Minhas — acompanhante

Card completo. **Não** agenda, registra nem encerra. Quando o líder encerra: obrigatório **texto** + NPS plataforma + NPS mentorada. Horas e certificado **herdados**.

```
┌──────────────────────────────────────────────────┐
│  Crochê da Edilene · Finanças · Acompanhante     │
│  [ Card completo ]                               │
│  Líder: Ana Costa · Próx. consulta 18/09         │
│  Você acompanha esta mentoria.                   │
│  (após encerrar) Texto *  NPS plataforma *       │
│  NPS mentorada *                                 │
└──────────────────────────────────────────────────┘
```

---

## Encerradas

Histórico, horas (registradas ou **herdadas** do líder), certificado **individual por pessoa × mentoria** — [09-certificados.md](09-certificados.md). Sem certificado de coletiva/ação.

**Online:** diário próprio por linha (data, minutos, descrição); certificado por pessoa × sessão.
