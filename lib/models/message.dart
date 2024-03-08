import 'dart:convert';

import 'package:stories/models/android.dart';
import 'package:stories/models/story_notification.dart';

class Message {
  String topic;
  StoryNotification notification;
  Android android;
  Message({
    required this.topic,
    required this.notification,
    required this.android,
  });

  Message copyWith({
    String? topic,
    StoryNotification? notification,
    Android? android,
  }) {
    return Message(
      topic: topic ?? this.topic,
      notification: notification ?? this.notification,
      android: android ?? this.android,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
      'notification': notification.toMap(),
      'android' : android.toMap(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      topic: map['topic'] as String,
      notification: StoryNotification.fromMap(
          map['notification'] as Map<String, dynamic>),
      android: Android.fromMap(map['android'] as Map<String , dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Message(topic: $topic, notification: $notification, android: $android)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.topic == topic && other.notification == notification && other.android == android;
  }

  @override
  int get hashCode => topic.hashCode ^ notification.hashCode ^ android.hashCode;
}
