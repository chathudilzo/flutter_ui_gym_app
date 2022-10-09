import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complex_ui_gym_app/video_info.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/loading-circles.json'),
      // Column(
      //   children: [
      //     Image.asset('assets/ex1.png'),
      //     Text(
      //       'Fit Life',
      //       style: TextStyle(
      //           fontSize: 40,
      //           fontWeight: FontWeight.bold,
      //           color: Color.fromARGB(255, 51, 18, 171)),
      //     )
      //   ],
      // ),
      backgroundColor: Colors.white,
      nextScreen: const HomePage(),
      splashIconSize: 250,
      duration: 3000,
    );
  }
}
