# Quickstart

To run and test the Bhaskara Calculation feature interactively:

1. **Launch the application:**
   ```bash
   flutter run
   ```
   *Navigate to the local module inside the calculator for Bhaskara computation (e.g., side menu or dedicated tab).*

2. **Execute Logic Unit Tests:**
   ```bash
   flutter test test/logic/bhaskara_logic_test.dart
   ```
   *Validates pure mathematical algorithms independently (e.g. valid roots, Delta < 0 conditions, A=0 boundary limits).*

3. **Execute UI Widget Tests:**
   ```bash
   flutter test test/ui/bhaskara_calculator_screen_test.dart
   ```
   *Validates component rendering, text input validations, and error messaging components.*
