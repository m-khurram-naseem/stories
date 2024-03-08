import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static LocalNotificationService? _instance;
  LocalNotificationService._insternal();
  factory LocalNotificationService() {
    return _instance ??= LocalNotificationService._insternal();
  }

  requestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  initialize() {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
