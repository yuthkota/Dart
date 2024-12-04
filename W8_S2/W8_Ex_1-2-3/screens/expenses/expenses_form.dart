import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});
  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );
    if (pickedDate != null) setState(() => _selectedDate = pickedDate);
  }

  void _onAdd() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_valueController.text);
    final isValid = title.isNotEmpty && amount != null && amount > 0 && _selectedCategory != null && _selectedDate != null;

    if (isValid) {
      widget.onCreated(Expense(
        title: title,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory!,
      ));
      Navigator.pop(context);
    } else {
      final errorMessage = title.isEmpty
          ? "The title cannot be empty"
          : (amount == null || amount <= 0)
              ? "The amount shall be a positive number"
              : _selectedCategory == null
                  ? "Please select a category"
                  : "Please select a date";
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: Text(errorMessage),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Okay'))],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 50,
            decoration: const InputDecoration(prefix: Text('\$ '), label: Text('Amount')),
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            isExpanded: true,
            hint: const Text('Select a category'),
            items: Category.values.map((category) => DropdownMenuItem(value: category, child: Text(category.name.toUpperCase()))).toList(),
            onChanged: (newCategory) => setState(() => _selectedCategory = newCategory),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: Text('Selected Date: ${_selectedDate != null ? DateFormat.yMMMd().format(_selectedDate!) : 'No Date Selected'}')),
              IconButton(onPressed: _pickDate, icon: const Icon(Icons.calendar_today)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: _onAdd, child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
