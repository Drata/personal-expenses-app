import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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
            child: Text('No transactions added yet.'),
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('${transactions[index].amount}\€')),
                    ),
                  ),
                  title: Text('${transactions[index].title}'),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width >= 500
                      ? FlatButton.icon(
                          label: Text('Delete'),
                          textColor: Colors.red,
                          icon: Icon(Icons.delete),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => deleteTx(transactions[index].id)),
                ),
              );
            },
          );
  }
}
