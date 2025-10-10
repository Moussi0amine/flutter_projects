// Importing the Dart async library for Timer functionality
import 'dart:async';

// importing Flutter's Material package for UI widgets and themes
import 'package:flutter/material.dart';

// The main() function is the entry point of every Flutter app
void main() => runApp(const StopwatchApp());

/// 🧱  Root widget of the entire application.
/// This is a StatelessWidget because it doesn't need to store any changing data.
class StopwatchApp extends StatelessWidget {
  const StopwatchApp({
    super.key,
  }); // Constructor with optional key (good practice)

  @override
  Widget build(BuildContext Context) {
    // The build() method describes what the UI looks like
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Removes the debug banner in top-right corner
      title: 'Stopwatch App', // App title (used by os/task manager)
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ), // App-wide theme color
      home: const StopwatchScreen(), // Sets the home screen widget
    );
  }
}

/// 🕒 Main screen widget for the stopwatch.
/// It's Stateful because the time display updates dynamically.
class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

/// The private State class where we hold variables and logic.
class _StopwatchScreenState extends State<StopwatchScreen> {
  // 🧮 Variable to track the total number of seconds elapsed
  int _seconds = 0;

  // ⏲️ Timer object from dart:async that ticks every second
  Timer? _timer;

  // 🚦 Boolean flag to know if the timer is currently running
  bool _isRunning = false;

  /// ▶️ Starts the timer if it's not already running
  void _startTimer() {
    if (_isRunning) return; // If timer is already running, do nothing

    _isRunning = true; // Mark timer as running

    // Create a periodic timer that runs every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // setState() tells Flutter: "Something changed, rebuild the UI"
      setState(() {
        _seconds++; // Increase total seconds by 1 every tick
      });
    });
  }

  /// ⏸️ Stops (pauses) the timer
  void _stopTimer() {
    _timer?.cancel(); // Safely cancel the timer if it exists
    _isRunning = false; // Update running state
  }

  /// 🔄 Resets the timer to 0 and stops it
  void _resetTimer() {
    _stopTimer(); // Stop the timer first
    setState(() {
      _seconds = 0; // Reset elapsed time to zero
    });
  }

  /// 🧮 Helper function to format seconds into mm:ss (e.g, 02:45)
  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(
      2,
      '0',
    ); // Divide by 60 to get minutes, pad with loading 0
    final secs = (seconds % 60).toString().padLeft(
      2,
      '0',
    ); // Get remaining seconds
    return '$minutes:$secs'; // Combine into a formatted string
  }

  /// 🚪 This method runs when the widget is romoved from the screen.
  /// We use it to cancel the timer to  avoid memory leaks.
  @override
  void dispose() {
    _timer?.cancel(); // Cancel active timer if it exists
    super.dispose(); // Always call the parent dispose() method
  }

  /// 🎨 The build() method descirbes the UI every time it updates.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⏱ Stopwatch'),
      ), // Top app bar with title
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center all elements vertically
          children: [
            // 🕒 Text widget to display the current time
            Text(
              _formatTime(_seconds), // Call our formatter function
              style: const TextStyle(
                fontSize: 64, // Large text for visibility
                fontWeight: FontWeight.bold, // Bold style
                color: Colors.deepPurple, // Matches theme
              ),
            ),

            const SizedBox(height: 40), // Add space below the timer text
            // 🔘 Buttons arranged horiznetally
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                // ▶️ Start Button
                ElevatedButton.icon(
                  onPressed: _isRunning
                      ? null
                      : _startTimer, // Disabled if already running
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start'),
                ),

                const SizedBox(width: 20), // Small gap between buttons
                // ⏸️ Stop Button
                ElevatedButton.icon(
                  onPressed: _isRunning
                      ? _stopTimer
                      : null, // Disabled if not running
                  icon: const Icon(Icons.pause),
                  label: const Text('Stop'),
                ),

                const SizedBox(width: 20), // Another small gap
                // 🔄 Reset Button
                ElevatedButton.icon(
                  onPressed: _resetTimer, // Always available
                  icon: const Icon(Icons.refresh),
                  label: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
