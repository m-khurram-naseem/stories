import 'dart:convert';

import 'package:stories/models/notification_android.dart';

class Android {
  bool directBootOk;
  NotificationAndroid notification;
  Android({
    required this.directBootOk,
    required this.notification,
  });

  Android copyWith({
    bool? directBootOk,
    NotificationAndroid? notification,
  }) {
    return Android(
      directBootOk: directBootOk ?? this.directBootOk,
      notification: notification ?? this.notification,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'direct_boot_ok': directBootOk,
      'notification': notification.toMap(),
    };
  }

  factory Android.fromMap(Map<String, dynamic> map) {
    return Android(
      directBootOk: map['direct_boot_ok'] as bool,
      notification: NotificationAndroid.fromMap(map['notification'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Android.fromJson(String source) => Android.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Android(directBootOk: $directBootOk, notification: $notification)';

  @override
  bool operator ==(covariant Android other) {
    if (identical(this, other)) return true;
  
    return 
      other.directBootOk == directBootOk &&
      other.notification == notification;
  }

  @override
  int get hashCode => directBootOk.hashCode ^ notification.hashCode;
}
