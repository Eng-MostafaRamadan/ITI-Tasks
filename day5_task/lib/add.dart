import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String text = '';
  bool isloading = false;
  final List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  callApi() async {
    Uri path = Uri.parse("https://api.mohamed-sadek.com/Task/POST");
    Map<String, String> myHeaders = {"Content-Type": "application/json"};
    Map<String, dynamic> myBody = {"Title": text};

    setState(() {
      isloading = true;
    });

    await http.post(path, headers: myHeaders, body: json.encode(myBody));

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffF0EDCC)),
        backgroundColor: Color(0xff02343F),
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            "Add To Do",
            style: TextStyle(color: Color(0xffF0EDCC)),
          ),
        ),
      ),
      body: isloading == true
          ? Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  colors: _kDefaultRainbowColors,
                  strokeWidth: 4.0,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      onSaved: (newValue) => text = newValue!,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This Field is Required";
                        }
                        return null;
                      },
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter your task...",
                        labelText: "Type Your Text",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Color(0xff02343F)),
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          callApi();
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Color(0xffF0EDCC)),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
