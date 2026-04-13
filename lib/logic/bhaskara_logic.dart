import 'dart:math';
import 'package:first_app_ueg_20261/models/bhaskara_result.dart';

class BhaskaraLogic {
  static BhaskaraResult calculate(double a, double b, double c) {
    if (a == 0) {
      return const BhaskaraResult(status: BhaskaraStatus.invalidInputAisZero);
    }
    double delta = (b * b) - (4 * a * c);

    if (delta < 0) {
      return BhaskaraResult(delta: delta, status: BhaskaraStatus.noRealRoots);
    } else if (delta == 0) {
      double root = -b / (2 * a);
      return BhaskaraResult(
        delta: delta,
        roots: [root],
        status: BhaskaraStatus.oneRealRoot,
      );
    } else {
      double root1 = (-b + sqrt(delta)) / (2 * a);
      double root2 = (-b - sqrt(delta)) / (2 * a);
      return BhaskaraResult(
        delta: delta,
        roots: [root1, root2],
        status: BhaskaraStatus.twoRealRoots,
      );
    }
  }
}
