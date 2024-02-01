import 'package:flutter/material.dart';
import '../pages/editTransaction.dart';
import 'cardExpense.dart';
import 'cardIncome.dart';

class RecentTransaction extends StatelessWidget {
  final List<Map<dynamic, dynamic>> data;

  const RecentTransaction({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int length = data.length < 5 ? data.length : 5;

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
                print(data);
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
