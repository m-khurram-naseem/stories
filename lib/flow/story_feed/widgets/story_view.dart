import 'package:flutter/material.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:stories/flow/story_feed/widgets/story_view_related_widgets.dart';

class StoryView extends StatelessWidget {
  static const _imageFlex = 33,
      _titleFlex = 12,
      _descriptionFlex = 34,
      _btnDetailFlex = 10;
  static const _imageBottomFlex = 3,
      _titleBottomFlex = 2,
      _descriptionBottomFlex = 3,
      _btnDetailBottomFlex = 3;
  static const _padding = 10.0;
  final Story story;
  const StoryView({
    super.key,
    required this.story,
  });
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(_padding),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            // Story Image fetched from Network
            Expanded(
              flex: _imageFlex,
              child: StoryImage(imageUrl: story.imageUrl),
            ),
            const Spacer(
              flex: _imageBottomFlex,
            ),
            // Story Title Text
            Expanded(
              flex: _titleFlex,
              child: StoryTitle(title: story.title),
            ),
            const Spacer(
              flex: _titleBottomFlex,
            ),
            // Story Description Text
            Expanded(
              flex: _descriptionFlex,
              child: StoryDescription(
                description: story.description,
                storyBy: story.storyBy,
              ),
            ),
            const Spacer(
              flex: _descriptionBottomFlex,
            ),
            // Button to see more details of story
            Expanded(
              flex: _btnDetailFlex,
              child: StoryDetailButton(
                storyDetailUrl: story.storyDetailUrl,
              ),
            ),
            const Spacer(
              flex: _btnDetailBottomFlex,
            ),
          ],
        ),
      ),
    );
  }
}
