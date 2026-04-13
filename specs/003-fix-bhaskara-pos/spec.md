# Feature Specification: Fix Bhaskara Positive Numbers

**Feature Branch**: `003-fix-bhaskara-pos`  
**Created**: 2026-02-27  
**Status**: Draft  
**Input**: User description: "A funcionalidade da Bhaskara não me satisfez, ela executa as contas apenas quando os números de A,B,C são negativos, corrija esse erro. Faça com que ele permita contas com números positivos"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Calculate Roots for Equation with Positive Coefficients (Priority: P1)

Como usuário, desejo inserir números positivos na interface sem que ela retorne um erro ou o cálculo trave, para que eu possa calcular funções quadráticas que possuem coeficientes positivos em A, B ou C.

**Why this priority**: Corrigir erro impeditivo (bug) no uso da calculadora que impacta o fluxo principal.

**Independent Test**: Pode ser testado informando números totalmente positivos e com raízes reais (ex: a=1, b=5, c=6; resultando nas raízes -2 e -3) e verificando que a tela aceita e processa o número corretamente.

**Acceptance Scenarios**:

1. **Given** a calculadora na tela de Bhaskara, **When** o usuário preenche a=1, b=5, c=6 (números maiores que 0) e clica em calcular, **Then** o sistema deve exibir corretamente os resultados X1=-2.0000 e X2=-3.0000.
2. **Given** a calculadora na tela de Bhaskara, **When** o usuário preenche a=2, b=4, c=2 (números positivos garantindo um delta 0), **Then** o sistema exibe corretamente X1=-1.0000 em uma única raiz.

---

### Edge Cases

- O que acontece se o usuário digitar os números positivos com um '+' literal na frente? (Ex: "+5").
- O problema era de UI (teclado que travava os sinais) ou da lógica interna ignorando positivos?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: O sistema MUST processar corretamente a entrada de dígitos numéricos positivos nos campos da tela.
- **FR-002**: A lógica de cálculo do discriminante e das raízes MUST funcionar para qualquer polaridade de A, B ou C, desde que matematicamente viável.
- **FR-003**: A integração MUST permitir o parse adequado dos coeficientes com ou sem a identificação explícita de sinais.

### Key Entities

- N/A

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: O usuário consegue digitar valores positivos e obter os mesmos 100% de precisão de forma idêntica as equações negativas do sistema.
- **SC-002**: Resolvida a falha para toda a bateria de testes incluindo os inputs puramente positivos (como 1x² + 5x + 6).
