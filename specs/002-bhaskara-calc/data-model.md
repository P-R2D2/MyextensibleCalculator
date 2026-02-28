# Phase 1: Data Model

## Entities

### `BhaskaraResult`

Represents the calculated outcome containing the discriminant (delta) and roots.

- **Properties**:
  - `delta` (`double?`): The calculated discriminant ($b^2 - 4ac$). Nullable if the calculation was invalid before reaching this step (e.g., $a = 0$).
  - `roots` (`List<double>`): A list of calculated roots. Will contain 2 elements for positive delta, 1 for zero delta, and 0 for negative delta or invalid calculation.
  - `status` (`enum BhaskaraStatus`): Represents the calculation status.

### `BhaskaraStatus` (Enum)

Encodes the qualitative outcome of the calculation explicitly for the UI to digest.

- **Values**:
  - `twoRealRoots`: Delta > 0.
  - `oneRealRoot`: Delta = 0.
  - `noRealRoots`: Delta < 0.
  - `invalidInputAisZero`: Occurs if $a = 0$.

## State Transitions
1. The user inputs $a$, $b$, and $c$ as Text/String in the UI fields.
2. The UI parses them safely to `double`. If parsing fails, the UI natively prompts "Invalid number".
3. The UI invokes `BhaskaraLogic.calculate(a, b, c)`.
4. The logic computes Delta = $b^2 - 4ac$ or guards if $a = 0$.
5. The logic constructs and returns a `BhaskaraResult` describing the calculation state.
6. The UI updates observing the `status` enum to branch exactly which visual message is rendered.
