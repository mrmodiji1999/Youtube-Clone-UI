import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// Mini player widget
class MiniPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;

  const MiniPlayerWidget({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  _MiniPlayerWidgetState createState() => _MiniPlayerWidgetState();
}

class _MiniPlayerWidgetState extends State<MiniPlayerWidget> {
  String? currentAudio;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state.playing;
      });
    });

    widget.audioPlayer.positionStream.listen((position) {
      // You can listen to position changes here if you want to update UI based on playback position
    });
  }

  Future<void> playPauseAudio() async {
    if (isPlaying) {
      await widget.audioPlayer.pause();
    } else {
      await widget.audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 80,
        color: Colors.black.withOpacity(0.7),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.play_arrow, color: Colors.white),
              onPressed: () async {
                await widget.audioPlayer.setUrl('https://file-examples.com/storage/fef4e75e176737761a179bf/2017/11/file_example_MP3_700KB.mp3');
                currentAudio = 'file_example_MP3_700KB.mp3';
                await widget.audioPlayer.play();
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (currentAudio != null)
                    Text(
                      currentAudio!,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  Text(
                    isPlaying ? 'Playing' : 'Paused',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.white),
              onPressed: playPauseAudio,
            ),
          ],
        ),
      ),
    );
  }
}
