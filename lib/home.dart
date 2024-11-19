import 'package:flutter/material.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            playerKey.currentState?.playAudio(
                'https://file-examples.com/storage/fef4e75e176737761a179bf/2017/11/file_example_MP3_700KB.mp3');
            playerExpandProgress.value = 1.0; // Expand the Miniplayer
          },
          child: Text('Play MP3 File'),
        ),
      ),
    );
  }
}
