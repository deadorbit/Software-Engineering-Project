import 'package:flutter/material.dart';
import '../notifications.dart';
import '../utilities.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            child: Text('Cancel Notifications'))
      ],
    ));
  }
}
