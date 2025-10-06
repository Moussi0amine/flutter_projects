// Import the Flutter material package.
// This gives access to all Material Design widgets like Scaffold, AppBar, etc.
import 'package:flutter/material.dart';

// The main() function is the entry point of every Dart/Flutter app.
// runApp() takes a widget and makes it the root of the widget tree.
void main() => runApp(const MyApp());

// MyApp is a StatelessWidget because it does not store or change any data itself.
// It just sets up the global structure and theme of the app.
class MyApp extends StatelessWidget {
  // A 'const' constructor means this widget will never change.
  const MyApp({super.key});

  // The build() method describes how to display this widget.
  // It returns another widget (here, a MaterialApp).
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App title, shown in task switchers and logs.
      title: 'Counter App',

      // The theme defines global styling (colors, typography, etc.)
      theme: ThemeData(
        useMaterial3: true,            // Use the latest Material 3 design
        colorSchemeSeed: Colors.red,  // Use blue as the base color
      ),

      // The home screen of our app (the first screen to show)
      home: const CounterPage(),
    );
  }
}

// CounterPage is a StatefulWidget because it contains data that can change (the counter value).
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  // createState() creates an instance of the state class (_CounterPageState)
  // where the mutable data and UI logic will live.
  @override
  State<CounterPage> createState() => _CounterPageState();
}

// The underscore (_) before the class name makes it private to this file.
class _CounterPageState extends State<CounterPage> {
  // This is the variable that holds the current counter value.
  // Because it changes, it must live inside the State class, not the Widget class.
  int _counter = 0;

  // This function increments the counter by 1.
  // setState() tells Flutter that something changed, and the UI needs to rebuild.
  void _increment() => setState(() => _counter++);

  // This function decrements the counter, but never below 0.
  void _decrement() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  // This function resets the counter to zero.
  void _reset() => setState(() => _counter = 0);

  // The build() method describes how to display the widget on screen.
  // It runs every time setState() is called.
  @override
  Widget build(BuildContext context) {
    // Get the app's text theme to use consistent text styles.
    final textTheme = Theme.of(context).textTheme;

    // Scaffold gives a basic material layout structure:
    // it provides an AppBar, body, and optional FloatingActionButton.
    return Scaffold(
      // AppBar: the top bar of the app
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('🔥 My First Flutter App',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true, // Center the title in the middle of the bar
      ),

      // Body: the main content area
      body: Center(
        // Center widget centers its child in the available space.
        child: Column(
          // Column arranges its children vertically.
          // mainAxisSize.min means it takes only as much height as needed.
          mainAxisSize: MainAxisSize.min,
          children: [
            // A simple label text
            const Text('You have pushed the button this many times:'),

            // Add some vertical spacing (8 logical pixels)
            const SizedBox(height: 8),

            // Display the counter value in large text
            Container(
               padding: const EdgeInsets.all(12),
               color: Colors.black12,
               child: Text(
               '$_counter',
               style: TextStyle(fontSize: 60, color: Colors.blueAccent),
                ),
              ),

            // Another small space between widgets
            const SizedBox(height: 16),

            // A row to place multiple buttons horizontally
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Decrement button
                ElevatedButton.icon(
                  onPressed: _decrement,            // Action when pressed
                  icon: const Icon(Icons.remove),   // Icon inside the button
                  label: const Text('Decrement'),   // Button text
                ),

                // Add some space between buttons
                const SizedBox(width: 10),

                // Reset button
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),

                const SizedBox(width: 10),

                // Increment button
                ElevatedButton.icon(
                  onPressed: _increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
              ],
            ),
          ],
        ),
      ),

      // FloatingActionButton: a circular button floating over the content.
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,              // Increase counter when pressed
        tooltip: 'Increment',               // Tooltip on long-press
        child: const Icon(Icons.add),       // The + icon
      ),
    );
  }
}
