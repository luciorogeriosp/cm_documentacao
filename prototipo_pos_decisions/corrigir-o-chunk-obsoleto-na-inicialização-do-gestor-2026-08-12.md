# Corrigir o chunk obsoleto na inicialização do Gestor

## Diagnóstico confirmado

- A prévia hospedada de `/gestor/login` tenta carregar `gestor.login-9S4GC6_G.js` e fica em branco porque esse arquivo não está disponível.
- O hash `9S4GC6_G` não aparece no código-fonte, no manifesto nem nos bundles locais atuais; ele pertence a uma geração anterior da prévia.
- O artefato local existente referencia outro chunk, `gestor.login-BI1pg4Br.js`, confirmando que documento/cliente e assets servidos não pertencem à mesma geração.
- As versões diretas e transitivas de Router, Start e plugin estão desalinhadas no lockfile, o que aumenta o risco de árvore de rotas, transformações e manifestos serem produzidos por versões diferentes.
- A configuração atual de `vite.config.ts` já usa somente opções suportadas. O script de recuperação atual não corrige a origem do problema; ele apenas tenta contornar um documento obsoleto depois da falha.

## Plano de implementação

1. **Unificar a cadeia TanStack**
   - Ajustar as dependências diretas de Router, Start e plugin para uma combinação compatível e coerente.
   - Regenerar o lockfile para remover a mistura evitável de versões na cadeia de build.
   - Manter a configuração atual do Vite sem desativar a divisão automática de rotas.

2. **Reduzir a recuperação a um único mecanismo seguro**
   - Consolidar o tratamento de `vite:preloadError` e falhas de importação em uma única tentativa de atualização.
   - Garantir uma condição de parada que funcione mesmo quando o storage do iframe estiver bloqueado.
   - Exibir a ação manual de recarregar após a tentativa única, sem apagar caches indiscriminadamente nem entrar em loop.
   - Manter `no-store` somente nas respostas HTML; assets com hash permanecem imutáveis/cacheáveis.

3. **Produzir uma geração limpa e autoconsistente**
   - Remover apenas artefatos intermediários/saídas de build e gerar novamente cliente, servidor, árvore de rotas e manifestos.
   - Verificar que todo asset citado pelos manifestos existe na mesma saída de build.
   - Confirmar que os hashes antigos `9S4GC6_G` e `BI1pg4Br` não são referenciados pela nova geração.

4. **Validar a experiência real de inicialização**
   - Abrir `/gestor/login` em navegador limpo e dentro do contexto da prévia.
   - Confirmar resposta 200 para cada módulo solicitado, tela de login renderizada e console sem erro de importação dinâmica.
   - Recarregar a rota e executar login → `/gestor` para validar a navegação após a inicialização.
   - Rodar o E2E existente de Seleção → Programa para detectar regressões.

5. **Atualizar a prévia uma única vez**
   - Depois de o artefato local passar em todas as verificações, deixar a prévia receber a geração completa de uma só vez.
   - Se a URL hospedada ainda solicitar `9S4GC6_G`, classificar o restante como cache/implantação da prévia, pois o novo código e os novos manifestos já terão sido comprovados sem essa referência.

## Critérios de conclusão

- `/gestor/login` renderiza sem tela branca na prévia e em navegador limpo.
- Nenhum módulo solicitado retorna 404.
- Não ocorre `Failed to fetch dynamically imported module`.
- Um reload não inicia ciclo de recargas.
- Login, dashboard e o fluxo E2E principal continuam funcionando.

## Arquivos técnicos envolvidos

- `package.json` e `bun.lock`
- `src/routes/__root.tsx`
- `src/server.ts`
- `vite.config.ts` apenas para conferência final
- Saídas geradas de cliente, servidor e manifestos
- `e2e/selecao_para_programa.py`
