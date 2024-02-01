import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:musify/modelsongview.dart';

class MusicPages extends StatefulWidget {
  const MusicPages({required this.song,required this.profile,required this.singer,
      super.key, });

  final String profile;
  final String singer;
  final String song;

  @override
  State<MusicPages> createState() => _MusicPagesState();
}

class _MusicPagesState extends State<MusicPages> {

  final AssetsAudioPlayer song = AssetsAudioPlayer();

  int _currentIndex = 0;


  @override
  void initState() {
    // TODO: implement initState
    song.open(Audio(widget.song[_currentIndex]),autoStart: true);
    super.initState();
  }

  @override
  void dispose() {
    song.dispose();
    super.dispose();
  }

  void _nextSong() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % Songdetail.length;song.open(
        Audio(widget.song),
        showNotification: true,
      );
    });
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
      width: size.width,
        child: Column(
          children: [
            CircleAvatar(
              radius: 130,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(widget.profile),
            ),
            SizedBox(
              height: size.height/54,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(widget.singer,
                  style:  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,)),
            ),
            ElevatedButton(
              onPressed: _nextSong,
              child: Text('Next Song'),
            ),
          ],
        ),
      ),
    );
  }
}
