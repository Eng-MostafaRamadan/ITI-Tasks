import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class EventPlannerScreen extends StatefulWidget {
  const EventPlannerScreen({super.key});

  @override
  State<EventPlannerScreen> createState() => _EventPlannerScreenState();
}

class _EventPlannerScreenState extends State<EventPlannerScreen> {
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
        title: const Text("Event Planner"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("add");
                },
                icon: Icon(Icons.add_circle_outline)),
          )
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
                            "${item.get('Location')} • ${item.get('Date')}"),
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
                                  content: Text("Event successful Deleted"),
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
