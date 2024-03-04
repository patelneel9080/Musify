import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:musify/playlist_page.dart';


void main() async {
  //initialise the hive

  runApp(
    // DevicePreview(builder: (context) => MyApp(),enabled: true,)
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musify',
      darkTheme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home:  Playlistpage(),
    );
  }
}