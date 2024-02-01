import 'package:expense_tracker/componets/floatingButton.dart';
import 'package:expense_tracker/componets/heading.dart';
import 'package:expense_tracker/pages/demoPage.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/profile_page.dart';
import 'package:expense_tracker/pages/summary_page.dart';
import 'package:expense_tracker/pages/transaction_page.dart';
import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/services/reminderService.dart'; // Import the notification service

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  // Initialize the notification service
  @override
  void initState() {
    super.initState();
    LocalNotificationService.initialize(context);
    LocalNotificationService.scheduleDailyNotification();
  }

  Widget buildTabContent(int index) {
    switch (index) {
      case 0:
      // Assuming you want to trigger the notification on the HomePage
      // Adjust this part based on the screen where you want the notification
        LocalNotificationService.scheduleDailyNotification();
        return const HomePage();
      case 1:
        return const SummaryChart();
      case 2:
        return TransactionPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: buildTabContent(_currentIndex),
        floatingActionButton: const FloatingButton(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: secondaryDark,
          unselectedItemColor: fontLight,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/home.png"), label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/chart-vertical.png"),
                label: 'Stat'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/wallet.png"),
                label: 'Transaction'),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/user.png"), label: 'Account')
          ],
        ));
  }
}
