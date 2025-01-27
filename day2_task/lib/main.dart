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
              SizedBox(height: 50),
              ContainerImage(
                  image: "assets/myPhoto.jpg", width: 100, height: 100),
              SizedBox(height: 20),
              Text("Mostafa Ramadan"),
              SizedBox(height: 10),
              Text("SOFTWARE DEVELOPER"),
              SizedBox(height: 10),
              Text("Create great Projects"),
              SizedBox(height: 10),
              Text("@TwWorks"),
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
