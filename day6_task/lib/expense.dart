import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedCategory = 'Food';
    final List<String> categories = ['Food', 'Transport', 'Shopping', 'Bills'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                label: Text("Title"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text("Amount"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 120,
              height: 80,
              child: DropdownButtonFormField(
                value: selectedCategory,
                items: categories.map((category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle expense submission
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Add Expense'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
