import 'package:awesome_notifications/awesome_notifications.dart';
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

  void popUpDialog() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Don\'t Allow',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ))),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text('Allow',
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )))
            ]),
      );
    });
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
        ElevatedButton(
          child: Text('Allow Notifications'),
          onPressed: popUpDialog,
        ),
        const ElevatedButton(
            onPressed: cancelScheduledNotifications,
            child: Text('Cancel Notifications')),
        ElevatedButton(onPressed: goToPortof, child: Text("Go")),
      ],
    ));
  }
}
