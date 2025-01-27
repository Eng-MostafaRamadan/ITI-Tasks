import 'package:day2_task/container.dart';
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
            children: [
              SizedBox(height: 100),
              ContainerImage(
                  image: "assets/myPhoto.jpg", width: 100, height: 100),
              SizedBox(height: 20),
              Text(
                "Mostafa Ramadan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              Text("SOFTWARE DEVELOPER"),
              SizedBox(height: 10),
              Text(
                "Create Great Projects",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "@TwWorks",
                style: TextStyle(
                  color: const Color.fromARGB(255, 43, 87, 161),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.alternate_email_sharp),
                  SizedBox(width: 10),
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Icon(Icons.link),
                ],
              ),
              SizedBox(height: 75),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ContainerImage(
                          image: "assets/logo1.png", width: 50, height: 50),
                      SizedBox(height: 5),
                      Text("1.3K Followers"),
                    ],
                  ),
                  SizedBox(width: 75),
                  Column(
                    children: [
                      ContainerImage(
                          image: "assets/logo2.png", width: 50, height: 50),
                      SizedBox(height: 5),
                      Text("1.3K Followers"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
