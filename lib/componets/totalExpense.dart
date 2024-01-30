import 'package:flutter/material.dart';

import '../utils/style.dart';

class TotalExpense extends StatelessWidget {
  String value;
  TotalExpense({
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(medium)
          ),
          padding: EdgeInsets.all(xsmall),
          child: Icon(
            Icons.arrow_upward,
            size: medium,
            color: Colors.red[700],
          ),
        ),
        SizedBox(width: xsmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Expense',
              style: heading4,
            ),
            Text(
              value,
              style: heading4,
            )
          ],
        )
      ],
    );
  }
}
