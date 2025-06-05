import 'package:flutter/material.dart';
import 'dart:ui';
import 'screens/login_screens.dart';
import 'screens/home_screen.dart';
import 'screens/live_video_screen.dart';

void main() {
  runApp(ZentraApp());
}

class ZentraApp extends StatelessWidget {
  const ZentraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zentra',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.purpleAccent,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white70,
            fontFamily: 'Montserrat',
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Montserrat',
            letterSpacing: 1.2,
          ),
        ),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}