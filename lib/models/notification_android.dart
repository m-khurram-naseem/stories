import 'dart:convert';

class NotificationAndroid {
  String image;
  NotificationAndroid({
    required this.image,
  });

  NotificationAndroid copyWith({
    String? image,
  }) {
    return NotificationAndroid(
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
    };
  }

  factory NotificationAndroid.fromMap(Map<String, dynamic> map) {
    return NotificationAndroid(
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationAndroid.fromJson(String source) => NotificationAndroid.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NotificationAndroid(image: $image)';

  @override
  bool operator ==(covariant NotificationAndroid other) {
    if (identical(this, other)) return true;
  
    return 
      other.image == image;
  }

  @override
  int get hashCode => image.hashCode;
}
