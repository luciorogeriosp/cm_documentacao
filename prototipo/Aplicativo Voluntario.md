# Protótipo — Portal do voluntariado

**Fontes:** [Casos de Uso v8](../Casos%20de%20Uso%20-%20Consulado%20da%20Mulher_v8.md) UC70, UC73, UC89, UC90.

Portal da rede: cadastro **único** e **individual**, treino (**módulo CMS**), mentorias (abas **Em aberto · Minhas · Encerradas**), **ações**, aceite, card em dois estados, certificados tipo **Mentoria** e **Ação**. Auth: **link mágico por e-mail**. Voluntariado é o **cerne**. **Sem** doação de sangue.

Nomenclatura canônica do app: **portal do voluntariado**. O ator continua **Voluntário / Mentor**.

Card: [comum/card-mentoria.md](comum/card-mentoria.md).

## Menu autenticado

**Mentorias** (Início + Em aberto · Minhas · Encerradas) · **Ações** · Aulas coletivas · **Certificados** · Sair

Pool e ações bloqueados até o módulo CMS. Só coletiva: esconde Mentorias. Só Ações: esconde Mentorias, mostra Ações.

## Telas

| # | Arquivo | Tela |
| - | ------- | ---- |
| — | [validacao-novas-solicitacoes.md](aplicativo-voluntario/validacao-novas-solicitacoes.md) | Fatia de homologação: cadastro geral + slug, aguardo, bloqueio do módulo, ações |
| 01 | [01-cadastro.md](aplicativo-voluntario/01-cadastro.md) | Inscrição pública (geral + landing `/voluntario/a/[slug]`) |
| 02 | [02-login.md](aplicativo-voluntario/02-login.md) | Link mágico |
| 03 | [03-treino-materiais.md](aplicativo-voluntario/03-treino-materiais.md) | Início — módulo CMS |
| 04 | [04-demandas-abertas.md](aplicativo-voluntario/04-demandas-abertas.md) | Aba Em aberto |
| 05 | [05-aceitar-mentoria.md](aplicativo-voluntario/05-aceitar-mentoria.md) | Pegar / card |
| 06 | [06-minhas-mentorias.md](aplicativo-voluntario/06-minhas-mentorias.md) | Minhas + Encerradas |
| 07 | [07-aulas-coletivas.md](aplicativo-voluntario/07-aulas-coletivas.md) | Vínculos do Gestor |
| 08 | [08-campanhas.md](aplicativo-voluntario/08-campanhas.md) | Ações (UC90) |
| 09 | [09-certificados.md](aplicativo-voluntario/09-certificados.md) | Certificados tipo Mentoria e Ação |
