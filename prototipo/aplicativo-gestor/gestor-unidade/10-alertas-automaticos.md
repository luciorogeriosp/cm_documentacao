# Gestor — Alertas automáticos da edição

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/comunicacao/alertas` |
| **Perfil** | **Gestor de Unidade** (edita); Gestor de Turma (consulta turma) |
| **UCs** | UC87, UC52, UC26, UC53 |
| **Prioridade** | MVP |
| **Fonte** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) · [CMS alertas](../cms/01-alertas-automacoes.md) |

---

## Objetivo

Instanciar regras do CMS na edição (`EditionAlertBinding`): ligar/pausar, ajustar números, ver audiência e histórico. **Não cria** novos tipos de gatilho.

---

## Wireframe — lista / binding

```
┌──────────────────────────────────────────────────┐
│ Comunicação → Alertas automáticos                │
│ Edição Empreende no Zap 2027 · Online            │
├──────────────────────────────────────────────────┤
│ Regra (CMS)              Params     Status       │
│ Inscrição incompleta     2d + 3d    [● Ligado]   │
│   Audiência agora: 14 leads                      │
│   [ Ajustar ] [ Histórico ] [ Pausar ]           │
├──────────────────────────────────────────────────┤
│ Prazo atividade (4h)     4h         [● Ligado]   │
│   Elegíveis agora: 6                             │
├──────────────────────────────────────────────────┤
│ Backlog liberado (≥3)    ≥3         [○ Pausado]  │
│ Risco curto online       ed. UC9    [● Ligado]   │
│ Fim com pendências       5d         [● Ligado]   │
├──────────────────────────────────────────────────┤
│ ℹ Disparo manual de reforço: Mensagens UC53      │
│ ℹ Mini CRM (UC26) mostra leads + histórico auto  │
└──────────────────────────────────────────────────┘
```

### Ajustar parâmetros

```
┌──────────────────────────────────────────────────┐
│ Ajustar — Inscrição incompleta                   │
│ Atraso inicial: [ 2 ] dias                       │
│ Reforço a cada: [ 3 ] dias                       │
│ Máx. envios:    [ 2 ]                            │
│ Template e-mail: (herdado do CMS)                │
│ Pausar até: [__/__/____] (opc.)                  │
│ [ Cancelar ]  [ Salvar override ]                │
└──────────────────────────────────────────────────┘
```

### Preview / histórico

```
┌──────────────────────────────────────────────────┐
│ Audiência — Inscrição incompleta                 │
│ ☐ Maria · etapa 1 · há 3 dias                    │
│ ☐ Ana   · etapa 2 · há 5 dias                    │
│ Último auto: e-mail há 1d · próximo reforço: 2d  │
│ [ Exportar ]                                     │
└──────────────────────────────────────────────────┘
```

---

## Regras

- Só regras cuja audiência cobre a **modalidade** da edição aparecem.
- Override não altera a regra global do CMS — só o binding.
- Turma: vê subset da própria turma; sem toggle global.
- Ao concluir inscrição / sair do estado: Backend cancela pendentes (UC87).
