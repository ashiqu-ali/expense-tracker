import 'package:flutter/cupertino.dart';

import 'cardExpense.dart';
import 'cardIncome.dart';

class RecentTransaction extends StatelessWidget {
  final List<Map<dynamic, dynamic>> data;

  const RecentTransaction({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = data.length < 5 ? data.length : 5;

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