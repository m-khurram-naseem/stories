import 'package:stories/models/story_category.dart';

class StoryCategories{
  static Map<StoryCategoryName, StoryCategory> categories = {
  StoryCategoryName.technology:
      StoryCategory(value: 'technology', label: 'Technology', isAllowed: false),
  StoryCategoryName.politics:
      StoryCategory(value: 'politics', label: 'Politics', isAllowed: false),
  StoryCategoryName.entertainment: StoryCategory(
      value: 'entertainment', label: 'Entertainment', isAllowed: false),
  StoryCategoryName.sports:
      StoryCategory(value: 'sports', label: 'Sports', isAllowed: false),
  StoryCategoryName.religious:
      StoryCategory(value: 'religious', label: 'Religious', isAllowed: false),
  StoryCategoryName.international: StoryCategory(
      value: 'international', label: 'International', isAllowed: false),
  StoryCategoryName.startups:
      StoryCategory(value: 'startups', label: 'Startups', isAllowed: false),
  StoryCategoryName.education:
      StoryCategory(value: 'education', label: 'Education', isAllowed: false),
};
}

enum StoryCategoryName {
  technology,
  politics,
  entertainment,
  sports,
  religious,
  international,
  startups,
  education,
}
