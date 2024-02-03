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
  Audio('assets/songs/Hymn-For-The-Weekend(PaglaSongs).mp3',
      metas: Metas(
          title: 'Hymn For The Weekend',
          artist: 'Coldplay',
          image: const MetasImage.network('https://i1.sndcdn.com/artworks-000298133805-69dzfo-t500x500.jpg'))),
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
  Audio('assets/songs/Middle_Of_The_Night.mp3',
      metas: Metas(
          title: 'Middle Of The Night',
          artist: 'Elley Duhé',
          image: const MetasImage.network('https://i.scdn.co/image/ab67616d0000b27353a2e11c1bde700722fecd2e'))),
  Audio('assets/songs/Unstoppable-(PagalWorld).mp3',
      metas: Metas(
          title: 'Unstoppable',
          artist: 'Sia',
          image: const MetasImage.network('https://i.scdn.co/image/ab67616d0000b273754b2fddebe7039fdb912837'))),

  Audio('assets/songs/Maharani-(DJPunjab).mp3',
      metas: Metas(
          title: 'Maharani',
          artist: 'Karun and Lambo Drive',
          image: const MetasImage.network('https://i.pinimg.com/1200x/9c/2e/59/9c2e599bc306a7484cd24d6e42c3ad96.jpg'))),
  Audio('assets/songs/Me-Gustas-Tu (1).mp3',
      metas: Metas(
          title: 'Me Gustas Tu',
          artist: 'Manu Chao',
          image: const MetasImage.network('https://i1.sndcdn.com/artworks-000138147326-qqf0v7-t500x500.jpg'))),
  Audio('assets/songs/NF_-_The_Search_CeeNaija.mp3',
      metas: Metas(
          title: 'The Search',
          artist: 'NF',
          image: const MetasImage.network('https://upload.wikimedia.org/wikipedia/en/1/1b/NF_-_The_Search.png'))),
  Audio('assets/songs/Popular-(320Kbps.Com.In).mp3',
      metas: Metas(
          title: 'Popular',
          artist: 'Madonna and The Weeknd',
          image: const MetasImage.network('https://i1.sndcdn.com/artworks-zcOd3eRcGMtTF2k8-31pT9w-t500x500.jpg'))),
  Audio('assets/songs/Paisaa(PagalWorldl).mp3',
      metas: Metas(
          title: 'Paisaa',
          artist: 'Kushal Grumpy',
          image: const MetasImage.network('https://is1-ssl.mzstatic.com/image/thumb/Music116/v4/60/6f/d8/606fd89a-149c-cfe3-8ccd-d29197cefb91/artwork.jpg/400x400cc.jpg'))),
  Audio('assets/songs/The-Weeknd-After-Hours.mp3',
      metas: Metas(
          title: 'After Hours',
          artist: ' The Weeknd',
          image: const MetasImage.network('https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'))),
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
    NetworkImage(player.getCurrentAudioImage?.path ?? ''),
  );
  return paletteGenerator;
}
