import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';


const kPrimaryColor = Color(0xFFebbe8b);

// playlist songs
List<Audio> songs = [
  Audio('assets/songs/Dandelions(PagalWorld).mp3',
      metas: Metas(
          title: 'Dandelions',
          artist: 'Ruth B',
          image: const MetasImage.network(
              'https://i.scdn.co/image/ab67616d0000b27397e971f3e53475091dc8d707'))),
  Audio('assets/songs/Heat-Waves(PagalWorld).mp3',
      metas: Metas(
          title: 'Heat Waves',
          artist: 'Glass Animals',
          image: const MetasImage.network('https://upload.wikimedia.org/wikipedia/en/b/b0/Glass_Animals_-_Heat_Waves.png'))),
  Audio('assets/songs/Into Your Arms(PagalWorld.com.pe).mp3',
      metas: Metas(
          title: 'Into Your Arms',
          artist: 'Ava Max and Witt Lowry',
          image: const MetasImage.network('https://i1.sndcdn.com/artworks-000357938454-4ru6zy-t500x500.jpg'))),
];

String durationFormat(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitMinutes:$twoDigitSeconds';
  // for example => 03:09
}

// get song cover image colors
Future<PaletteGenerator> getImageColors(AssetsAudioPlayer player) async {
  var paletteGenerator = await PaletteGenerator.fromImageProvider(
    AssetImage(player.getCurrentAudioImage?.path ?? ''),
  );
  return paletteGenerator;
}
