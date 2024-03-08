
import 'dart:convert';

class StoryCategory {
  String label;
  String value;
  bool isAllowed;
  StoryCategory({
    required this.label,
    required this.value,
    required this.isAllowed,
  });
  

  StoryCategory copyWith({
    String? label,
    String? value,
    bool? isAllowed,
  }) {
    return StoryCategory(
      label: label ?? this.label,
      value: value ?? this.value,
      isAllowed: isAllowed ?? this.isAllowed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'value': value,
      'isAllowed': isAllowed,
    };
  }

  factory StoryCategory.fromMap(Map<String, dynamic> map) {
    return StoryCategory(
      label: map['label'] as String,
      value: map['value'] as String,
      isAllowed: map['isAllowed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoryCategory.fromJson(String source) => StoryCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(label: $label, value: $value, isAllowed: $isAllowed)';

  @override
  bool operator ==(covariant StoryCategory other) {
    if (identical(this, other)) return true;
  
    return 
      other.label == label &&
      other.value == value &&
      other.isAllowed == isAllowed;
  }

  @override
  int get hashCode => label.hashCode ^ value.hashCode ^ isAllowed.hashCode;
}
