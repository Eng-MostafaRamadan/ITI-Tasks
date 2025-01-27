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
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    image: AssetImage("assets/myPhoto.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage("assets/logo1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("1.3K Followers"),
                    ],
                  ),
                  SizedBox(width: 75),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage("assets/logo2.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
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
