import 'package:expense_tracker/componets/expenseChart.dart';
import 'package:expense_tracker/componets/incomeChart.dart';
import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';

class SummaryChart extends StatefulWidget {
  const SummaryChart({Key? key}) : super(key: key);

  @override
  State<SummaryChart> createState() => _SummaryChartState();
}

class _SummaryChartState extends State<SummaryChart> {
  String? type;

  @override
  void initState() {
    super.initState();
    type = 'Income';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Summary', style: heading1),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Income';
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Income',
                        style: heading2,
                      ),
                      if (type == 'Income')
                        const Divider(
                          color: Colors.blue,
                          thickness: 4,
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      type = 'Expense';
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Expense',
                        style: heading2,
                      ),
                      if (type == 'Expense')
                        const Divider(
                          color: Colors.blue,
                          thickness: 4.0,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                if (type == 'Income') IncomeChart(),
                if (type == 'Expense') ExpenseChart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
