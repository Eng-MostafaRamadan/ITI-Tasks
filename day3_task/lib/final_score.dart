import 'package:flutter/material.dart';

class FinalScore extends StatefulWidget {
  const FinalScore({super.key, required this.correctAnswer});

  final int correctAnswer;

  @override
  State<FinalScore> createState() => _FinalScoreState();
}

class _FinalScoreState extends State<FinalScore> {
  List<Widget> answerIcons = [];
  String resultMessage = '';

  void result(int correctAnswer) {
    if (correctAnswer == 7) {
      resultMessage = "You are Excellent";
    } else if (correctAnswer > 3 || correctAnswer > 7) {
      resultMessage = "Good job, keep improving!";
    } else {
      resultMessage = "You will do better next time :)";
    }
  }

  @override
  void initState() {
    super.initState();
    result(widget.correctAnswer);
    setState(() {});
  }

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
            "Your Score is ${widget.correctAnswer}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20),
          Text(
            resultMessage,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
