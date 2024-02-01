import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarousalSliderEx extends StatefulWidget {
  const CarousalSliderEx({super.key});

  @override
  State<CarousalSliderEx> createState() => _CarousalSliderExState();
}

class _CarousalSliderExState extends State<CarousalSliderEx>
    with SingleTickerProviderStateMixin {
  late AnimationController animatedController;
  bool isAnimated = false;
  bool showPlay = true;
  bool stopPlay = false;
  AssetsAudioPlayer player = AssetsAudioPlayer();

  @override
  void initState() {
    player.open(Audio( "assets/songs/Middle_Of_The_Night.mp3"));
    animatedController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  void animatedeIcon() {
    setState(() {
      isAnimated = !isAnimated;
      isAnimated ? animatedController.forward() : animatedController.reverse();
    });
    if (isAnimated) {
      setState(() {
        player.play();
        animatedController.forward();
      });
    } else {
      setState(() {
        player.pause();
        animatedController.reverse();
      });
    }
  }

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Color(0xff1C1F3E),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                animatedeIcon();
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){player.seekBy(Duration(seconds: -10));}, icon: Icon(Icons.replay_10,color: Colors.white,)),
                  AnimatedIcon(
                    icon: isAnimated
                        ? AnimatedIcons.play_pause
                        : AnimatedIcons.play_pause,
                    progress: animatedController,
                    color: Colors.white,
                  ),
                  IconButton(onPressed: (){player.seekBy(Duration(seconds: 10));}, icon: Icon(Icons.forward_10,color: Colors.white,)),
                  IconButton(onPressed: () {
                    player.next();
                  }, icon: Icon(Icons.skip_next))


                ],


              ),



            ),

        ]
        ),
      ),
    );
  }
}

