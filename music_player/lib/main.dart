import 'package:flutter/material.dart';

void main() => runApp(const MusicPlayerApp());

/// 🎵 Root widget of the app
class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Music Player UI',
      theme: ThemeData(
        brightness: Brightness.dark, // dark theme for music app style
        primarySwatch: Colors.deepPurple,
      ),
      home: const MusicPlayerScreen(), // load the main screen
    );
  }
}

/// 🖼️ Main music player screen (stateful for animation)
class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  // 🎚️ Simulated playback progress (0 to 100)
  double _progress = 30;

  // ▶️ State for play/pause toggle
  bool _isPlaying = false;

  /// Toggle play/pause animation
  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎧 Now Playing'),
        centerTitle: true, // center title in the app bar
        elevation: 0, // flat design
      ),
    );
  }
}
