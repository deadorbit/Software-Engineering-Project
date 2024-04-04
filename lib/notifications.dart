import 'package:awesome_notifications/awesome_notifications.dart';
import './utilities.dart';

Future<void> createReminderNotification() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: createUniqueId(),
    channelKey: 'basic_channel',
    title:
        '${Emojis.money_money_bag + Emojis.time_eight_o_clock} Time to Trade!',
    body: 'The stock market is running and ready for you to conquer',
  ));
}

Future<void> createScheduledNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: '${Emojis.smile_money_mouth_face} Time to check on your stocks!',
        body: 'Come check on your profits of the day',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ));
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
