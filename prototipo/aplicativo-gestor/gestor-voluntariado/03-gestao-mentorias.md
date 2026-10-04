# Gestão de mentorias

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/gestor/voluntariado/mentorias` |
| **Perfil** | Gestor de Voluntariado |
| **UCs** | UC70 |
| **Prioridade** | Especificado |

Visão **nacional** de status. **Não** substitui a alocação da Unidade/Turma na edição ([08-registrar-mentoria.md](../gestor-unidade/08-registrar-mentoria.md)). GV **consulta**; alocar lote e “Atendido pelo gestor” continuam na Unidade/Turma.

---

## Abas

- **Abertas** — sem lote (presencial ou híbrido) ou com vaga (curso pela internet)
- **Em andamento** — lote alocado / consultas
- **Finalizadas** — encerrada, com pesquisas, ou atendida pelo gestor

**Destaque:** filtro **Abertas há muito tempo sem fechar** — aberta além do prazo para um voluntário aceitar (padrão 72 horas, configurável no CMS) **ou** em andamento sem consulta nem encerramento além do limiar do CMS (padrão 90 dias).

```
┌──────────────────────────────────────────────────┐
│ Gestão de mentorias                              │
│ ☑ Abertas há muito tempo sem fechar              │
│ [ Abertas ] [ Em andamento ] [ Finalizadas ]     │
├──────────────────────────────────────────────────┤
│ Maria Silva · Finanças · presencial · 14 dias aberta │
│ Origem: pedido · Unidade Centro · Edição 2027    │
│ Sem líder                                        │
│ [ Ver card ]                                     │
└──────────────────────────────────────────────────┘
```

Card: empreendedora, origem (pedido / inclusão), unidade/edição, líder se houver, dias aberta. Gestor vê contato sempre. Sem CPF/PIX/endereço.
