import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer? audioPlayer;
  String durasi = "00:00:00";

  _MyAppState() {
    audioPlayer = AudioPlayer();
    audioPlayer!.onPositionChanged.listen((duration) {
      setState(() {
        durasi = duration.toString();
      });
    });

    audioPlayer!.setReleaseMode(ReleaseMode.loop);
  }

  void playMusic(String url) async {
    await audioPlayer!.play(UrlSource(url));
  }

  void pauseMusic() async {
    await audioPlayer!.pause();
  }

  void stopMusic() async {
    await audioPlayer!.stop();
  }

  void resumeMusic() async {
    await audioPlayer!.resume();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Play Music'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      playMusic(
                          "https://fi.zophar.net/soundfiles/sega-mega-drive-genesis/top-gear-2/01%20-%20Title%20Theme.mp3");
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      pauseMusic();
                    },
                    child: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      stopMusic();
                    },
                    child: const Icon(
                      Icons.stop,
                      color: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      resumeMusic();
                    },
                    child: const Icon(
                      Icons.repeat,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                durasi,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
