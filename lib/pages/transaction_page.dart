import 'package:expense_tracker/componets/heading.dart';
import 'package:expense_tracker/componets/transaction_tile.dart';
import 'package:expense_tracker/controller/db_helper.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<dynamic,dynamic>>>(
        future: dbHelper.fetch(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return const Center(child: Text('Unexpected Error!'));
          }if(snapshot.hasData){
            return ListView(
              children: [
                const Heading(headng: "Transaction"),
                Transaction(length: snapshot.data!.length, data: snapshot.data!)
              ],
            );
          } else {
            return const Center(child: Text('List Empty'));
          }
        }
      ),
    );
  }
}
