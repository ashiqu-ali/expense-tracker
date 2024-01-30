import 'package:flutter/material.dart';
import 'package:expense_tracker/controller/db_helper.dart'; // Import your DbHelper class

class DeleteHive extends StatelessWidget {
  final DbHelper dbHelper = DbHelper(); // Create an instance of DbHelper

  DeleteHive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Database Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Call the function to delete all records
            deleteAllRecords(context);
          },
          child: Text('Delete All Records'),
        ),
      ),
    );
  }

  // Function to delete all records from the database
  void deleteAllRecords(BuildContext context) async {
    // Call the deleteAllData method from the DbHelper class
    await dbHelper.deleteAllData();

    // Show a message indicating successful deletion
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('All records deleted successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
