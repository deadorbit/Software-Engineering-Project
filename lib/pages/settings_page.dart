import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering_project/service/notification_service.dart';

import '../components/notification_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int interval = 0;

  @override
  void initState() {
    super.initState();

    print("in init state about to get interval");
    interval = _getInterval();
    // _getSchedules();

    Future<List<NotificationModel>> schedule = getSchedule();
    print("schedule");
    print(schedule);
  }

  Future<List<NotificationModel>> getSchedule() async {
    return await AwesomeNotifications().listScheduledNotifications();
  }

  // Future<void> _getSchedules() async {
  //   List list =
  //       await AwesomeNotifications().getAllActiveNotificationIdsOnStatusBar();

  //   print(list);
  // }

  void goToPortof() {
    Navigator.pushNamed(context, '/portfolio');
  }

//im getting the interval on when I should schedule the notifications. Let's see how to implement it
  int _getInterval() {
    final time = DateTime.now();

    print(time);
    print(time.hour);

    int currentHour = time.hour;
    int interval2 = 0;

    if (currentHour <= 10) {
      //this is to schedule the ones in the morning.
      int hoursApart = 10 - currentHour;
      interval2 = (((hoursApart * 60) * 60) - (time.minute * 60)) - 300;
    } else if (currentHour <= 17) {
      int hoursApart = 17 - currentHour;

      interval2 = (((hoursApart * 60) * 60) - (time.minute * 60)) - 300;
    } else {
      int hoursApart = currentHour - 10;
      interval2 = (((hoursApart * 60) * 60) - (time.minute * 60)) - 300;
    }

    //here I think I can call two different functions? Schedule notifications.

    print(interval);

    interval2 = 600;

    return interval2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // ElevatedButton(onPressed: _getInterval, child: Text('press')),
        ElevatedButton(
            onPressed: () async {
              await AwesomeNotifications().cancelAllSchedules();
            },
            child: Text('cancel')),
        NotificationButton(
            text: 'Troubleshoot Notifications',
            onPressed: () async {
              await NotificationService.showNotification(
                title: 'This is a tester notification',
                body:
                    'When you receive notifications from our app, they will look like this',
              );
            }),
        NotificationButton(
            text: 'Scheduled Notification',
            onPressed: () async {
              await NotificationService.showNotification(
                  title: 'Scheduled Notification',
                  body: 'this notitification has been scheduled ahead of time',
                  scheduled: true,
                  interval: interval);
            }),
        ElevatedButton(onPressed: goToPortof, child: Text("Go")),
      ],
    ));
  }
}
