// 🧮 Counter App - Flutter Learning Project
// ----------------------------------------------------
// This simple app teaches you the basics of Flutter:
// - StatefulWidget vs StatelessWidget
// - setState() for updating UI
// - Using Scaffold, AppBar, Buttons, Text, and Layout widgets
// ----------------------------------------------------

import 'package:flutter/material.dart';

// The entry point of the Flutter app.
// runApp() inflates the widget tree starting from CounterApp().
void main() => runApp(const CounterApp());

// CounterApp is a StatelessWidget because it never changes by itself.
// It defines the app theme, title, and the home screen (CounterPage).
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false, // Hide the debug banner

      // Theme configuration (Material 3 + base color)
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),

      // The first page of the app
      home: const CounterPage(),
    );
  }
}

// CounterPage is a StatefulWidget because it holds mutable data (the counter value).
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// The State class holds data and UI logic for the CounterPage.
class _CounterPageState extends State<CounterPage> {
  // The integer value of the counter.
  int _counter = 0;

  // Increment function
  void _increment() {
    setState(() => _counter++); // Update counter and rebuild UI

    // When counter reaches 10, show a small feedback message
    if (_counter == 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('🎉 You reached 10!')),
      );
    }
  }

  // Decrement function with lower limit = 0
  void _decrement() {
    if (_counter > 0) {
      setState(() => _counter--);
    } else {
      // Show message if user tries to go below 0
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Counter can't go below zero 🚫")),
      );
    }
  }

  // Reset function to return counter to zero
  void _reset() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    // Access the current app theme to style text consistently
    final textTheme = Theme.of(context).textTheme;

    // Scaffold provides the main app structure (AppBar, Body, FAB)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          '🧮 Counter App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Center the title in the AppBar
      ),

      // The main body of the page
      body: Container(
        // Apply a gradient background using BoxDecoration
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFD8EFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        // Center the content vertically and horizontally
        child: Center(
          // Add padding around the content for spacing
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Wrap content vertically
              children: [
                // Label text above the counter
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12), // Vertical space

                // Display the counter value in a styled box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),

                  // Counter row (icon + number)
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Change the icon depending on whether counter is even or odd
                      Icon(
                        _counter.isEven
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            _counter.isEven ? Colors.redAccent : Colors.grey,
                      ),
                      const SizedBox(width: 10),

                      // Display the counter number with dynamic color
                      Text(
                        '$_counter',
                        style: textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _counter.isEven
                              ? Colors.blueAccent
                              : Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // --- Action Buttons Section ---
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Increment Button
                    ElevatedButton.icon(
                      onPressed: _increment,
                      icon: const Icon(Icons.add),
                      label: const Text('Increment'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(160, 45),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Decrement Button
                    ElevatedButton.icon(
                      onPressed: _decrement,
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrement'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade700,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(160, 45),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Reset Button
                    ElevatedButton.icon(
                      onPressed: _reset,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(160, 45),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      // FloatingActionButton (FAB) for quick increment
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment', // Tooltip text when long-pressed
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
