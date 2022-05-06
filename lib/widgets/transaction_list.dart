import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  
  List<Transaction> transactions = [];
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return 
     Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(children: [
                  Container(
                    child: Text(
                      '\$ ${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purple, width: 2, style: BorderStyle.solid),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ]),
              );
            }).toList(),
          ),
        ),
    );
  }
}
