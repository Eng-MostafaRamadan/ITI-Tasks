import 'package:day4_task/mainscreen.dart';
import 'package:day4_task/welcomescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        "MainScreen": (context) => MainScreen(),
      },
    );
  }
}
