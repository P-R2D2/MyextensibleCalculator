enum BhaskaraStatus {
  twoRealRoots,
  oneRealRoot,
  noRealRoots,
  invalidInputAisZero,
}

class BhaskaraResult {
  final double? delta;
  final List<double> roots;
  final BhaskaraStatus status;

  const BhaskaraResult({
    this.delta,
    this.roots = const [],
    required this.status,
  });
}
