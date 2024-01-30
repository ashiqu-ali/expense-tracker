import 'package:expense_tracker/componets/totalExpense.dart';
import 'package:expense_tracker/componets/totalIncome.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/utils/style.dart';
import 'package:expense_tracker/pages/main_page.dart';

import '../controller/db_helper.dart';

class TotalBalance extends StatelessWidget {

  int totalBalance = 0;
  int totalIncome = 0;
  int totalExpense = 0;

  TotalBalance({
    required this.totalBalance,
    required this.totalIncome,
    required this.totalExpense,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.all(small),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [
                  heading,
                  accent
                ]
            ),
            borderRadius: BorderRadius.all(Radius.circular(medium))
        ),
        padding: EdgeInsets.symmetric(
            vertical: small,
            horizontal: xsmall
        ),
        child: Column(
          children: [
            Text(
              'Total Balance',
              textAlign: TextAlign.center,
              style: heading3,
            ),
            SizedBox(height: small),
            Text(
              'Rs $totalBalance',
              textAlign: TextAlign.center,
              style: heading3,
            ),
            SizedBox(height: medium),
            Padding(
              padding: EdgeInsets.all(small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TotalIncome(value: totalIncome.toString()),
                  TotalExpense(value: totalExpense.toString())
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
