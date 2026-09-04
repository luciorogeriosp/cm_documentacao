# Live e funil de encerramento (edição online)

| Campo | Valor |
| ----- | ----- |
| **Rotas** | `/gestor/e/[edicaoId]/encerramento/live` · `/encerramento/funil` |
| **Perfil** | Unidade configura e acompanha; Turma consulta |
| **UCs** | UC38, UC39 |
| **Prioridade** | MVP (Empreende no Zap / online) |
| **Modalidade** | **Somente edição online** |

> Pacote: [encerramento-doacao-mentoria.md](../encerramento-doacao-mentoria.md).  
> **P/H não usa esta tela.** Encerramento presencial = módulo de **aula** na grade (carga), sem funil KW/quiz.

> **Legado removido:** Base 75%, prova 0–100, prazo 24h genérico, feeds A/B do “Workshop” antigo — **não vigentes**.

---

## Objetivo

Operar o **funil de liberação para doação** online:

1. Base = **100%** das atividades  
2. Live (YouTube + StreamYard) **fora** da plataforma  
3. Atividade de **presença / palavra-chave** pós-live  
4. Questionário final **100% certo** → status *liberada para doação*

**Não** concede a doação — UC57 ainda aprova na tela Doação da Unidade (pop-up + **APROVAR**).

Empreende no Zap **não** usa a mesma grade de “aula” modular dos programas P/H.

---

## Wireframe — Live

```
┌──────────────────────────────────────────────────┐
│ Encerramento online — Live                       │
│ Edição Empreende no Zap 2027                     │
├──────────────────────────────────────────────────┤
│ 1. Base de convite                               │
│    Conclusão exigida: 100% das atividades        │
│    Convidáveis agora: 28   [ Ver lista ]         │
├──────────────────────────────────────────────────┤
│ 2. Live (YouTube + StreamYard — fora da plat.)   │
│    Data * [__/__/____]  Hora * [__:__]           │
│    Link YouTube * [________________]             │
│    [ Enviar convite por e-mail ]                 │
├──────────────────────────────────────────────────┤
│ 3. Presença / palavra-chave (pós-live)           │
│    Palavra-chave * [____________]                │
│    Prazo KW+quiz * [__/__/____ __:__]            │
│    Validação: case/acento-insensitive            │
│    Status: ( ) Oculta  (•) Liberar após live     │
├──────────────────────────────────────────────────┤
│ 4. Questionário final                            │
│    Liberação: 100% de acertos (não nota parcial) │
│    [ Ver acompanhamento do funil ]               │
│ [ Salvar ]                                       │
└──────────────────────────────────────────────────┘
```

## Wireframe — Funil

```
┌──────────────────────────────────────────────────┐
│ Funil online — acompanhamento                    │
│ 100% 28 · Live 25 · KW 22 · Quiz OK 18           │
│ Filtro: [ Sem KW ▼ ] [ Quiz incompleto ▼ ]       │
├──────────────────────────────────────────────────┤
│ Nome         100%  Live  KW   Quiz   Liberada?   │
│ Maria Silva  ✓     ✓     ✓    100%   Sim         │
│ Ana Costa    ✓     ✓     ✓     80%   Não         │
│ Joana Lima   ✓     ✓     ✗     —     Não         │
│ Paula Dias   ✗     —     —     —     Não         │
├──────────────────────────────────────────────────┤
│ [ Exportar CSV ]  [ Ir para Doação ]             │
│ ℹ Só Liberada=Sim entra em Sugerir/Aprovar       │
│ ℹ Liberada ≠ garantia de recebimento             │
│ ℹ Timestamp KW/quiz → ranking pós-elegibilidade  │
└──────────────────────────────────────────────────┘
```

## Regras

- Sem **100%** → não convida / não entra na live de doação  
- Live **fora** da plataforma  
- KW pós-live → só então o quiz; prazo rígido; timestamp  
- Quiz: **só 100% certo** libera  
- Múltiplas KW = **não canônico**  
