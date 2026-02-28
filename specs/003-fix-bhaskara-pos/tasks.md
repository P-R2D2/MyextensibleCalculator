---
description: "Task list template for feature implementation"
---

# Tasks: Fix Bhaskara Positive Numbers

**Input**: Design documents from `/specs/003-fix-bhaskara-pos/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md

**Tests**: A correção pede confirmações explícitas baseadas em TDD para valores positivos. Test-First estrito da Constituição.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

---

## Phase 1: User Story 1 - Calculate Roots for Equation with Positive Coefficients (Priority: P1) 🎯 MVP

**Goal**: Permitir inputs com coeficientes positivos e provar que a lógica não quebra/falha silenciosamente.

**Independent Test**: Testar a lógica pura e os widgets passando A=1, B=5, C=6 ou a=2, b=4, c=2 e os valores retornarem apropriados (-2, -3 / -1). 

### Tests for User Story 1 (REQUIRED) ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [x] T001 [US1] Adicionar teste na camada de lógica passando a=1, b=5, c=6 garantindo duas raízes negativas em `test/logic/bhaskara_logic_test.dart`
- [x] T002 [US1] Adicionar teste na camada Widget confirmando fluxo e parseamento do positivo em `test/ui/bhaskara_calculator_screen_test.dart`

### Implementation for User Story 1

- [x] T003 [US1] Ajustar tipagem do parse textou de KeyboardType (caso erro esteja bloqueando inputs com botão + ou teclado restritivo) em `lib/ui/bhaskara_calculator_screen.dart`
- [x] T004 [US1] Executar conjunto completo de testes e validar se os cálculos de double no `BhaskaraLogic` sustentam positivos. (A priori a matemática está ok de acordo com o research, foco em garantir rodagem limpa)

**Checkpoint**: At this point, User Story 1 should be fully functional and testable independently

---

## Final Phase: Polish & Cross-Cutting Concerns

- [x] T005 [P] Run `flutter analyze` e formatar as flags.
- [x] T006 [P] Run `flutter test` garantindo regressão de todas as camadas.
