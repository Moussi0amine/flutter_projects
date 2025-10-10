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

  /// Simple math evaluator for + - × ÷
  void _calculateResult() {
    String expression = _input;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll('−', '-');

    try {
      // ⚠️ Simple calculation using Dart's expression evaluator
      final result = _evaluateExpression(expression);
      _output = result.toString();
    } catch (e) {
      _output = 'Error';
    }
  }

  /// Evaluate mathematical string (simple manual logic)
  double _evaluateExpression(String exp) {
    // For simplicity, split by operator and handle basic operations
    try {
      // This is NOT a full parser, just enough for simple operations
      final parsed = exp.split(RegExp(r'([\+\-\*/])'));
      double result = double.parse(parsed[0]);
      for (int i = 1; i < parsed.length; i += 2) {
        String op = parsed[i];
        double num = double.parse(parsed[i + 1]);
        if (op == '+') result += num;
        if (op == '-') result -= num;
        if (op == '*') result *= num;
        if (op == '/') result /= num;
      }
      return result;
    } catch (e) {
      return 0;
    }
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
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _output,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.white24, thickness: 1),

            // 🔘 Buttons Grid
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: _buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // 4 buttons per row
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    final btn = _buttons[index];
                    final isOperator = ['÷', '×', '−', '+', '='].contains(btn);
                    final isSpecial = ['C', '⌫', '%'].contains(btn);

                    return GestureDetector(
                      onTap: () => _onButtonTap(btn),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isOperator
                              ? Colors.deepPurpleAccent
                              : isSpecial
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            btn,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: isOperator
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
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
}
