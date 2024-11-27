import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  static const Map<ExpenseType, IconData> _iconMap = {
    ExpenseType.food: Icons.fastfood,
    ExpenseType.travel: Icons.flight_takeoff,
    ExpenseType.leisure: Icons.movie,
    ExpenseType.work: Icons.work,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align top for the icon and text
          children: [
            // Expanded space for title and amount
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Amount
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Icon and Date next to each other
            Row(
              children: [
                // Icon
                Icon(
                  _iconMap[expense.type],
                  size: 40,
                  color: Colors.blue[700],
                ),
                const SizedBox(width: 8), // Space between icon and date
                // Date
                Text(
                  DateFormat.yMd().format(expense.date),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
