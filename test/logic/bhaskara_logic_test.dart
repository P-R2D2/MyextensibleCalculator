import 'package:flutter_test/flutter_test.dart';
import 'package:first_app_ueg_20261/logic/bhaskara_logic.dart';
import 'package:first_app_ueg_20261/models/bhaskara_result.dart';

void main() {
  group('BhaskaraLogic Real Roots', () {
    test('calculate returns two distinct real roots for positive delta', () {
      final result = BhaskaraLogic.calculate(1, -3, 2);

      expect(result.status, BhaskaraStatus.twoRealRoots);
      expect(result.delta, 1);
      // Roots should be 2 and 1
      expect(result.roots.length, 2);
      expect(result.roots.contains(2), isTrue);
      expect(result.roots.contains(1), isTrue);
    });

    test('calculate returns one real root for zero delta', () {
      final result = BhaskaraLogic.calculate(1, -2, 1);

      expect(result.status, BhaskaraStatus.oneRealRoot);
      expect(result.delta, 0);
      expect(result.roots.length, 1);
      expect(result.roots[0], 1);
    });

    test('calculate returns invalidInputAisZero when a=0', () {
      final result = BhaskaraLogic.calculate(0, 5, 2);

      expect(result.status, BhaskaraStatus.invalidInputAisZero);
      expect(result.delta, isNull);
      expect(result.roots.length, 0);
    });

    test('calculate returns noRealRoots for negative delta', () {
      final result = BhaskaraLogic.calculate(1, 1, 1);

      expect(result.status, BhaskaraStatus.noRealRoots);
      expect(result.delta, lessThan(0));
      expect(result.roots.length, 0);
    });
  });
}
