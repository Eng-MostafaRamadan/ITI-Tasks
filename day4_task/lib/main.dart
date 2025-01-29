import 'package:day4_task/mainscreen.dart';
import 'package:day4_task/screens/burger.dart';
import 'package:day4_task/screens/cheesepizza.dart';
import 'package:day4_task/screens/fries.dart';
import 'package:day4_task/screens/noodles.dart';
import 'package:day4_task/screens/vegetablespizza.dart';
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
        "Vegetables pizza": (context) => VegetablesPizza(),
        "Cheese pizza": (context) => CheesePizza(),
        "Fries": (context) => Fries(),
        "Noodles": (context) => Noodles(),
        "Burger": (context) => Burger(),
      },
    );
  }
}
