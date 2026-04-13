# Feature Specification: Bhaskara Calculation

**Feature Branch**: `002-bhaskara-calc`  
**Created**: 2026-02-27  
**Status**: Draft  
**Input**: User description: "Quero adicionar à minha calculadora a funcionalidade de cálculo de Bhaskara."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Calculate Roots for Equation with Real Roots (Priority: P1)

As a user, I want to input coefficients a, b, and c to calculate the real roots of a quadratic equation so that I can quickly solve standard math problems.

**Why this priority**: Core functionality of the feature. Most user searches for this tool will involve standard equations with real roots.

**Independent Test**: Can be fully tested by providing coefficients for an equation with known real roots (e.g., a=1, b=-3, c=2) and verifying the output matches (x1=2, x2=1).

**Acceptance Scenarios**:

1. **Given** the calculator is in Bhaskara mode, **When** the user inputs a=1, b=-3, c=2 and presses calculate, **Then** the system should display the roots x1=2 and x2=1.
2. **Given** the calculator is in Bhaskara mode, **When** the user inputs a=1, b=-2, c=1 and presses calculate, **Then** the system should display a single root x1=1.

---

### User Story 2 - Handle Invalid Inputs and Edge Cases (Priority: P2)

As a user, I want to be informed when my inputs are invalid (e.g., a=0) or when there are no real roots, so that I don't get confusing errors or incorrect results.

**Why this priority**: Essential for a robust calculator tool and good user experience when mathematical constraints are hit.

**Independent Test**: Can be tested independently by providing edge-case coefficients (like a=0) and verifying that a helpful error message appears instead of a crash.

**Acceptance Scenarios**:

1. **Given** the calculator is in Bhaskara mode, **When** the user inputs a=0, **Then** the system should display an error message stating "Coefficient 'a' cannot be zero".
2. **Given** the calculator is in Bhaskara mode, **When** the user inputs an equation with a negative delta (e.g., a=1, b=1, c=1) and presses calculate, **Then** the system should display a simple text message stating "Não existem raízes reais" (No real roots).

### Edge Cases

- What happens when a=0? (Equation is linear, not quadratic. Should show an error or switch to linear solver).
- How does the system handle extremely large numbers that might cause overflow during calculation?
- How does the system handle decimal or fractional coefficient inputs?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST provide an interface for entering the coefficients `a`, `b`, and `c` of a quadratic equation.
- **FR-002**: System MUST validate that the coefficient `a` is not equal to 0 before attempting calculation.
- **FR-003**: System MUST calculate the discriminant (Delta = b^2 - 4ac).
- **FR-004**: System MUST calculate the roots using Bhaskara's formula: `x = (-b ± √Delta) / 2a`.
- **FR-005**: System MUST display the results clearly, indicating either two distinct real roots, one real root, or handle the negative Delta case.
- **FR-006**: System MUST parse and accurately calculate inputs that include floating-point numbers (decimals).

### Key Entities

- **QuadraticEquation**: Represents the mathematical input with coefficients a, b, and c.
- **BhaskaraResult**: Represents the calculated outcome, containing the discriminant (Delta), root(s) if applicable, and evaluation status (e.g., two real roots, one root, no real roots).

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Users can enter coefficients and get the roots displayed in under 2 seconds.
- **SC-002**: The calculation algorithm produces mathematically correct results accurate to at least 4 decimal places for 100% of tested valid equations.
- **SC-003**: The application handles invalid initial configurations (like a=0) 100% of the time, displaying a user-friendly error without system crashes.
