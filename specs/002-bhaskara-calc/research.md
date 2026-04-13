# Phase 0: Outline & Research

## Knowns and Technical Context Resolution

Since the project is a Flutter application for a calculator and operates wholly locally via algorithmic code, the underlying math and architectural path are straightforward without any new technology dependencies.

1. **Mathematical Edge Cases**:
   - **Decision**: Handle `a = 0` by returning a discrete result state indicating invalidity. Handle Delta < 0 by returning an empty list of real roots alongside an expected state (e.g. `noRealRoots`).
   - **Rationale**: Keeps the math pure inside the `BhaskaraLogic` class and allows the UI to dictate how to map these states to human-readable error messages ("Coefficient 'a' cannot be zero", "Não existem raízes reais").

2. **State & Logic Separation**:
   - **Decision**: Create a `BhaskaraLogic` class exposing a simple `calculate(double a, double b, double c)` function returning a typed `BhaskaraResult` object.
   - **Rationale**: Complies with Constitution Rule III (State & Logic Separation). Makes unit testing the algebraic math trivial without needing to spin up or mock a single widget tree.

### Summary
All potential clarifications from the Spec phase have been documented and resolved into distinct logical paths suitable for deterministic Dart classes. No external dependencies, libraries, or network APIs are warranted for this feature.
