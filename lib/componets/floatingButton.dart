import 'package:flutter/material.dart';
import 'package:expense_tracker/pages/addTransaction.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddTransaction()));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: const Icon(Icons.add),
    );
  }
}
