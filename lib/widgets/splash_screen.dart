import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:post_assessment/views/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.network(
        'https://cdn-icons-png.flaticon.com/512/1042/1042680.png',
        height: 500,
        width: 500,
      ),
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
