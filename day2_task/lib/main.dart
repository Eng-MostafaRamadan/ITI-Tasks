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
      home: Scaffold(
        backgroundColor: Color(0xffFCF6F5),
        appBar: AppBar(
          backgroundColor: const Color(0xff990011),
          leading: Icon(
            Icons.arrow_back,
            color: Color(0xffFCF6F5),
          ),
          title: Text(
            "My Profile",
            style: TextStyle(color: Color(0xffFCF6F5)),
          ),
        ),
        body: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
