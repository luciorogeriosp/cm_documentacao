# Componentes globais — Aplicativo Cliente

| Campo | Valor |
| ----- | ----- |
| **Tipo** | Componentes transversais |
| **Perfil** | Empreendedora |
| **UCs** | UC72 |
| **Prioridade** | MVP |

---

## Objetivo

Elementos reutilizados em todas as telas autenticadas e no fluxo de inscrição.

---

## Componentes

### Header autenticado

- Logo Consulado da Mulher
- Nome da edição/programa (truncado em mobile)
- Menu hambúrguer: Home, Calendário, Meu perfil, Meu histórico, Certificados, Sair — **sem** Mentoria

### Barra inferior autenticada

- Home · Mentoria · Calendário · Perfil
- **P/H:** Mentoria sempre, durante o programa
- **Online:** Mentoria **só** após lote de encerramento
- Hub: [29-mentorias-hub.md](29-mentorias-hub.md)

### Barra de progresso (inscrição)

- Etapas: Pré-cadastro → Dados pessoais → Dados financeiros → Dados do programa → Confirmação
- Indicador "Etapa X de N"

### Card de atividade

- Título, tipo (ícone), status: liberada | em andamento | concluída | aguardando aprovação | em revisão | bloqueada
- Badge de atenção (**Revisar** — UC44)
- Barra de progresso do módulo

### Alerta compatibilidade navegador (UC72)

- Banner não bloqueante no topo se navegador incompatível
- Texto: recomenda Chrome, Safari ou Firefox atualizados
- Link "Continuar mesmo assim"

### Toast / notificações

- Sucesso, erro, aviso (ex.: sessão expirada — solicitar novo link mágico)

### Estados vazios

- Ilustração + texto orientativo + CTA quando aplicável

---

## Regras

- Layout mobile-first; largura máxima ~480px no fluxo de inscrição
- Contraste WCAG AA mínimo
- Sem campo de senha em qualquer tela
