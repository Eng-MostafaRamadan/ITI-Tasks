import 'package:day6_task/Providers/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);
    final double totalSpent =
        expenses.fold(0.0, (sum, expense) => sum + expense.amount);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff101820),
        onPressed: () {
          Navigator.of(context).pushNamed("expense");
        },
        child: const Icon(
          Icons.add,
          color: Color(0xffF2AA4C),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff101820),
        title: const Text(
          "Expense Tracker",
          style: TextStyle(color: Color(0xffF2AA4C)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xff101820),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Total Spent: \$${totalSpent.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF2AA4C),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: expenses.isEmpty
                  ? const Center(child: Text("No expenses added"))
                  : ListView.builder(
                      itemCount: expenses.length,
                      itemBuilder: (context, index) {
                        final expense = expenses[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.category, size: 30),
                            title: Text(
                              expense.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(expense.category),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "\$${expense.amount.toStringAsFixed(2)}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () {
                                    ref
                                        .read(expenseProvider.notifier)
                                        .removeExpense(expense);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
