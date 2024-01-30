import 'package:flutter/material.dart';

import '../utils/style.dart';

class TotalIncome extends StatelessWidget {
  String value;
  TotalIncome({
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
            Icons.arrow_downward,
            size: medium,
            color: Colors.green[700],
          ),
        ),
        SizedBox(width: xsmall),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Income',
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
