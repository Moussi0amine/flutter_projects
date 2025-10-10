import 'dart:async'; // For Timer
import 'dart:math';  // For random positions
import 'package:flutter/material.dart';

void main() => runApp(const TapTheCircleApp());

/// 🎮 Root widget
class TapTheCircleApp extends StatelessWidget {
  const TapTheCircleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap The Circle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const TapGameScreen(),
    );
  }
}

/// 🕹️ Main Game Screen
class TapGameScreen extends StatefulWidget {
  const TapGameScreen({super.key});

  @override
  State<TapGameScreen> createState() => _TapGameScreenState();
}

class _TapGameScreenState extends State<TapGameScreen> {
  // 🎯 Circle position (randomly updated)
  double _x = 100;
  double _y = 300;

  // 🧮 Player score
  int _score = 0;

  // ⏱️ Game time remaining (seconds)
  int _timeLeft = 10;

  // Timer references
  Timer? _circleTimer;
  Timer? _gameTimer;

  // 🚦 Whether game started
  bool _isPlaying = false;

  final Random _random = Random();

  /// Start the game
  void _startGame() {
    setState(() {
      _score = 0;
      _timeLeft = 10;
      _isPlaying = true;
    });

    // Timer to move the circle every 1 second
    _circleTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _moveCircle();
    });

    // Countdown timer
    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft--;
      });

      // Stop game when time reaches 0
      if (_timeLeft <= 0) {
        _endGame();
      }
    });
  }

  /// Move the circle to a new random position
  void _moveCircle() {
    setState(() {
      _x = _random.nextDouble() * 300 + 20; // random X
      _y = _random.nextDouble() * 500 + 80; // random Y
    });
  }

  /// Handle tapping the circle
  void _tapCircle() {
    if (!_isPlaying) return;
    setState(() {
      _score++;
    });
    _moveCircle(); // Move immediately after tap
  }

  /// End the game and stop timers
  void _endGame() {
    _circleTimer?.cancel();
    _gameTimer?.cancel();
    setState(() {
      _isPlaying = false;
    });

    // Show score dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Game Over 🎯'),
        content: Text('Your score: $_score'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _circleTimer?.cancel();
    _gameTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tap The Circle Game'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(color: Colors.deepPurple.shade50),
          ),

          // Display score and time
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Score: $_score',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Text(
              'Time: $_timeLeft',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),

          // 🎯 Circle (only visible when playing)
          if (_isPlaying)
            Positioned(
              left: _x,
              top: _y,
              child: GestureDetector(
                onTap: _tapCircle,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                      )
                    ],
                  ),
                ),
              ),
            ),

          // 🟢 Start button (only visible when not playing)
          if (!_isPlaying)
            Center(
              child: ElevatedButton(
                onPressed: _startGame,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                child: const Text(
                  'START GAME',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
