import 'package:day7_task/addeventscreen.dart';
import 'package:day7_task/eventplannerscreen.dart';
import 'package:day7_task/firebase_options.dart';
import 'package:day7_task/loginscreen.dart';
import 'package:day7_task/profilescreen.dart';
import 'package:day7_task/registerscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "Event",
      routes: {
        "Event": (context) => EventPlannerScreen(),
        "add": (context) => AddEventScreen(),
        "register": (context) => Registerscreen(),
        "login": (context) => LoginScreen(),
        "profile": (context) => ProfileScreen()
      },
    );
  }
}
