import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  void deleteTransaction() {
    deleteTx();
  }

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Center(
            child: const Text('No transactions added yet.'),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
            },
          );
  }
}


