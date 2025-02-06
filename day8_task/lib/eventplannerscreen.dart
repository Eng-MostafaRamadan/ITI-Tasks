import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:intl/intl.dart';

class EventPlannerScreen extends StatefulWidget {
  const EventPlannerScreen({super.key});

  @override
  State<EventPlannerScreen> createState() => _EventPlannerScreenState();
}

class _EventPlannerScreenState extends State<EventPlannerScreen> {
  //function to Handle date format
  String formatDate(dynamic dateValue) {
    if (dateValue == null) {
      return "No Date"; // Handle null case
    }

    if (dateValue is Timestamp) {
      return DateFormat.yMMMd()
          .format(dateValue.toDate()); // Convert Timestamp to DateTime
    } else if (dateValue is String) {
      try {
        return DateFormat.yMMMd()
            .format(DateTime.parse(dateValue)); // Parse String to DateTime
      } catch (e) {
        return "Invalid Date"; // Handle invalid date strings
      }
    } else if (dateValue is DateTime) {
      return DateFormat.yMMMd().format(dateValue); // Use DateTime directly
    } else {
      return "Invalid Date"; // Handle other types
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 60, 11, 128),
        title: Text(
          "Event Planner",
          style: TextStyle(
            color: Color(0xFFF3E5F5),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("add");
            },
            icon: Icon(Icons.add_circle_outline),
            style: ButtonStyle(
              iconColor: WidgetStateProperty.all(
                Color(0xFFF3E5F5),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("profile");
            },
            icon: Icon(Icons.account_circle),
            style: ButtonStyle(
              iconColor: WidgetStateProperty.all(
                Color(0xFFF3E5F5),
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Event').snapshots(),
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingIndicator(
                indicatorType: Indicator.ballScaleMultiple,
                colors: _kDefaultRainbowColors,
                strokeWidth: 4.0,
              ),
            );
          }

          if (snapshots.hasError) {
            return const Center(
              child: Text("Error loading data."),
            );
          }

          if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text("No events found."),
            );
          }

          return ListView(
            children: snapshots.data!.docs
                .map((item) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(
                          item.get('Name'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${item.get('Location')} • ${formatDate(item.get('Date'))}",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('Event')
                                .doc(item.id)
                                .delete()
                                .then((res) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Event successful Deleted",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }).catchError((err) {
                              print(err);
                            });
                          },
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
