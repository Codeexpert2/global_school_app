import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key, required this.audioUrl}); 
  final String audioUrl; 

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  String errorMessage = '';
  double speed = 1.0;
  double volume = 1.0;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> togglePlayPause() async {
    try {
      if (isPlaying) {
        await player.pause();
      } else {
        await player.setUrl(widget.audioUrl);
        await player.play();
      }
      setState(() {
        isPlaying = !isPlaying;
        errorMessage = '';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'حدث خطأ أثناء تحميل الصوت: $e';
      });
    }
  }

  void changeSpeed(double newSpeed) {
    setState(() {
      speed = newSpeed;
      player.setSpeed(speed);
    });
  }

  void changeVolume(double newVolume) {
    setState(() {
      volume = newVolume;
      player.setVolume(volume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مشغل الصوت')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: togglePlayPause,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(isPlaying ? 'إيقاف مؤقت' : 'تشغيل'),
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.fast_rewind),
                  onPressed: () =>
                      changeSpeed(speed - 0.5 > 0 ? speed - 0.5 : 0.5),
                ),
                Text('سرعة الصوت: ${speed.toStringAsFixed(1)}x'),
                IconButton(
                  icon: const Icon(Icons.fast_forward),
                  onPressed: () => changeSpeed(speed + 0.5),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_down),
                  onPressed: () =>
                      changeVolume(volume - 0.1 > 0 ? volume - 0.1 : 0),
                ),
                Text('مستوى الصوت: ${(volume * 100).toInt()}%'),
                IconButton(
                  icon: const Icon(Icons.volume_up),
                  onPressed: () =>
                      changeVolume(volume + 0.1 < 1 ? volume + 0.1 : 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
