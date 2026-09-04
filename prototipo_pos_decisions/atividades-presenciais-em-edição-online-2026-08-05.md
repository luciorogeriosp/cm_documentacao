# Atividades presenciais em edição online

> **Supersessão (Gestor P/H, 24–25/ago.):** Evento Presencial e Aula ao Vivo foram unificados no tipo **Aula** (natureza presencial ou ao vivo na liberação, no mesmo módulo). Este documento permanece válido só para **ocultar Aula e Visita Técnica na edição online**. Spec: [19-aula-unificada.md](../prototipo/aplicativo-gestor/gestor-turma/19-aula-unificada.md).

## Resposta direta

Não. Em uma edição **online** (ex.: Empreende no Zap) não deve haver atividades do tipo **Aula** (ex-Evento Presencial / Aula ao Vivo) nem **Visita Técnica**. A jornada é 100% remota, com liberação por temporizador e envio pelo WhatsApp.

## Inconsistência atual

Hoje `src/lib/gestor-modulos.ts` possui uma única matriz de módulos compartilhada entre todas as modalidades. Essa matriz inclui várias atividades presenciais (ex.: "Boas-vindas e apresentação", "Encontro — construindo o plano", "Visita técnica de diagnóstico"). Quando o gestor abre a edição online `empreende-no-zap-2027` em `/modulos`, essas atividades aparecem como se pudessem ser configuradas com data, hora e local — o que contradiz a home online, que já diz "Nesta modalidade não há presença nem visita técnica".

## O que será ajustado

1. **Matriz de módulos por modalidade**
   - Criar, em `src/lib/gestor-modulos.ts`, uma matriz específica para programas **online**, removendo `Evento Presencial`, `Visita Tecnica` e `Aula ao Vivo`.
   - Manter a matriz atual para **presencial/híbrido**.
   - Exportar uma função `modulosPorModalidade(modalidade)` que retorne a matriz correta.

2. **Tipos de atividade permitidos por modalidade**
   - Online: `Video Aula`, `Atividade`, `Registro de Faturamento`, `Tarefa de Casa`, `Download de Conteúdo`, `Plano de Ação`, `Questionário Inicial`, `Questionário Final`, `NPS`.
   - Presencial/híbrido: todos os tipos, incluindo presenciais.

3. **Página de módulos**
   - Em `src/routes/gestor.e.$edicaoId.modulos.tsx`, usar `modulosPorModalidade(edicao.modalidade)`.
   - Em online, esconder o botão "+" de aula extra presencial (UC35 só se aplica a presencial/híbrido).
   - Ajustar o totalizador `totalAtividades` para ser calculado a partir da matriz da modalidade.

4. **Configuração de atividade**
   - Em `src/components/atividade-config.tsx`, garantir que atividades online não peçam `data`, `hora` nem `local`.
   - Manter prazo D+2 para tarefas/uploads e link da plataforma educacional.
   - Esconder o facilitador "Comunicar para grupo WhatsApp" em online; usar link mágico/disparo do temporizador.

5. **Menu lateral**
   - Em `src/lib/gestor-menu.ts`, ocultar `Presença` e `Visitas técnicas` quando a edição for online.
   - Manter `Mensagens direcionadas` e `Comunicação WhatsApp` visíveis em online.

6. **Home online**
   - Manter a mensagem atual de ausência de presença/visita.
   - Garantir que a ação rápida "Abrir módulos" leve para a matriz online correta.

7. **Dados de exemplo**
   - Em `src/lib/gestor-data.ts`, manter a edição `empreende-no-zap-2027` como online.
   - Garantir que os KPIs e alertas da edição online não façam referência a encontros presenciais.

## Escopo fora deste ajuste

- Não alterar a tela de seleção/classificação (já tratada no plano anterior).
- Não criar backend real; continua tudo em memória/mock.
- Não alterar o fluxo de cancelamento/reativação de atividades.
