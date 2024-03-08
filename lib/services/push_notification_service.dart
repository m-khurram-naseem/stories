import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  static PushNotificationService? _instance;
  PushNotificationService._internal();
  factory PushNotificationService(){
    return _instance ??= PushNotificationService._internal();
  }
  subscribeToTopics(String topic){
    FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}