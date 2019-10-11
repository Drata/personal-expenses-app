import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'Zapatos', amount: 50.54, date: DateTime.now()),
    Transaction(id: 't2', title: 'Comida', amount: 30.99, date: DateTime.now()),
    Transaction(id: 't3', title: 'Cine', amount: 12.99, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    
    setState(() {
     _userTransactions.add(newTx); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
