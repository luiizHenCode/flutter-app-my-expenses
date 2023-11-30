import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_expenses/widgets/transaction_form.dart';

// MODELS
import '../models/transactions.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [];

  void _createTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  // void _deleteTransaction(String id) {
  //   setState(() {
  //     _transactions.removeWhere((transaction) => transaction.id == id);
  //   });
  // }

  void _openTransactionModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: TransactionForm(onSubmit: _createTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Icon(
          Icons.wallet,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () => _openTransactionModalForm(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text('Despesas pessoais'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: TransactionList(transactions: _transactions),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionModalForm(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
