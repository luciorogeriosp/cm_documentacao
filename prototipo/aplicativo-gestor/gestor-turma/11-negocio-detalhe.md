# Detalhe do negócio

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/e/[edicaoId]/negocios/[id]` |
| **Perfil** | Ambos (Turma = só a própria turma) |
| **UCs** | UC31, UC32, UC57 |
| **Prioridade** | MVP |

---

## Objetivo

Visualizar negócio, empreendedoras associadas, mover participantes e **iniciar / ver doação** (UC57). **Aprovar não existe nesta tela.**

---

## Wireframe

```
┌──────────────────────────────────────────────────┐
│ [←] Cooperativa Artesanato                       │
│ Coletivo | CNPJ ***.***.***/****-**              │
│ Segmento: Artesanato                             │
│ Doação: sugerida · Material · R$ 2.000           │
├──────────────────────────────────────────────────┤
│ Empreendedoras (4)                               │
│ [ + Adicionar empreendedora ]                    │
│ Nome          Papel        Ações                 │
│ Maria Silva   Sócia        [ Mover ] [ Remover ] │
│ Ana Costa     Sócia        [ Mover ] [ Remover ] │
├──────────────────────────────────────────────────┤
│ [ Editar negócio ]  [ Ver doação ]               │
│ (sem processo: [ Iniciar doação ])               │
└──────────────────────────────────────────────────┘
```

---

## Ação Mover (UC32)

- Seleciona negócio destino ou cria novo
- Registra motivo e data
- Preserva histórico individual nos relatórios

## Doação (UC57)

- **Iniciar doação** se não houver processo aberto — modal tipo + valor + justificativa (fica no negócio; **não** abre `/doacao` para Turma)
- **Ver doação:** Turma = status só leitura aqui. Unidade = `/gestor/e/[edicaoId]/doacao?empreendimento=[id]` (painel onde **aprova**)
- Recusada: permite iniciar de novo
- 1 processo por empreendimento (coletivo = 1 doação)
- Online sem *liberada*: CTA oculto / *Conclua o funil*
