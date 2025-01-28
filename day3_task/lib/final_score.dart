import 'package:flutter/material.dart';

class FinalScore extends StatefulWidget {
  const FinalScore({super.key, required this.correctAnswer});

  final int correctAnswer;

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  List<Widget> answerIcons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCF6F5),
      appBar: AppBar(
        backgroundColor: const Color(0xff990011),
        iconTheme: IconThemeData(color: Color(0xffFCF6F5)),
        title: const Center(
          child: Text(
            "Quiz App",
            style: TextStyle(color: Color(0xffFCF6F5)),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Text(
            "Number of Questions: 7",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: answerIcons,
          ),
          const SizedBox(height: 20),
          Text(
            "Your Score is ${widget.correctAnswer}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
