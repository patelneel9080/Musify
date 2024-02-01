import 'package:flutter/material.dart';
import 'package:musify/firstpage.dart';
import 'package:musify/homescreen.dart';
import 'package:musify/playlistpage.dart';
import 'package:musify/testtwo.dart';


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
      debugShowCheckedModeBanner: false,
      home:  PlaylistPage(),
    );
  }
}