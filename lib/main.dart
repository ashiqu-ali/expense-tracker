import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:expense_tracker/pages/main_page.dart';  // Importing MainPage
import 'package:expense_tracker/services/reminderService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('money');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalNotificationService.initialize(context);
    LocalNotificationService.scheduleDailyNotification();

    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GoogleFonts.poppins',
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}