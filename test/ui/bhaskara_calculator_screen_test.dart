import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_app_ueg_20261/ui/bhaskara_calculator_screen.dart';

void main() {
  testWidgets(
    'BhaskaraCalculatorScreen allows inputting values and displays roots',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: BhaskaraCalculatorScreen())),
      );

      // Wait for widget to settle
      await tester.pumpAndSettle();

      // Verify input fields for a, b, c exist
      final aInput = find.byKey(const Key('bhaskara_input_a'));
      final bInput = find.byKey(const Key('bhaskara_input_b'));
      final cInput = find.byKey(const Key('bhaskara_input_c'));
      final calculateButton = find.byKey(
        const Key('bhaskara_calculate_button'),
      );

      expect(aInput, findsOneWidget);
      expect(bInput, findsOneWidget);
      expect(cInput, findsOneWidget);
      expect(calculateButton, findsOneWidget);

      // Input values for x^2 - 3x + 2 = 0
      await tester.enterText(aInput, '1');
      await tester.enterText(bInput, '-3');
      await tester.enterText(cInput, '2');

      // Tap calculate
      await tester.tap(calculateButton);
      await tester.pump();

      // Verify result is displayed (roots are 2 and 1)
      expect(find.textContaining('X1: 2'), findsOneWidget);
      expect(find.textContaining('X2: 1'), findsOneWidget);
    },
  );

  testWidgets('BhaskaraCalculatorScreen allows positive inputs', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: BhaskaraCalculatorScreen())),
    );

    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('bhaskara_input_a')), '1');
    await tester.enterText(find.byKey(const Key('bhaskara_input_b')), '5');
    await tester.enterText(find.byKey(const Key('bhaskara_input_c')), '6');

    await tester.tap(find.byKey(const Key('bhaskara_calculate_button')));
    await tester.pump();

    // Verify result is displayed (roots are -2 and -3)
    expect(find.textContaining('X1: -2'), findsOneWidget);
    expect(find.textContaining('X2: -3'), findsOneWidget);
  });

  testWidgets('BhaskaraCalculatorScreen shows a=0 error', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: BhaskaraCalculatorScreen())),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('bhaskara_input_a')), '0');
    await tester.enterText(find.byKey(const Key('bhaskara_input_b')), '5');
    await tester.enterText(find.byKey(const Key('bhaskara_input_c')), '2');

    await tester.tap(find.byKey(const Key('bhaskara_calculate_button')));
    await tester.pump();

    expect(find.text('Coefficient \'a\' cannot be zero'), findsOneWidget);
  });

  testWidgets('BhaskaraCalculatorScreen shows no real roots message', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: BhaskaraCalculatorScreen())),
    );
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('bhaskara_input_a')), '1');
    await tester.enterText(find.byKey(const Key('bhaskara_input_b')), '1');
    await tester.enterText(find.byKey(const Key('bhaskara_input_c')), '1');

    await tester.tap(find.byKey(const Key('bhaskara_calculate_button')));
    await tester.pump();

    expect(find.text('Não existem raízes reais'), findsOneWidget);
  });
}
