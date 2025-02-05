import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  String Name = '';
  String Location = '';
  String Date = '';
  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
      ),
      body: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      key.currentState!.save();
                      FirebaseFirestore.instance.collection('Event').add({
                        "Name": Name,
                        "Location": Location,
                        "Date": "5/5/2025",
                      }).then((res) {
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
          )),
    );
  }
}
