import 'package:flutter/material.dart';

void main() => runApp(const MusicPlayerApp());

/// 🎵 Root widget of the app
class MusicPlayerApp extends StatelessWidget {
  const MusicPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
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
      body: Padding(
        padding: const EdgeInsets.all(20.0), // consistent spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // center vertically
          children: [
            // 🖼️ Album cover inside rounded container
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://i.scdn.co/image/ab67616d0000b27345e9f35c25179b4fba7ef4da',
                height: 250,
                width: 250,
                fit: BoxFit.cover, // maintain aspect ratio
              ),
            ),

            const SizedBox(height: 30), // spacing below album cover

            // 🎶 Song title and artist
            const Text(
              'Blinding Lights',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'The Weeknd',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            // 📊 Progress bar (fake for now)
            Slider(
              value: _progress,
              min: 0,
              max: 100,
              activeColor: Colors.deepPurpleAccent,
              inactiveColor: Colors.white24,
              onChanged: (value) {
                setState(() {
                  _progress = value; // update fake progress
                });
              },
            ),

            // Time labels (start / end)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('1:20', style: TextStyle(color: Colors.grey)),
                Text('3:45', style: TextStyle(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 40),

            // 🎵 Control Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ⏮️ Previous track
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_previous, size: 40),
                ),

                const SizedBox(width: 20),

                // ▶️ / ⏸️ Animated Play-Pause Button
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: _isPlaying
                        ? Colors.deepPurpleAccent
                        : Colors.deepPurple, // slight color change on play
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: IconButton(
                    iconSize: 45,
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: _togglePlay,
                  ),
                ),

                const SizedBox(width: 20),

                // ⏭️ Next track
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.skip_next, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
