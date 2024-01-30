import 'package:flutter/cupertino.dart';

import 'cardExpense.dart';
import 'cardIncome.dart';

class Transaction extends StatelessWidget {
  final int length;
  final Map data;

  Transaction({
    required this.length,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Check if there are any transactions
    if (length == 0) {
      // Display center text if no recent transactions
      return Center(
        child: Text("No recent transactions"),
      );
    }

    // Calculate the number of items to be displayed (maximum 5)
    int itemCount = length > 5 ? 5 : length;

    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          // Calculate the actual index based on the length and itemCount
          int actualIndex = length - itemCount + index;
          Map dataAtIndex = data![actualIndex];
          if (dataAtIndex['type'] == 'Income') {
            return CardIncome(
                type: dataAtIndex['type'],
                amount: dataAtIndex['amount'].toString(),
                note: dataAtIndex['note'],
                date: dataAtIndex['date'],
                category: dataAtIndex['category']);
          } else {
            return CardExpense(
                type: dataAtIndex['type'],
                amount: dataAtIndex['amount'].toString(),
                note: dataAtIndex['note'],
                date: dataAtIndex['date'],
                category: dataAtIndex['category']);
          }
        },
      ),
    );
  }
}