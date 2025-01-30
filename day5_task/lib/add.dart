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
                          return "This field is required";
                        }
                        return null;
                      },
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: "Enter your task...",
                        labelText: "Task",
                        labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500),
                        prefixIcon:
                            Icon(Icons.task_alt, color: Color(0xff02343F)),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear, color: Colors.redAccent),
                          onPressed: () {
                            formKey.currentState?.reset();
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Color(0xff02343F), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 1.5),
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
