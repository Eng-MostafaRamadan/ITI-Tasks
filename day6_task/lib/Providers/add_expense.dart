import 'package:day6_task/Data/expense_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super([]);

  void addExpense(String title, double amount, String category) {
    state = [
      ...state,
      Expense(title: title, amount: amount, category: category)
    ];
  }

  double getTotalSpent() {
    return state.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  void removeExpense(Expense expense) {
    state = state.where((e) => e != expense).toList();
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>(
  (ref) => ExpenseNotifier(),
);
