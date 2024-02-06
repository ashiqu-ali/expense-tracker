import 'package:expense_tracker/pages/addTransaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    tz.initializeTimeZones(); // Initialize timezone
    const InitializationSettings initializationSettingsAndroid =
        InitializationSettings(
            android: AndroidInitializationSettings("@drawable/ic_launcher"));
    _notificationsPlugin.initialize(
      initializationSettingsAndroid,
      onDidReceiveNotificationResponse: (details) async {
        if (details.input != null && details.payload == 'add_transaction') {
          // Handle notification interaction if needed
          // If the "Add Transaction" button is pressed, navigate to AddTransaction page
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTransaction(),
            ),
          );
        }
      },
    );
  }

  static void scheduleDailyNotification() async {
    await _notificationsPlugin.zonedSchedule(
      0, // ID for the notification
      'Reminder', // Title of the notification
      'Have you added your transaction today?', // Body of the notification
      _nextInstanceOf115PM(), // Scheduled date and time
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'Daily Notification', // Channel name
          'Reminds you to add your transaction daily', // Channel description
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(''),
          // Optional: add a button to the notification
          actions: [
            AndroidNotificationAction(
              'add_transaction',
              'Add Transaction',
            ),
          ],
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: 'add_transaction',
    );
  }

  static tz.TZDateTime _nextInstanceOf115PM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      13,
      15,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    print('Scheduled Date and Time: $scheduledDate');
    return scheduledDate;
  }
}
