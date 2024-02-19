// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:stories/models/story_notification.dart';

class Message {
  String token;
  StoryNotification notification;
  Message({
    required this.token,
    required this.notification,
  });

  Message copyWith({
    String? token,
    StoryNotification? notification,
  }) {
    return Message(
      token: token ?? this.token,
      notification: notification ?? this.notification,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'notification': notification.toMap(),
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      token: map['token'] as String,
      notification: StoryNotification.fromMap(map['notification'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Message(token: $token, notification: $notification)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;
  
    return 
      other.token == token &&
      other.notification == notification;
  }

  @override
  int get hashCode => token.hashCode ^ notification.hashCode;
}
