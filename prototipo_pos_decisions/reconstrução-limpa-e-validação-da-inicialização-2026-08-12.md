# Reconstrução limpa e validação da inicialização

## Diagnóstico confirmado

- A aplicação exibida tenta carregar um chunk antigo do login (`gestor.login-9S4GC6_G.js`).
- O artefato local atual ainda contém outro chunk de login (`gestor.login-BI1pg4Br.js`) e foi gerado antes da última alteração de `vite.config.ts`; portanto, a configuração mais recente nunca foi comprovada no bundle final.
- `vite.config.ts` define `router.autoCodeSplitting: false`, mas a versão instalada do TanStack Start remove explicitamente essa opção do schema. O bundle existente continua dividindo o login e demais rotas em chunks, contrariando a correção anterior.
- Foram acumuladas três camadas de recuperação (script global, error boundary e cabeçalhos de cache), mas elas não resolvem um documento antigo quando o próprio bundle inicial também está inconsistente.
- O servidor local inicia sem erro de compilação; a falha observada está na compatibilidade entre documento/manifesto e os assets entregues ao navegador.

## Plano de implementação

1. **Voltar a uma configuração de build suportada**
   - Remover a opção inválida de divisão de rotas.
   - Manter somente configurações reconhecidas pelo adaptador TanStack Start.
   - Alinhar as versões dos pacotes TanStack para evitar transformações feitas por versões diferentes do Router, Start e plugin.

2. **Simplificar a recuperação de assets**
   - Remover os remendos redundantes que hoje tentam recarregar a mesma página por três caminhos.
   - Manter uma única recuperação limitada para erro real de asset obsoleto, sem loop.
   - Preservar os cabeçalhos `no-store` apenas para documentos HTML; assets versionados continuam cacheáveis.

3. **Gerar um artefato realmente novo**
   - Invalidar os artefatos intermediários e deixar o pipeline gerar novamente árvore de rotas, manifesto, cliente e servidor a partir do código atual.
   - Confirmar que nenhum manifesto, HTML ou bundle novo contém os hashes antigos `9S4GC6_G` ou `BI1pg4Br`.
   - Verificar que cada asset referenciado pelo manifesto existe fisicamente e responde com sucesso.

4. **Validar a inicialização como usuário**
   - Abrir `/gestor/login` em um contexto de navegador limpo e confirmar renderização, ausência de tela branca e ausência de erros no console/rede.
   - Recarregar normalmente e com cache desabilitado.
   - Executar o login fictício e navegar até `/gestor` para confirmar que o problema não apenas mudou de rota.
   - Rodar o E2E existente de Seleção → Programa para detectar regressões no fluxo principal.

5. **Critério de conclusão**
   - Login e dashboard renderizam em navegador limpo.
   - Nenhum request de módulo retorna 404.
   - Nenhum erro `Failed to fetch dynamically imported module` aparece no console.
   - O fluxo E2E principal continua passando.
   - Se o ambiente hospedado continuar entregando o hash antigo depois disso, tratar como implantação/cache do ambiente e publicar o novo artefato uma única vez, em vez de alterar novamente o código.

## Arquivos técnicos envolvidos

- `vite.config.ts`
- `package.json` e lockfile
- `src/routes/__root.tsx`
- `src/server.ts`
- Artefatos gerados de cliente/servidor e manifesto de rotas
- `e2e/selecao_para_programa.py`
