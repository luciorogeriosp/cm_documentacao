# Landing da edição (slug)

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/e/[slug]` |
| **Perfil** | Lead / Empreendedora (público) |
| **UCs** | UC19, UC67 |
| **Prioridade** | MVP |

---

## Objetivo

Ponto de entrada. Consulta **UUID** no localStorage (UC67): se inscrição concluída → home da edição; se incompleta → retoma UC21; senão → UC19.

## Ações

| Ação | Comportamento |
| ---- | ------------- |
| Iniciar inscrição | Sem UUID → UC19 |
| UUID + inscrição OK | Redirect home ou destino da URL (deep link) |
| Continuar inscrição | UUID/progresso → UC21 etapa pendente |
