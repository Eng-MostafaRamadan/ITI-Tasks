import 'package:day4_task/Data/category.dart';
import 'package:flutter/material.dart';

class Fries extends StatelessWidget {
  const Fries({super.key});

  @override
  Widget build(BuildContext context) {
    Category selectedCategory =
        ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff101820),
        title: Center(
          child: Text(
            selectedCategory.namec,
            style: TextStyle(color: Color(0xffF2AA4C)),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Fries.jpeg"),
          SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text(
            "Enjoy Your Delicious Fries",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("go back"),
          ),
        ],
      ),
    );
  }
}
