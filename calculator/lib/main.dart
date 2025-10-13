import 'package:flutter/material.dart';

void main() => runApp(const ModernCalculatorApp());

/// 💡 Root app widget
class ModernCalculatorApp extends StatelessWidget {
  const ModernCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Modern dark theme
        primarySwatch: Colors.deepPurple,
      ),
      home: const CalculatorScreen(),
    );
  }
}

/// 🧮 Main calculator screen
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';   // What the user types (e.g. "12+3")
  String _output = '0'; // The calculated result

  /// All calculator buttons (rows x columns)
  final List<String> _buttons = [
    'C', '⌫', '%', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '−',
    '1', '2', '3', '+',
    '0', '.', '=', 
  ];

  /// Handle button tap logic
  void _onButtonTap(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _output = '0';
      } else if (value == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        _calculateResult();
      } else {
        _input += value;
      }
    });
  }

  /// Improved math evaluator for + - × ÷ with operator precedence
  void _calculateResult() {
    String expression = _input;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('−', '-');
    expression = expression.replaceAll('%', '/100');

    try {
      final result = _evaluateExpression(expression);
      _output = result.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  /// Shunting-yard algorithm for operator precedence (no parentheses)
  double _evaluateExpression(String exp) {
    final ops = <String>[];
    final vals = <double>[];
    int i = 0;
    while (i < exp.length) {
      if (exp[i] == ' ') {
        i++;
        continue;
      }
      if (_isDigit(exp[i]) || exp[i] == '.') {
        int start = i;
        while (i < exp.length && (_isDigit(exp[i]) || exp[i] == '.')) i++;
        vals.add(double.parse(exp.substring(start, i)));
        continue;
      }
      if (_isOperator(exp[i])) {
        while (ops.isNotEmpty && _precedence(ops.last) >= _precedence(exp[i])) {
          _applyOperator(ops, vals);
        }
        ops.add(exp[i]);
        i++;
        continue;
      }
      throw Exception('Invalid character: ${exp[i]}');
    }
    while (ops.isNotEmpty) {
      _applyOperator(ops, vals);
    }
    return vals.isNotEmpty ? vals.first : 0;
  }

  bool _isDigit(String ch) => ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57;
  bool _isOperator(String ch) => ch == '+' || ch == '-' || ch == '*' || ch == '/';

  int _precedence(String op) {
    if (op == '+' || op == '-') return 1;
    if (op == '*' || op == '/') return 2;
    return 0;
  }

  void _applyOperator(List<String> ops, List<double> vals) {
    if (vals.length < 2 || ops.isEmpty) throw Exception('Invalid expression');
    double b = vals.removeLast();
    double a = vals.removeLast();
    String op = ops.removeLast();
    if (op == '+') vals.add(a + b);
    if (op == '-') vals.add(a - b);
    if (op == '*') vals.add(a * b);
    if (op == '/') vals.add(a / b);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Modern dark background
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 🧾 Display Area (Input + Result)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _input,
                    style: const TextStyle(fontSize: 32, color: Colors.white70),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _output,
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                ],
              ),
            ),
            // 🔢 Calculator Buttons
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: GridView.builder(
                  itemCount: _buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final btn = _buttons[index];
                    return ElevatedButton(
                      onPressed: () => _onButtonTap(btn),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _getBtnColor(btn),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        btn,
                        style: TextStyle(
                          fontSize: btn == '=' ? 32 : 26,
                          fontWeight: btn == '=' ? FontWeight.bold : FontWeight.normal,
                          color: btn == 'C' ? Colors.redAccent : Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBtnColor(String btn) {
    if (btn == 'C') return Colors.red.shade800;
    if (btn == '=' || btn == '+' || btn == '−' || btn == '×' || btn == '÷' || btn == '%') {
      return Colors.deepPurple;
    }
    return Colors.grey.shade900;
  }
}
