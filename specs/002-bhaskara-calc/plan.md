# Implementation Plan: Bhaskara Calculation

**Branch**: `002-bhaskara-calc` | **Date**: 2026-02-27 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/002-bhaskara-calc/spec.md`

## Summary

Add the functionality to calculate Bhaskara (quadratic equation roots) to the extensible calculator app, separating pure algebraic logic from the UI and adhering to test-first and widget-driven architecture.

## Technical Context

**Language/Version**: Dart (Flutter)
**Primary Dependencies**: flutter framework, flutter_test for testing
**Storage**: N/A
**Testing**: flutter_test (Widget and Unit tests)
**Target Platform**: Android, iOS, Web, Desktop (Flutter supported platforms)
**Project Type**: Mobile / Web / Desktop App
**Performance Goals**: Instant calculation (< 200ms)
**Constraints**: Handle mathematical edge cases (a=0, negative delta). Safe parsing of floating-point numbers.
**Scale/Scope**: Small UI addition (new feature/screen) and a pure logic calculation class.

## Constitution Check

*GATE: Passed*
- **I. Widget-Driven Architecture**: The UI will be built as a set of stateless/stateful widgets for input fields and result display.
- **II. Test-First Reliability**: We will add unit tests for the Bhaskara logic and widget tests for the form before finalizing.
- **III. State & Logic Separation**: The mathematical logic for Bhaskara will be purely in a Dart class separate from the UI.
- **IV. Lint & Style Compliance**: Will adhere to `flutter_lints` and use consistent naming guidelines.
- **V. Asset & Localization Discipline**: Will avoid hardcoded strings by ensuring messages are centrally managed or appropriately abstracted to follow the layout patterns.

## Project Structure

### Documentation (this feature)

```text
specs/002-bhaskara-calc/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
├── quickstart.md        # Phase 1 output
├── contracts/           # Phase 1 output
└── tasks.md             # Phase 2 output (future)
```

### Source Code

```text
lib/
├── models/
│   └── bhaskara_result.dart       # Data model for the results
├── logic/
│   └── bhaskara_logic.dart        # Pure mathematical logic
├── ui/
│   └── bhaskara_calculator_screen.dart # Widget for the Bhaskara UI
test/
├── logic/
│   └── bhaskara_logic_test.dart
└── ui/
    └── bhaskara_calculator_screen_test.dart
```

**Structure Decision**: The feature is entirely client-side. We split the code into `models` (for the result structure), `logic` (for the math), and `ui` (for the presentation), ensuring compliance with the constitution's state & logic separation rule.

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| None | N/A | Feature strictly adheres to existing constitution without complications. |
