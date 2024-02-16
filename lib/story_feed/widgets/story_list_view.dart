import 'package:flutter/material.dart';
import 'package:stories/story_feed/model/story.dart';
import 'package:stories/story_feed/widgets/story_view.dart';

class StoryListView extends StatelessWidget {
  final List<Story> storyList;
  const StoryListView({
    super.key,
    required this.storyList,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: storyList.length,
      itemBuilder: (context, index) => StoryView(
        story: storyList[index],
      ),
    );
  }
}
