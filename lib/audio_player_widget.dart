import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({Key? key}) : super(key: key);

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? currentAudio;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio(String url) async {
    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
      setState(() {
        currentAudio = url;
      });
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void pauseAudio() async {
    await _audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: SingleChildScrollView( // Added SingleChildScrollView to prevent overflow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (currentAudio != null)
                Column(
                  children: [
                    Text(
                      'Playing Audio',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Slider(
                      value: _audioPlayer.position.inSeconds.toDouble(),
                      max: _audioPlayer.duration?.inSeconds.toDouble() ?? 1.0,
                      onChanged: (value) async {
                        await _audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.pause, color: Colors.white),
                          onPressed: pauseAudio,
                        ),
                        IconButton(
                          icon: Icon(Icons.play_arrow, color: Colors.white),
                          onPressed: () async => await _audioPlayer.play(),
                        ),
                      ],
                    ),
                  ],
                )
              else
                Text(
                  'No Audio Playing',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
