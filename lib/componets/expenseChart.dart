import 'package:expense_tracker/controller/db_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpenseChart extends StatefulWidget {
  const ExpenseChart({super.key});

  @override
  State<ExpenseChart> createState() => _ExpenseChartState();
}

class _ExpenseChartState extends State<ExpenseChart> {

  DbHelper dbhelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Expense'),
    );
  }
}