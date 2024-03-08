import 'dart:convert';

import 'package:stories/models/message.dart';

class AppNotification {
  Message message;
  AppNotification({
    required this.message,
  });

  AppNotification copyWith({
    Message? message,
  }) {
    return AppNotification(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message.toMap(),
    };
  }

  factory AppNotification.fromMap(Map<String, dynamic> map) {
    return AppNotification(
      message: Message.fromMap(map['message'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppNotification.fromJson(String source) =>
      AppNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Notification(message: $message)';

  @override
  bool operator ==(covariant AppNotification other) {
    if (identical(this, other)) return true;

    return other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
