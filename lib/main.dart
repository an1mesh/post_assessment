import 'package:flutter/material.dart';
import 'package:post_assessment/widgets/splash_screen.dart';
import 'views/news_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/second': (context) => const NewsApiPage(),
      },
      initialRoute: '/',
    );
  }
}
