import 'dart:convert';

class StoryNotification {
  String title;
  String body;  
  StoryNotification({
    required this.title,
    required this.body,    
  });

  StoryNotification copyWith({
    String? title,
    String? body,    
  }) {
    return StoryNotification(
      title: title ?? this.title,
      body: body ?? this.body,      
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'body': body,      
    };
  }

  factory StoryNotification.fromMap(Map<String, dynamic> map) {
    return StoryNotification(
      title: map['title'] as String,
      body: map['body'] as String,      
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryNotification.fromJson(String source) => StoryNotification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoryNotification(title: $title, body: $body)';

  @override
  bool operator ==(covariant StoryNotification other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.body == body;      
  }

  @override
  int get hashCode => title.hashCode ^ body.hashCode;
}
