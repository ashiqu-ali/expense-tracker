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
      child: const Icon(Icons.add),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
    );
  }
}
