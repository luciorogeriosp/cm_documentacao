# Briefing IA — alterações no Aplicativo Cliente (mentoria)

Use este arquivo para **alterar o Aplicativo Cliente já existente**. Não crie o portal do voluntariado nem a área de rede do Gestor aqui.

**Produto:** Consulado da Mulher. Empreendedora. Auth: **link mágico** (WhatsApp/e-mail). Sem senha.

**Não fazer:** Mentoria no **hambúrguer**. Não misturar com visita técnica, conteúdo extra, PIX/doação (UC86) nem desistência (UC79). **Sem** campo de data/hora no pedido. Gestor só no contrato (inclui empreendedora / aloca lote).

---

## O que muda

1. **Menu inferior:** Home · Mentoria · Calendário · Perfil.
   - **P/H:** item Mentoria sempre, durante o programa.
   - **Online:** item Mentoria **só** após entrar no lote de encerramento.
2. Área própria `/app/mentorias` (hub). **Tira** o botão Mentoria de Meu perfil.
3. **Início / treinamento:** módulo educacional no CMS (mesmos tipos de atividade de hoje: videoaula, questionário, download, tarefa, etc.). **Solicitar** bloqueado até concluir.
4. Inclusão pelo Gestor **não** exige treino: o caso aparece em Minhas (ou Em aberto se ainda sem lote).
5. Duas origens: ela solicita (formulário canônico, sem slot) → Em aberto; ou o Gestor inclui / aloca lote.
6. Três abas **iguais** ao portal do voluntariado: **Em aberto · Minhas · Encerradas**.
7. Encerramento (ela): **texto** sobre a mentoria + NPS da plataforma + NPS do mentor. `atendida_gestor`: sem NPS de mentor, sem certificado.
8. Certificado: ao `finalizada`, um por caso. Em Certificados: filtro **Programa | Mentoria**.

O **card visual** da mentorada **não** é tela da empreendedora.

---

## Menu e rotas

| Onde | Conteúdo |
| ---- | -------- |
| Barra inferior | Home · Mentoria · Calendário · Perfil |
| Hambúrguer | Home, Calendário, Meu perfil, Meu histórico, Certificados, Sair — **sem** Mentoria |
| `/app/mentorias` | Hub: Início (módulo CMS) + abas |
| `/app/mentorias/solicitar` | Formulário canônico |
| `/app/certificados` | Filtro Programa \| Mentoria |

---

## Hub `/app/mentorias`

```
Mentorias
[ Início — módulo CMS ]
[ Em aberto ] [ Minhas ] [ Encerradas ]
```

| Aba | Conteúdo |
| --- | -------- |
| Em aberto | Pedidos aguardando mentor; recusadas. CTA **Solicitar** (bloqueado se treino pendente) |
| Minhas | Alocada / em andamento; contato do líder **só aqui** |
| Encerradas | NPS pendente, finalizada, atendida pelo gestor |

**Início / treinamento:** progresso do módulo CMS nesta área. Enquanto incompleto: aviso e **Solicitar** bloqueado. Gestor que inclui/aloca: o caso já aparece em Minhas (ou Em aberto se ainda sem lote), sem exigir o módulo.

---

## Formulário (canônico)

**Área (CMS, um select):** Finanças, Marketing, Vendas, Gestão, Comunicação, Formalização, Saúde e bem-estar, Tecnologia.

1. Ajuda em que área?
2. Qual motivo te levou a empreender?
3. Olhando o momento atual, qual é a maior dificuldade ou dúvida?
4. O que gostaria de ter resolvido ou planejado?
5. Melhor período (multi): Manhã 8–12, Tarde 12–18, Noite 18–21, Finais de semana

```
Solicitar mentoria
Ajuda em que área? *     [ Finanças ▼]
Motivo de empreender *
Maior dificuldade agora? *
O que resolver? *
Melhor período *  ☐ Manhã  ☐ Tarde  ☐ Noite  ☐ FDS
[ Cancelar ]  [ Enviar ]
```

**P/H:** enviar → `aberta` (Em aberto do portal do voluntariado).  
**Online:** enviar → pool (`vagas` default 1).

---

## Status por aba

| Status | Aba | Quando |
| ------ | --- | ------ |
| enviada / aguardando mentor | Em aberto | `aberta` |
| recusada | Em aberto | Motivo visível |
| aceita / alocada | Minhas | Lote ou voluntário pegou — primeiro nome do líder |
| em andamento | Minhas | Consultas (P/H) ou sessão (online) |
| encerrada — NPS pendente | Encerradas | Texto + NPS plataforma + NPS mentor |
| finalizada | Encerradas | Certificado (filtro Mentoria) |
| atendida pelo gestor | Encerradas | Educadora acompanhou; **sem** NPS de mentor, **sem** certificado |
| timeout | Encerradas | Só online |

Não exibir dados bancários.

---

## Encerramento (ela)

Quando o líder encerra (P/H) ou a sessão encerra (online):

- Texto livre sobre a mentoria *
- NPS da plataforma *
- NPS do mentor *

`atendida_gestor`: **sem** NPS de mentor e **sem** certificado.

---

## Contratos (não implementar os outros apps)

- Gestor P/H: Alocar lote | Atendido pelo gestor | Recusar | `wa.me`.
- Gestor online: lote dispara o item Mentoria no menu.
- Portal do voluntariado: mesmas 3 abas (Em aberto · Minhas · Encerradas); só o líder agenda.
