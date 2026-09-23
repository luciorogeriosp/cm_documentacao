# Certificados — portal do voluntariado

| Campo | Valor |
| ----- | ----- |
| **Rota** | `/voluntario/certificados` |
| **Perfil** | Voluntário |
| **UCs** | UC63, UC70, UC90 |
| **Prioridade** | Especificado |

Tipos no portal: **Mentoria** e **Ação**. Mentoria: um por pessoa × mentoria (P/H) ou × sessão (online); acompanhante **herda**; libera ao `finalizada`. Ação: genérico de participação para **todas** as pessoas `confirmado` quando a ação **conclui**, independentemente de quem registrou as horas. Sem certificado de **coletiva**. `atendida_gestor` não gera certificado (nem aparece nas abas).

```
┌──────────────────────────────────────────────────┐
│  [←]  Certificados                               │
│  Tipo: [ Mentoria | Ação ]                       │
├──────────────────────────────────────────────────┤
│  Mentoria · Finanças · Crochê da Edilene         │
│  Emitido: 22/09/2027                             │
│  [ Baixar PDF ]                                  │
├──────────────────────────────────────────────────┤
│  Ação · Mutirão de plantio · 4h                  │
│  Emitido: 21/09/2027                             │
│  [ Baixar PDF ]                                  │
└──────────────────────────────────────────────────┘
```

PDF gerado pelo backend (UC55). Item de menu autenticado **Certificados**.
