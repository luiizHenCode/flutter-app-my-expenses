import 'package:flutter/material.dart';

import '../models/transactions.dart';
import './transaction_card.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (ctx, index) {
        return TransactionCard(transaction: transactions[index]);
      },
    );
  }
}
