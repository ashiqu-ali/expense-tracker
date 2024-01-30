import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/style.dart';

class CardIncome extends StatelessWidget {
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final String type;
  final String amount;
  final String note;
  final DateTime date;
  final String category;
  CardIncome({
    required this.type,
    required this.amount,
    required this.note,
    required this.date,
    required this.category,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(small),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xffced4eb),
          borderRadius: BorderRadius.circular(xsmall),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${date.day}-${months[date.month-1]}',style: p1),
                  Column(
                    children: [
                      Text(note,style: p2),
                      Text(category,style: p3),
                    ],
                  ),
                  Text(amount,style: GoogleFonts.poppins(color: Colors.blue, fontSize: 18,fontWeight: FontWeight.w500)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
