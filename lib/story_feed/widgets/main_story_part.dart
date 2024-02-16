import 'package:flutter/material.dart';
import 'package:stories/story_feed/model/story.dart';
import 'package:stories/story_feed/widgets/story_related_widgets.dart';

class MainStoryPart extends StatelessWidget {
  static const _imageFlex = 33 , _titleFlex = 15 , _descriptionFlex = 31 , _btnDetailFlex = 10;
  static const _imageBottomFlex = 3 , _titleBottomFlex = 2 , _descriptionBottomFlex = 3 , _btnDetailBottomFlex = 3;
  final Story story;
  const MainStoryPart({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(10),
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
              child:StoryDescription(description: story.description,),
            ),
            const Spacer(
              flex: _descriptionBottomFlex,
            ),
            // Button to see more details of story
            Expanded(
              flex: _btnDetailFlex,
              child: StoryDetailButton(storyDetailUrl: story.storyDetailUrl,),
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
