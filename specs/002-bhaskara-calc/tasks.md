---
description: "Task list for feature implementation"
---

# Tasks: Bhaskara Calculation

**Input**: Design documents from `/specs/002-bhaskara-calc/`
**Prerequisites**: plan.md, spec.md, research.md, data-model.md, contracts/api.md

**Tests**: Test-First Reliability is REQUIRED by the Constitution (Rule II). Tests are integrated into the tasks.

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and basic structure

- [x] T001 [P] Create folder structure (lib/models, lib/logic, lib/ui, test/logic, test/ui)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before ANY user story can be implemented

- [x] T002 Create `BhaskaraStatus` enum and `BhaskaraResult` model in `lib/models/bhaskara_result.dart`

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Calculate Roots for Equation with Real Roots (Priority: P1) 🎯 MVP

**Goal**: Input coefficients a, b, and c to calculate the real roots of a quadratic equation.

**Independent Test**: Can be fully tested by providing coefficients for an equation with known real roots (e.g., a=1, b=-3, c=2) and verifying the output matches (x1=2, x2=1).

### Tests for User Story 1 ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation (Constitution Rule II)**

- [x] T003 [P] [US1] Write unit tests for basic Bhaskara real roots calculations in `test/logic/bhaskara_logic_test.dart`
- [x] T004 [P] [US1] Write widget tests for inputting values and rendering roots in `test/ui/bhaskara_calculator_screen_test.dart`

### Implementation for User Story 1

- [x] T005 [P] [US1] Implement `BhaskaraLogic.calculate` method for positive delta in `lib/logic/bhaskara_logic.dart`
- [x] T006 [US1] Create `BhaskaraCalculatorScreen` widget with input fields and result display in `lib/ui/bhaskara_calculator_screen.dart` (depends on T005)
- [x] T007 [US1] Register `BhaskaraCalculatorScreen` in the app's navigation or main menu in `lib/main.dart`

**Checkpoint**: At this point, User Story 1 (Real Roots) is fully functional and testable independently.

---

## Phase 4: User Story 2 - Handle Invalid Inputs and Edge Cases (Priority: P2)

**Goal**: Handle invalid inputs (e.g., a=0) or when there are no real roots, informing the user gracefully without crashes.

**Independent Test**: Can be tested independently by providing edge-case coefficients (like a=0, or negative delta) and verifying that a helpful error message appears.

### Tests for User Story 2 ⚠️

> **NOTE: Write these tests FIRST, ensure they FAIL before implementation**

- [x] T008 [P] [US2] Write unit tests for `a=0` and negative delta cases in `test/logic/bhaskara_logic_test.dart`
- [x] T009 [P] [US2] Write widget tests for error messages and negative delta states in `test/ui/bhaskara_calculator_screen_test.dart`

### Implementation for User Story 2

- [x] T010 [P] [US2] Update `BhaskaraLogic.calculate` to cleanly return `invalidInputAisZero` or `noRealRoots` in `lib/logic/bhaskara_logic.dart`
- [x] T011 [US2] Update `BhaskaraCalculatorScreen` to react to `BhaskaraStatus` and render appropriate error/info messages in `lib/ui/bhaskara_calculator_screen.dart`

**Checkpoint**: All user stories (Positive Delta, Negative Delta, and A=0 validation) are now functional.

---

## Phase N: Polish & Cross-Cutting Concerns

**Purpose**: Improvements that affect multiple user stories

- [x] T012 [P] Verify code passes linting by executing `flutter analyze`
- [x] T013 Verify all tests pass locally by executing `flutter test`

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies - can start immediately
- **Foundational (Phase 2)**: Depends on Setup completion
- **User Stories (Phase 3+)**: Depend on Foundational phase completion
- **Polish (Final Phase)**: Depends on all user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational
- **User Story 2 (P2)**: Extends User Story 1 (relies on the same logic and UI files)

### Parallel Opportunities

- Tests (T003 and T004) can be written in parallel.
- `BhaskaraLogic` implementation (T005) can be developed independently of the `BhaskaraCalculatorScreen` UI initial draft (T006).
- Edge case logic tests and UI tests (T008, T009) can be authored simultaneously.

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1 and 2 (Setup and Foundation).
2. Write and watch logic+UI tests fail for positive deltas.
3. Complete Phase 3 (US1).
4. Verify standard Bhaskara calculation.

### Incremental Delivery & Robustness

1. Validate MVP calculates 100% correctly for real roots.
2. Advance to Phase 4 (US2) to handle division by zero and imaginary roots.
3. Validate robust mathematical constraints without exceptions.
4. Finalize with standard Flutter lints.
