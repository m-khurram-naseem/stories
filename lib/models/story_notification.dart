// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoryNotification {
  String title;
  String body;
  String image;
  StoryNotification({
    required this.title,
    required this.body,
    required this.image,
  });

  StoryNotification copyWith({
    String? title,
    String? body,
    String? image,
  }) {
    return StoryNotification(
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,
      'image': image,
    };
  }

  factory StoryNotification.fromMap(Map<String, dynamic> map) {
    return StoryNotification(
      title: map['title'] as String,
      body: map['body'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryNotification.fromJson(String source) => StoryNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoryNotification(title: $title, body: $body, image: $image)';

  @override
  bool operator ==(covariant StoryNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body &&
      other.image == image;
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode ^ image.hashCode;
}
