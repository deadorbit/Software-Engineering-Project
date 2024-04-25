import 'package:flutter/material.dart';
import '../notifications.dart';
import '../utilities.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void goToPortof() {
    Navigator.pushNamed(context, '/portfolio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const ElevatedButton(
          onPressed: createReminderNotification,
          child: Text('Press Me'),
        ),
        ElevatedButton(
            child: const Text('schedule notifications'),
            onPressed: () async {
              NotificationWeekAndTime? pickedSchedule =
                  await pickSchedule(context);

              if (pickedSchedule != null) {
                createScheduledNotification(pickedSchedule);
              }
            }),
        const ElevatedButton(
            onPressed: cancelScheduledNotifications,
            child: Text('Cancel Notifications')),
        ElevatedButton(onPressed: goToPortof, child: Text("Go")),
      ],
    ));
  }
}
