import 'package:flutter/material.dart';
import '../pages/editTransaction.dart';
import 'cardExpense.dart';
import 'cardIncome.dart';

class Transaction extends StatelessWidget {
  final int length;
  final List<Map<dynamic, dynamic>> data;

  Transaction({
    required this.length,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Map<dynamic, dynamic> dataIndex = data[index];
          Map<String, dynamic> dataAtIndex = dataIndex.map((key, value) => MapEntry(key.toString(), value));
          if (dataAtIndex['type'] == 'Income') {
            return GestureDetector(
              onTap: () {
                // Navigate to EditTransaction with the editData parameter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTransaction(
                      editData: dataAtIndex, index: index,
                    ),
                  ),
                );
              },
              child: CardIncome(
                type: dataAtIndex['type'],
                amount: dataAtIndex['amount'].toString(),
                note: dataAtIndex['note'],
                date: dataAtIndex['date'],
                category: dataAtIndex['category'],
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                // Navigate to EditTransaction with the editData parameter
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTransaction(
                      editData: dataAtIndex, index: index,
                    ),
                  ),
                );
              },
              child: CardExpense(
                type: dataAtIndex['type'],
                amount: dataAtIndex['amount'].toString(),
                note: dataAtIndex['note'],
                date: dataAtIndex['date'],
                category: dataAtIndex['category'],
              ),
            );
          }
        },
      ),
    );
  }
}