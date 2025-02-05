import 'package:flutter/material.dart';

class EventPlannerScreen extends StatefulWidget {
  const EventPlannerScreen({super.key});

  @override
  State<EventPlannerScreen> createState() => _EventPlannerScreenState();
}

class _EventPlannerScreenState extends State<EventPlannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Planner"),
      ),
    );
  }
}
