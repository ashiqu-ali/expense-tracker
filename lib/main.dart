import 'package:expense_tracker/pages/demoPage.dart';
import 'package:expense_tracker/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

main() async{
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
