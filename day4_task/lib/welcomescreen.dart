import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff101820),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/cultural-cuisine.jpg"), // Use AssetImage instead of Image.asset
                  fit: BoxFit
                      .cover, // Optional: Ensures the image covers the container
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Welcome to WOW Pizza",
              style: TextStyle(
                color: Color(0xffF2AA4C),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xffF2AA4C)),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("MainScreen");
              },
              child: Text(
                "Start Ordering",
                style: TextStyle(color: Color(0xff101820)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
