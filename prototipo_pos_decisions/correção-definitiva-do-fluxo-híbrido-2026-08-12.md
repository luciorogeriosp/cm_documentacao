# Correção definitiva do fluxo híbrido

## Objetivo
Garantir, com uma validação ponta a ponta, que uma candidata percorra **Qualificação → Oficina → Aprovação → Turma → Comunicação** e apareça efetivamente no Programa.

## Plano
1. **Reproduzir antes de alterar**
   - Executar o fluxo completo com uma candidata identificável, sem recarregar a página.
   - Registrar após cada etapa: status, presença, aprovação, turma, comunicação e `liberouJornada`.
   - Identificar exatamente a primeira transição em que o estado esperado deixa de chegar à tela seguinte.

2. **Corrigir a fonte do fluxo, não os contadores isoladamente**
   - Consolidar em uma única regra reativa quem é participante efetiva: candidata aprovada, alocada e comunicada com liberação de jornada.
   - Fazer listas do Programa, cabeçalho e KPIs consumirem essa mesma regra.
   - Evitar duplicidade entre participantes fictícias existentes e candidatas recém-liberadas.

3. **Validar o critério de aceite no navegador**
   - Completar novamente o fluxo híbrido pela interface.
   - Confirmar que a mesma candidata aparece na turma correta e nas atividades do Programa.
   - Confirmar atualização imediata dos totalizadores e ausência de tela branca, `ReferenceError` e avisos de navegação causados pelo fluxo testado.

## Critério de conclusão
A correção só será considerada pronta quando uma candidata específica, iniciada em “Inscritas”, aparecer nominalmente no Programa após a comunicação, mantendo o estado durante a navegação interna.

## Limite de escopo
Nenhuma mudança visual ou funcional fora desse fluxo será feita. Se a reprodução mostrar que o estado fictício é perdido apenas ao recarregar, isso será apresentado separadamente como limitação do armazenamento em memória, sem misturar com a correção do fluxo.
