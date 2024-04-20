import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:software_engineering_project/service/controller.dart';
import 'package:software_engineering_project/service/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String userId = "";
  bool _notificationsAllowed = false;
  final db = DataBase_Controller();
  String userName = "";

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        userId = user.uid; // Assign userId if user is logged in
      });
    }
    getUsers(); // Invoke getUsers here or wherever it makes sense after userId is set
  }

  // Future<List<NotificationModel>> getSchedule() async {
  //   return await AwesomeNotifications().listScheduledNotifications();
  // }

  Future<void> _toggleNotificationPermission(bool allow) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_allowed', allow);
    setState(() {
      _notificationsAllowed = allow;
    });
  }

  void _showNotificationPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Allow Notifications"),
          content: const Text("Our app would like to send you notifications"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _toggleNotificationPermission(false);
                Navigator.pop(context);
              },
              child: const Text('Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  )),
            ),
            TextButton(
              onPressed: () async {
                _toggleNotificationPermission(true);
                AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) {
                  Navigator.pop(context);
                  NotificationService.initializeNotification();
                  _createAutomaticSchedule();
                  // _createAutomaticFourPmSchedule();
                });
              },
              child: const Text('Allow',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            )
          ],
        );
      },
    );
  }

  Future<void> _createAutomaticSchedule() async {
    String title = "";
    String body = "";
    if (DateTime.now().hour < 10) {
      title = "The stock market is about to open!";
      body = "Here is placeholder text. This one should show up before 10 am";
    } else {
      title = "The stock market is about to close!";
      body = "Here is placeholder text. This one should show up before 5 pm";
    }
    await NotificationService.showNotification(
      title: title,
      body: body,
      scheduled: true,
      interval: _getInterval(),
    );
  }

  // Future<void> _createAutomaticFourPmSchedule() async {
  //   await NotificationService.showNotification(
  //     title: 'This is the PM one',
  //     body: "The market is about to close, come check it out",
  //     scheduled: true,
  //     interval: _getNightInterval(),
  //   );
  // }

  void goToPortof() {
    Navigator.pushNamed(context, '/portfolio');
  }

  DateTime _getNextWeekdayTime(DateTime now, int hour, int minute) {
    DateTime nextTime = DateTime(now.year, now.month, now.day, hour, minute);
    while (nextTime.weekday == 6 || nextTime.weekday == 7) {
      nextTime = nextTime.add(Duration(days: 1));
    }
    return nextTime;
  }

//im getting the interval on when I should schedule the notifications. Let's see how to implement it
  int _getInterval() {
    int interval2 = 0;
    final time = DateTime.now();

    if (time.hour < 9) {
      final nextDayTime = _getNextWeekdayTime(time, 9, 50);
      interval2 = nextDayTime.difference(time).inSeconds;
    } else {
      final nextAfternoonTime = _getNextWeekdayTime(time, 4, 20);
      interval2 = nextAfternoonTime.difference(time).inSeconds;
    }

    return interval2;
  }

  // int _getNightInterval() {
  //   int nightInterval = 0;

  //   Random random = Random();
  //   nightInterval = random.nextInt(200) + 60;

  //   debugPrint("nightInvertal $nightInterval");
  //   return nightInterval;
  // }

  void getUsers() async {
    if (userId.isNotEmpty) {
      userName = await db.getUserName(userId);
      setState(() {
        // Update UI after fetching stocks
        userName = userName;
      });
    }
  }

  // void changeUserName() async {
  //   if (userId.isNotEmpty) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text("Settings",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(userName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
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
                        category: NotificationCategory.Status,
                      );
                    }),
                NotificationButton(
                    text: 'Scheduled Notification',
                    onPressed: () async {
                      await NotificationService.showNotification(
                          title: 'Scheduled Notification',
                          body:
                              'this notitification has been scheduled ahead of time',
                          scheduled: true,
                          interval: interval);
                    }),
                ElevatedButton(
                  onPressed: _showNotificationPermissionDialog,
                  child: Text("Allow Notifications"),
                ),
                ElevatedButton(onPressed: goToPortof, child: Text("Go")),
              ],
            )));
  }
}
