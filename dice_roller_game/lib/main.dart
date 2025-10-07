// 🎲 Dice Roller App
// ------------------------------------------------------
// Goal: Tap a button → show a random dice face (1–6)
// Concepts: Asset images, Random numbers, setState()
// ------------------------------------------------------

import 'package:flutter/material.dart';
import 'dart:math'; // Import Random for dice rolling

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Start showing dice number 1 by default
  int _diceNumber = 1;

  // Function that generates a random number between 1 and 6
  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1; // Random returns 0–5 → +1 gives 1–6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          '🎲 Dice Roller',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            // Display dice image
            Image.asset(
              'assets/dice$_diceNumber.png', // Dynamically show dice1 → dice6
              width: 150,
            ),

            const SizedBox(height: 30),

            // Roll Button
            ElevatedButton.icon(
              onPressed: _rollDice,
              icon: const Icon(Icons.casino),
              label: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
