import 'package:flutter/material.dart';

import '../widgets/input.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key, required this.onSubmit});

  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitForm() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      return;
    }

    // replace comma to dot
    amountController.text = amountController.text.replaceAll(",", ".");

    final title = titleController.text;
    final amount = double.tryParse(amountController.text) ?? 0.0;

    widget.onSubmit(title, amount);

    _clearForm();

    // Dismiss keyboard
  }

  void _clearForm() {
    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                "Nova transação",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          InputForm(
            controller: titleController,
            inputLabel: "Título",
          ),
          InputForm(
            controller: amountController,
            inputLabel: "Valor (R\$)",
            onSubmitted: _submitForm,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text("Nova transação")),
        ],
      ),
    );
  }
}
