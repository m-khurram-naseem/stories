import 'dart:convert';

class Story {
  // Static constants to remove redundancy
  static const storyIdKey = 'storyId',
      titleKey = 'title',
      descriptionKey = 'description',
      imageUrlKey = 'imageUrl',
      storyDetailUrlKey = 'storyDetailUrl',
      categoryKey = 'category',
      dateTimeKey = 'dateTime',
      storyByKey = 'storyBy';

  // Instance Variables
  int storyId;
  String title;
  String description;
  String imageUrl;
  String storyDetailUrl;
  String category;
  DateTime dateTime;
  String storyBy;
  Story({
    required this.storyId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.storyDetailUrl,
    required this.category,
    required this.dateTime,
    required this.storyBy,
  });

  Story copyWith({
    int? storyId,
    String? title,
    String? description,
    String? imageUrl,
    String? storyDetailUrl,
    String? category,
    DateTime? dateTime,
    String? storyBy,
  }) {
    return Story(
      storyId: storyId ?? this.storyId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      storyDetailUrl: storyDetailUrl ?? this.storyDetailUrl,
      category: category ?? this.category,
      dateTime: dateTime ?? this.dateTime,
      storyBy: storyBy ?? this.storyBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      storyIdKey: storyId,
      titleKey: title,
      descriptionKey: description,
      imageUrlKey: imageUrl,
      storyDetailUrlKey: storyDetailUrl,
      categoryKey: category,
      dateTimeKey: dateTime.millisecondsSinceEpoch,
      storyByKey: storyBy,
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      storyId: map[storyIdKey] as int,
      title: map[titleKey] as String,
      description: map[descriptionKey] as String,
      imageUrl: map[imageUrlKey] as String,
      storyDetailUrl: map[storyDetailUrlKey] as String,
      category: map[categoryKey] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map[dateTimeKey] as int),
      storyBy: map[storyByKey] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) =>
      Story.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Story(storyId: $storyId, title: $title, description: $description, imageUrl: $imageUrl, storyDetailUrl: $storyDetailUrl, category: $category, dateTime: $dateTime, storyBy: $storyBy)';
  }

  @override
  bool operator ==(covariant Story other) {
    if (identical(this, other)) return true;

    return other.storyId == storyId &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.storyDetailUrl == storyDetailUrl &&
        other.category == category &&
        other.dateTime == dateTime &&
        other.storyBy == storyBy;
  }

  @override
  int get hashCode {
    return storyId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        storyDetailUrl.hashCode ^
        category.hashCode ^
        dateTime.hashCode ^
        storyBy.hashCode;
  }
}
