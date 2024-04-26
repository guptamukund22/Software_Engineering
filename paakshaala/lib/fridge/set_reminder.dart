import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future setreminder() async {
  tz.initializeTimeZones();

  var androidinitialize =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  var ios = const DarwinInitializationSettings();
  var initializeSettings =
      InitializationSettings(android: androidinitialize, iOS: ios);
  FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();
  if (await Permission.scheduleExactAlarm.isGranted) {
    print("object");
    notification.initialize(initializeSettings);
    print("hi");

    var AndroidDetails = const AndroidNotificationChannel(
        "CHANNEL ID", "PAAKSHALA",
        importance: Importance.max);
    print("hello");
    var Ios = DarwinNotificationDetails();
    var General = NotificationDetails(
      android:
          AndroidNotificationDetails(AndroidDetails.id, AndroidDetails.name),
      iOS: Ios,
    );
    print("he");

    await notification.zonedSchedule(
      0,
      "Hello",
      "Test Notification",
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
      General,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
