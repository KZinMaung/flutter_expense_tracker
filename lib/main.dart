import 'package:flutter/material.dart';
import 'package:my_app/widgets/user_transaction.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: SingleChildScrollView(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Text("Status"),
                    color: Colors.blue,
                  ),
                ),
               UserTransaction()
              ]),
        ),
      ),
    );
  }
}
