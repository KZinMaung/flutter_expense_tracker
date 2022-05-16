import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(
                child: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}'),
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          title: Text(
            transaction.title,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          subtitle: Text(
              DateFormat.yMMMd().format(transaction.date)),
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
                  onPressed: () => deleteTx(transaction.id),
                  icon: Icon(Icons.delete),
                  label: Text("Delete"),
                  textColor: Theme.of(context).errorColor,

                )
              : IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () => deleteTx(transaction.id),
                )),
    );
  }
}
