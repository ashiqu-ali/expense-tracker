import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker/controller/db_helper.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {
  final DbHelper dbhelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: dbhelper.fetch(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        if (snapshot.hasData) {
          // Filter expense data
          List<Map<dynamic, dynamic>> expenseData = snapshot.data!
              .where((entry) => entry['type'] == 'Expense')
              .toList();

          // Group expense data by category
          Map<String, double> categoryTotals = {};
          for (var entry in expenseData) {
            String category = entry['category'];
            double amount = entry['amount'].toDouble();
            categoryTotals[category] = (categoryTotals[category] ?? 0) + amount;
          }

          double totalExpense = categoryTotals.values.fold(0, (sum, amount) => sum + amount);

          if(totalExpense==0){
            return Center(child: Text("No data available.", style: p1,));
          }
          // Create PieChartData
          PieChartData pieChartData = PieChartData(
            sections: categoryTotals.entries.map((entry) {
              return PieChartSectionData(
                color: Colors.accents[entry.key.hashCode % Colors.accents.length],
                value: entry.value,
                title: entry.key,
                radius: 150,
              );
            }).toList(),
          );

          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: small),

                  Text('Total Expense: \$${totalExpense.toStringAsFixed(2)}', style: p1),
                  SizedBox(height: medium),
                  SizedBox(
                    height: 300,
                    child: PieChart(pieChartData),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text("No data available."));
        }
      },
    );
  }
}