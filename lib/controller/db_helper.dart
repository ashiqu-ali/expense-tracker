import 'package:hive/hive.dart';

class DbHelper {
  late Box box;

  DbHelper() {
    openBox();
  }

  openBox() {
    box = Hive.box('money');
  }

  Future addData(int amount, DateTime date, String category, String note, String type) async {
    var value = {
      'amount': amount,
      'date': date,
      'category': category,
      'note': note,
      'type': type
    };
    var allData = box.values.toList();
    allData.add(value);

    // Sort the data by date in descending order
    allData.sort((a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime));

    // Clear existing data in the box
    await box.clear();

    // Add sorted data back to the box
    await box.addAll(allData);
  }

  Future<List<Map<dynamic, dynamic>>> fetch() async {
    if (box.isEmpty) {
      return [];
    } else {
      // Fetch data and sort it by date in descending order
      var sortedData = box.values.toList();
      sortedData.sort((a, b) => (b['date'] as DateTime).compareTo(a['date'] as DateTime));
      return sortedData.cast<Map<dynamic, dynamic>>();
    }
  }

  Future<void> deleteAllData() async {
    await box.clear();
  }
}
