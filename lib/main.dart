import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:minimusic/home.dart';
import 'package:minimusic/minplayer.dart';
import 'package:minimusic/msg.dart';
import 'package:miniplayer/miniplayer.dart';
import 'audio_player_widget.dart';

void main() => runApp(MyApp());

final _navigatorKey = GlobalKey<NavigatorState>();
final playerKey = GlobalKey<AudioPlayerWidgetState>();
ValueNotifier<double> playerExpandProgress = ValueNotifier(0);
  final AudioPlayer audioPlayer = AudioPlayer();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miniplayer with Audio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFAFAFA),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MiniplayerWillPopScope(
      onWillPop: () async {
        final NavigatorState? navigator = _navigatorKey.currentState;
        if (navigator != null && !navigator.canPop()) return true;
        navigator?.pop();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Navigator(
              key: _navigatorKey,
              onGenerateRoute: (RouteSettings settings) => MaterialPageRoute(
                settings: settings,
                builder: (BuildContext context) => _pages[_currentIndex],
              ),
            ),
            Miniplayer(
              valueNotifier: playerExpandProgress,
              minHeight: 70,
              maxHeight: MediaQuery.of(context).size.height,
              builder: (height, percentage) =>
                  AudioPlayerWidget(key: playerKey),
            ),
          ],
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min,
          children: [
                 MiniPlayerWidget(audioPlayer: audioPlayer),
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

