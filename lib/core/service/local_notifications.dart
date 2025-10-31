import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moodly_j/l10n/app_localizations.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  //! => Initialization
  static Future<void> init() async {
    // طلب صلاحيات Android
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo')); // غيّر حسب منطقتك
  }

  static Future<void> onTap(NotificationResponse response) async {
    //!  print("Notification tapped: ${response.payload}");
  }

  //! ===>>>
  static NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      "basic_channel",
      "Basic Notifications",
      channelDescription: "This channel is for basic notifications",
      importance: Importance.max,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  );

  //! Scheduled Notification
  static Future<void> showScheduledNotification({
    required String title,
    required String description,
  }) async {
    final scheduledDate = tz.TZDateTime(
      tz.local,
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      20,
      0,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      title,
      description,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // مهم
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  //! Cancel Notification by ID
  static Future<void> cancel(_) async {
    await _flutterLocalNotificationsPlugin.cancel(1);
  }
}
