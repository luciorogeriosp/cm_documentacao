# Layout e navegação — Aplicativo Gestor

| Campo | Valor |
| ----- | ----- |
| **Tipo** | Shell / layout |
| **Perfil** | Gestor de Unidade, Gestor de Turma, **Gestor de Voluntariado** |
| **Prioridade** | MVP |
| **Fontes** | [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) §3 · [encerramento-doacao-mentoria.md](../encerramento-doacao-mentoria.md) |

---

## Fluxo

1. Login por **link mágico** (só e-mail)
2. **Gestor de Voluntariado:** entra **direto** em `/gestor/voluntariado` com o menu contextual. **Não** passa pelo Dashboard de edições.
3. **Unidade/Turma:** Dashboard de edições → ao **abrir uma edição**, shell do papel nessa edição

---

## Shell — Gestor de Voluntariado (sem edição)

Rotas sob `/gestor/voluntariado/…`. Badge do papel **Gestor de Voluntariado**. **Sem** Dashboard de edições, sem seletor de turma/modalidade, sem Trocar edição. O menu contextual já é o da sessão.

```
Voluntariado
  Home
  Gestão de ações
  Gestão de voluntários
  Gestão de mentorias
```

Telas: [00-home.md](../gestor-voluntariado/00-home.md), [01-gestao-acoes.md](../gestor-voluntariado/01-gestao-acoes.md), [02-gestao-voluntarios.md](../gestor-voluntariado/02-gestao-voluntarios.md), [03-gestao-mentorias.md](../gestor-voluntariado/03-gestao-mentorias.md).

---

## Header (dentro da edição)

- Logo + nome + badge do papel **nesta edição**
- Edição ativa + **[ Trocar edição ]** → volta ao Dashboard de edições
- Selo de **modalidade** (online | presencial | híbrido) — **define o menu de Encerramento/Doação**
- Seletor de turma (Unidade: Todas / turma; Turma: só as suas)
- Notificações · Sair

---

## Menu unificado (só após selecionar edição)

Rotas sob `/gestor/e/[edicaoId]/…`

**Módulos** = hub de execução. **Pendências** = visões consolidadas (`?atividade=`).  
**Aula** = tipo unificado presencial ou ao vivo (gestor informa Meet **ou** endereço). **Conteúdo extra** ≠ plano; não conta %/carga obrigatória.

```
Edição
  Home da edição

Unidade  (apenas Gestor de Unidade)
  Seleção e classificação
  Comunicar seleção
  Alocar / Mover

Turma
  Turmas
  Participantes
  Módulos
  Mentorias             ← P/H: Unidade/Turma alocam lote
  Voluntários           ← recorte da edição para alocar mentoria (não CRM)

Pendências
  Entregas a aprovar
  Financeiro a aprovar
  Presença              ← oculto se edição online
  Visitas técnicas      ← oculto se edição online

── Encerramento / Doação (muda com a modalidade) ──
```

### Menu — edição **presencial / híbrido**

```
Encerramento / Doação          ← bloco só Unidade
  Doação (processos · totais)  ← aprovar só aqui (digite APROVAR)
  Recibo / PIX / Aceites       ← pós-aprovação (UC86)
  Notas fiscais                ← NF 1:N doações (material)
```

**Mentorias P/H** ficam no bloco **Turma** (programa regular). **Voluntários** = atalho para escolher mentor. **Ações (UC90)** saíram deste menu — Gestor de Voluntariado. Telas: [08-registrar-mentoria.md](../gestor-unidade/08-registrar-mentoria.md), [13-voluntarios.md](../gestor-unidade/13-voluntarios.md).

Turma **não** vê este bloco. Sugestão = tela de **Negócios**.

Módulo **Encerramento** (formatura/integração) entra na **grade de Módulos** se for carga horária obrigatória — **não** é item de menu “Workshop” e **não** libera doação sozinho.

### Menu — edição **online** (ex. Empreende no Zap)

```
Encerramento online            ← Turma consulta; Unidade opera
  Live de encerramento         ← só quem fez 100%
  Acompanhamento do funil      ← KW + quiz 100%
Doação                         ← só Unidade
  Processos / totalizadores    ← só liberadas; aprovar com APROVAR
  Recibo / PIX / Aceites
  Notas fiscais                ← NF 1:N (material)
  [ Lote auxiliar A–D ]        ← opcional
  Mentorias                    ← etapa final da jornada (UC70)
  Voluntários                  ← recorte para alocar (UC73)
```

```
Negócio
  Negócios
  Capital semente       ← Unidade (parecer UC58 ≠ modalidade UC57)

Apoio
  Histórico
  Ranking e engajamento
  Observações
  Comunicação WhatsApp
  Mensagens direcionadas  ← só edição online (UC53)
  Alertas automáticos     ← Unidade (UC87)
  Mini CRM (leads)
```

| Item | Turma | Unidade | Online | P/H |
| ---- | :---: | :-----: | :----: | :-: |
| Home / Turmas / Participantes / Módulos | ✓ | ✓ | ✓ | ✓ |
| Seleção / Comunicar / Alocar / Mover | — | ✓ | ✓¹ | ✓ |
| Live + Funil encerramento | consulta | ✓ | ✓ | — |
| Doação (tela `/doacao`) | — | ✓ | só liberadas | qualquer momento |
| Recibo / NF (abas em `/doacao`) | — | ✓ | ✓ | ✓ |
| Pendências → Entregas / Financeiro | ✓ | ✓ | ✓ | ✓ |
| Pendências → Presença / Visitas | ✓ | ✓ | — | ✓ |
| Mensagens direcionadas | ✓ | ✓ | só online | — |
| Mini CRM | ✓ | ✓ | ✓ | ✓ |
| Mentorias P/H (lista / solicitações / alocar lote) | aloca + consulta | ✓ | — | ✓ |
| Mentorias online (encerramento + pool) | consulta | ✓ | ✓ | — |
| Voluntários (recorte para alocar na edição) | ✓ | ✓ | ✓ | ✓ |

¹ Online: etapas 2–3 da seleção omitidas (turma única automática).

---

## Pendências (consolidadas)

- **Entregas a aprovar:** **Revisar** com comentário (não “reprovar”)
- **Financeiro a aprovar:** registros + anexo comprovante quando obrigatório
- **Presença / Visitas:** só P/H
- Badge = itens abertos no escopo

---

## Regras

- Itens de Unidade **ocultos** se o papel na edição for só Turma
- Unidade vê **todo** o menu (inclui operação de turma)
- Desktop: sidebar; mobile: hambúrguer
- Fonte de verdade: [Aplicativo Gestor.md](../../Aplicativo%20Gestor.md) · [encerramento-doacao-mentoria.md](../encerramento-doacao-mentoria.md)
