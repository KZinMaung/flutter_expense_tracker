import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shirts', amount: 14.2, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Bags', amount: 32.2, date: DateTime.now()),
  ];

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  _addNewTransaction(String title, double amount) {
    var _newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _userTransactions.add(_newTransaction);
    });
    _titleController.clear();
    _amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
