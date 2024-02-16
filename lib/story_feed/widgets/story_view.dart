import 'package:flutter/material.dart';
import 'package:stories/story_feed/model/story.dart';
import 'package:stories/story_feed/widgets/main_story_part.dart';

class StoryView extends StatelessWidget {
  final Story story;
  const StoryView({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return MainStoryPart(story: story);
  }
}
