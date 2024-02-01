import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> audioAssets = [
    'assets/songs/Heat-Waves(PagalWorld).mp3',
    'assets/songs/Dandelions(PagalWorld).mp3',
    'assets/songs/Into Your Arms(PagalWorld.com.pe).mp3',
    'assets/songs/Middle_Of_The_Night.mp3',
    'assets/songs/Unstoppable-(PagalWorld).mp3'
  ];


  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    audioPlayer.open(
      Audio(audioAssets[_currentIndex]),
      autoStart: true,
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void _nextSong() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % audioAssets.length;audioPlayer.open(
        Audio(audioAssets[_currentIndex]),
        showNotification: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: PlayerBuilder.currentPosition(
                player: audioPlayer,
                builder: (context, audio) {
                  return Text(
                    "",

                    style: TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
          ),
          CarouselSlider(
            items: audioAssets.map((asset) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text(
                      asset,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 100.0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: _nextSong,
            child: Text('Next Song'),
          ),
        ],
      ),
    );
  }
}