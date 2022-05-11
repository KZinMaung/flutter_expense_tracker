import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: (transactions.isEmpty)
          ? Column(
              children: [
                Text("No transaction added yet!",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Container(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/lazy-cat.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(child: Text('\$${transactions[index].amount.toStringAsFixed(2)}'),),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(transactions[index].title,style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 16),),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,color: Theme.of(context).errorColor,),
                      onPressed:()=> deleteTx(transactions[index].id),
                    )
                
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
