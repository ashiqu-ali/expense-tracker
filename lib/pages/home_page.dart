import 'package:expense_tracker/componets/heading.dart';
import 'package:expense_tracker/componets/homeProfile.dart';
import 'package:expense_tracker/componets/total_card.dart';
import 'package:expense_tracker/componets/transaction_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper dbhelper = DbHelper();
  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;

  getTotalBalance(List<Map<dynamic, dynamic>> entireData) {
    totalBalance = 0;
    totalIncome = 0;
    totalExpense = 0;
    entireData.forEach((value) {
      if (value['type'] == 'Income') {
        totalBalance += (value['amount'] as int);
        totalIncome += (value['amount'] as int);
      } else if (value['type'] == 'Expense') {
        totalBalance -= (value['amount'] as int);
        totalExpense += (value['amount'] as int);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Map<dynamic, dynamic>>>(
        future: dbhelper.fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Unexpected Error!'));
          }
          if (snapshot.hasData) {
            getTotalBalance(snapshot.data!);
            return ListView(
              children: [
                const HomeProfile(),
                TotalBalance(totalBalance: totalBalance, totalIncome: totalIncome, totalExpense: totalExpense),
                const Heading(headng: "Recent Transaction"),
                Transaction(length: snapshot.data!.length, data: snapshot.data!),
              ],
            );
          } else {
            return const Center(child: Text('Unexpected Error!(else)'));
          }
        },
      ),
    );
  }
}