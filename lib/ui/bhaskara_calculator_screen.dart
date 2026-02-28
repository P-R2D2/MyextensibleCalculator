import 'package:flutter/material.dart';
import 'package:first_app_ueg_20261/logic/bhaskara_logic.dart';
import 'package:first_app_ueg_20261/models/bhaskara_result.dart';

class BhaskaraCalculatorScreen extends StatefulWidget {
  const BhaskaraCalculatorScreen({super.key});

  @override
  State<BhaskaraCalculatorScreen> createState() =>
      _BhaskaraCalculatorScreenState();
}

class _BhaskaraCalculatorScreenState extends State<BhaskaraCalculatorScreen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();

  BhaskaraResult? _result;
  String? _errorMessage;

  void _calculate() {
    setState(() {
      _result = null;
      _errorMessage = null;
    });

    final aStr = _aController.text;
    final bStr = _bController.text;
    final cStr = _cController.text;

    if (aStr.isEmpty || bStr.isEmpty || cStr.isEmpty) {
      setState(() => _errorMessage = 'Please enter all coefficients.');
      return;
    }

    final double? a = double.tryParse(aStr);
    final double? b = double.tryParse(bStr);
    final double? c = double.tryParse(cStr);

    if (a == null || b == null || c == null) {
      setState(() => _errorMessage = 'Invalid numbers.');
      return;
    }

    final result = BhaskaraLogic.calculate(a, b, c);
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bhaskara Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              key: const Key('bhaskara_input_a'),
              controller: _aController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(labelText: 'Coefficient a'),
            ),
            TextField(
              key: const Key('bhaskara_input_b'),
              controller: _bController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(labelText: 'Coefficient b'),
            ),
            TextField(
              key: const Key('bhaskara_input_c'),
              controller: _cController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(labelText: 'Coefficient c'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              key: const Key('bhaskara_calculate_button'),
              onPressed: _calculate,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 16),
            if (_errorMessage != null)
              Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
            if (_result != null) _buildResult(_result!),
          ],
        ),
      ),
    );
  }

  Widget _buildResult(BhaskaraResult result) {
    switch (result.status) {
      case BhaskaraStatus.invalidInputAisZero:
        return const Text(
          'Coefficient \'a\' cannot be zero',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        );
      case BhaskaraStatus.noRealRoots:
        return const Text(
          'Não existem raízes reais',
          style: TextStyle(fontWeight: FontWeight.bold),
        );
      case BhaskaraStatus.oneRealRoot:
        return Text(
          'Delta: ${result.delta}\nX1: ${result.roots[0].toStringAsFixed(4)}',
          style: const TextStyle(fontSize: 18),
        );
      case BhaskaraStatus.twoRealRoots:
        return Text(
          'Delta: ${result.delta}\nX1: ${result.roots[0].toStringAsFixed(4)}\nX2: ${result.roots[1].toStringAsFixed(4)}',
          style: const TextStyle(fontSize: 18),
        );
    }
  }
}
