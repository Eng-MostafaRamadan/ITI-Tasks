import 'package:day5_task/add.dart';
import 'package:day5_task/main_screen.dart';
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
      initialRoute: "Main",
      routes: {
        "Main": (context) => MainScreen(),
        "Add": (context) => AddScreen(),
      },
    );
  }
}
