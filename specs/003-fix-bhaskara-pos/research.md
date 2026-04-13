# Phase 0: Outline & Research

## Knowns and Technical Context Resolution

1. **Root Cause Analysis & Positives Bug**: 
   - A requisição pede para corrigir um erro ao entrar valores numéricos positivos para A, B e C.
   - Analisando nossa implementação em `BhaskaraLogic.calculate(a, b, c)`, o método matemático de fato já os manipula adequadamente em Dart: `(b * b) - (4 * a * c)` e `-b / (2 * a)`.
   - **No entanto**, se o delta for perfeitamente viável (como A=1, B=5, C=6; delta=1), a lógica continua robusta.
   - O problema pode estar presente no parsing da tela, ou o usuário assumiu um erro de validação. Na verdade, nossa interface de `BhaskaraCalculatorScreen` usa `double.tryParse`, que lida com positivos ("+5" ou "5"). A falha provável é apenas falta dessa checagem na rotina de testes explícita, que precisa confirmar esse comportamento num deploy, ou uma má compilação anterior (ou formatação do texto exibido). O Delta zero foi corrigido de ter um output para dois também, se assim fosse o caso!
   - **Decision**: Vamos adicionar testes focados especificamente nos testes de cenários puramente positivos no `bhaskara_logic_test.dart` e checar o comportamento da UI no `bhaskara_calculator_screen_test.dart` para confirmar que não é um problema da Widget Layer. A correção focará na lógica se o parse estiver falhando com "invalid input".

### Summary
Não há dependências adicionais, o bugfix envolve a estrita confirmação via Testes (Unit e UI) antes da refatoração.
