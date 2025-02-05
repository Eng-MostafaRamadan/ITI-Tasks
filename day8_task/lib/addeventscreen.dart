import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String Name = '';
  String Location = '';
  DateTime Date = DateTime.now();
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xFFF3E5F5),
        ),
        backgroundColor: Color.fromARGB(255, 60, 11, 128),
        title: Text(
          "Add Event",
          style: TextStyle(
            color: Color(0xFFF3E5F5),
          ),
        ),
      ),
      body: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Event name is Required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      Name = value!;
                    });
                  },
                  decoration: InputDecoration(
                    label: Text("Event Name"),
                    prefixIcon: Icon(Icons.event),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Location is Required";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      Location = value!;
                    });
                  },
                  decoration: InputDecoration(
                    label: Text("Location"),
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Selected Date: ${DateFormat('dd/MM/yyyy').format(Date)}",
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            textStyle: TextStyle(fontSize: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              context: context,
                              builder: (context) => Container(
                                padding: EdgeInsets.all(20),
                                height: 300,
                                child: Column(
                                  children: [
                                    const Text(
                                      "Select Event Date",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 160,
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: Date,
                                        onDateTimeChanged: (DateTime date) {
                                          setState(() {
                                            Date = date;
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          Date = Date;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text("Choose Date"),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          key.currentState!.save();
                          FirebaseFirestore.instance.collection('Event').add({
                            "Name": Name,
                            "Location": Location,
                            "Date": Date.toString(),
                          }).then((res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Event successful Added",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.of(context).pop();
                          }).catchError((err) {
                            print(err);
                          });
                        }
                      },
                      child: Text("Save Product data"),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
