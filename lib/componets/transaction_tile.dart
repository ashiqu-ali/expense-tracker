import 'package:flutter/cupertino.dart';

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
          Map<dynamic, dynamic> dataAtIndex = data[index];
          if (dataAtIndex['type'] == 'Income') {
            return CardIncome(
              type: dataAtIndex['type'],
              amount: dataAtIndex['amount'].toString(),
              note: dataAtIndex['note'],
              date: dataAtIndex['date'],
              category: dataAtIndex['category'],
            );
          } else {
            return CardExpense(
              type: dataAtIndex['type'],
              amount: dataAtIndex['amount'].toString(),
              note: dataAtIndex['note'],
              date: dataAtIndex['date'],
              category: dataAtIndex['category'],
            );
          }
        },
      ),
    );
  }
}