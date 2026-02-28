# Implementation Plan: Fix Bhaskara Positive Numbers

**Branch**: `003-fix-bhaskara-pos` | **Date**: 2026-02-27 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/003-fix-bhaskara-pos/spec.md`

## Summary

Corrigir a calculadora de Bhaskara para que processe e calcule adequadamente os valores positivos para os coeficientes A, B e C, resolvendo o bug reportado.

## Technical Context

**Language/Version**: Dart (Flutter)
**Primary Dependencies**: flutter framework, flutter_test
**Testing**: flutter_test (Widget and Unit tests)
**Target Platform**: Android, iOS, Web, Desktop (Flutter supported platforms)
**Project Type**: Mobile / Web / Desktop App

## Constitution Check

*GATE: Passed*
- **I. Widget-Driven Architecture**: O bugfix ocorrerá nos widgets já existentes.
- **II. Test-First Reliability**: Adicionaremos casos de testes (TDD) para coeficientes positivos provando a falha antes da correção.
- **III. State & Logic Separation**: A separação atual na abstração de lógicas atende aos requisitos constitucionais.

## Project Structure

### Documentation (this feature)

```text
specs/003-fix-bhaskara-pos/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
└── contracts/           # Phase 1 output
```

### Source Code

```text
lib/
├── logic/
│   └── bhaskara_logic.dart
test/
├── logic/
│   └── bhaskara_logic_test.dart
└── ui/
    └── bhaskara_calculator_screen_test.dart
```

**Structure Decision**: Apenas faremos modificações nos testes e possivelmente num fix de lógica e de controle de estado. Nenhuma nova estrutura além do feature fix.
