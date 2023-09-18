import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Contents directory/Contents.dart';


void main() {
  runApp( MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/c_logo.gif',
        ),
        nextScreen: ContentsPage(),
        duration: 100,
      ),
    ));
  }
}
