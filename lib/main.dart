import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:language_translator/lang_translator.dart';
import 'package:language_translator/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double dynamicHeight = MediaQuery.of(context).size.height * 0.9;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Translator',
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        nextScreen: const LanguageTranslator(),
        duration: 2000,
        backgroundColor: const Color(0xff7dd0fa),
        splashIconSize: dynamicHeight,
        splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
