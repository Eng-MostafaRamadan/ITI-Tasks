import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loading_indicator/loading_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List todo = [];
  String text = '';
  bool isLoading = false;
  final List<Color> _kDefaultRainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();
    callApi();
  }

  callApi() async {
    setState(() {
      isLoading = true;
    });

    Uri path = Uri.parse("https://api.mohamed-sadek.com/Task/Get");
    Map<String, String> headers = {"Content-Type": "application/json"};

    var response = await http.get(path, headers: headers);

    List temp = json.decode(response.body)["Data"];
    setState(() {
      todo = temp;
    });

    setState(() {
      isLoading = false;
    });
  }

  callApiToDelete(int taskId) async {
    Uri path =
        Uri.parse("https://api.mohamed-sadek.com/Task/Delete?ID=$taskId");
    Map<String, String> myHeaders = {"Content-Type": "application/json"};

    setState(() {
      isLoading = true;
    });

    var response = await http.delete(path, headers: myHeaders);

    if (response.statusCode == 200) {
      setState(() {
        todo.removeWhere((task) => task["ID"] == taskId);
      });
      print("Task deleted successfully!");
    } else {
      print("Failed to delete task: ${response.statusCode} - ${response.body}");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff02343F),
        onPressed: () {
          Navigator.of(context).pushNamed("Add");
        },
        child: Icon(Icons.add, color: Color(0xffF0EDCC)),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff02343F),
        title: Center(
          child: Text(
            "TO-DO List",
            style: TextStyle(color: Color(0xffF0EDCC)),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Color(0xffF0EDCC)),
            onPressed: callApi,
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  colors: _kDefaultRainbowColors,
                  strokeWidth: 4.0,
                ),
              ),
            ) // Show loading indicator
          : todo.isEmpty
              ? Center(
                  child: Text(
                    "No tasks available",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              : ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, index) {
                    final task = todo[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.task, color: Color(0xff02343F)),
                        title:
                            Text(task["Title"], style: TextStyle(fontSize: 18)),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            callApiToDelete(task["ID"]);
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
