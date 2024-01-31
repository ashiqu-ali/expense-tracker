import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';
import '../componets/heading.dart';
import '../componets/homeProfile.dart';
import '../componets/recent_transaction.dart';
import '../componets/total_card.dart';
import '../controller/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) > const Duration(seconds: 2)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              padding: EdgeInsets.all(12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              content: Text('Press back again to exit'),
            ),
          );
          currentBackPressTime = DateTime.now();
          return false; // Do not exit the app
        } else {
          // Exit the app when back button is pressed twice within 2 seconds
          return true;
        }
      },
      child: SafeArea(
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
                  RecentTransaction(data: snapshot.data!)
                ],
              );
            } else {
              return const Center(child: Text('Unexpected Error!(else)'));
            }
          },
        ),
      ),
    );
  }
}
