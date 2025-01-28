import 'package:day3_task/models/questionsclass.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Questions> questions = [
    Questions(text: "Is the sky blue?", answer: true, id: 0),
    Questions(text: "Is 5 greater than 10?", answer: false, id: 1),
    Questions(text: "Is water wet?", answer: true, id: 2),
    Questions(text: "Is the Earth flat?", answer: false, id: 3),
    Questions(text: "Can birds fly?", answer: true, id: 4),
    Questions(text: "Is fire cold?", answer: false, id: 5),
    Questions(text: "Is the moon a planet?", answer: false, id: 6),
  ];
  int currentQuestionIndex = 0;
  bool? istrue; // Tracks whether the user answered Yes or No

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCF6F5),
      appBar: AppBar(
        backgroundColor: const Color(0xff990011),
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
            "Number of Questions: ${questions.length}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          // Icons row based on the value of `istrue`
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (istrue != null &&
                  istrue == questions[currentQuestionIndex].answer)
                const Icon(Icons.check_rounded, color: Colors.green, size: 30),
              if (istrue != null &&
                  istrue != questions[currentQuestionIndex].answer)
                const Icon(Icons.close_rounded, color: Colors.red, size: 30),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Question ${currentQuestionIndex + 1} of ${questions.length}",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          Text(
            questions[currentQuestionIndex].text,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  setState(() {
                    istrue = true; // User selected "Yes"
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    }
                  });
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  setState(() {
                    istrue = false; // User selected "No"
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    }
                  });
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
