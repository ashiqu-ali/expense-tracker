import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker/controller/db_helper.dart';

class IncomeChart extends StatefulWidget {
  const IncomeChart({Key? key}) : super(key: key);

  @override
  State<IncomeChart> createState() => _IncomeChartState();
}

class _IncomeChartState extends State<IncomeChart> {
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
          // Filter income data
          List<Map<dynamic, dynamic>> incomeData = snapshot.data!
              .where((entry) => entry['type'] == 'Income')
              .toList();

          // Group income data by category
          Map<String, double> categoryTotals = {};
          for (var entry in incomeData) {
            String category = entry['category'];
            double amount = entry['amount'].toDouble();
            categoryTotals[category] = (categoryTotals[category] ?? 0) + amount;
          }

          double totalIncome =
              categoryTotals.values.fold(0, (sum, amount) => sum + amount);

          // Create PieChartData
          PieChartData pieChartData = PieChartData(
            sections: categoryTotals.entries.map((entry) {
              return PieChartSectionData(
                color:
                    Colors.accents[entry.key.hashCode % Colors.accents.length],
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
                  Text('Total Income: \$${totalIncome?.toStringAsFixed(2)}',
                      style: p1),
                  SizedBox(height: medium),
                  Container(
                    height: 300, // Set a fixed height for the PieChart
                    child: PieChart(pieChartData),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text("No income data available."));
        }
      },
    );
  }
}
