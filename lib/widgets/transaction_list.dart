import 'package:flutter/material.dart';
import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return (transactions.isEmpty)
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Text(
                  "No transaction added yet!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                    height: constraints.maxHeight * 0.8,
                    width: isLandscape
                        ? constraints.maxWidth * 0.4
                        : constraints.maxWidth,
                    child: Image.asset(
                      'assets/images/lazy-cat.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return  TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
            },
            itemCount: transactions.length,
          );
  }
}

