import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';

class StoryImage extends StatelessWidget {
  static const _borderRadius = 30.0;
  final String imageUrl;
  const StoryImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (frame != null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(color: Colors.white),
          );
        },
        errorBuilder: (context, error, stackTrace) => const Placeholder(),
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class StoryTitle extends StatelessWidget {
  static const _maxLines = 3;
  static const _fontSizePercent = 0.06;
  final String title;
  const StoryTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: _maxLines,
      style: TextStyle(
        fontSize: width * _fontSizePercent,
      ),
    );
  }
}

class StoryDescription extends StatelessWidget {
  static const _fontSizePercent = 0.04, _padding = 10.0;
  final String description;
  const StoryDescription({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(left: _padding, right: _padding),
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: width * _fontSizePercent,
        ),
      ),
    );
  }
}

class StoryDetailButton extends StatelessWidget {
  static const _borderRadius = 10.0, _fontSizePercent = 0.04;
  static const _btnWidthPercent = 0.95;
  static const _circleStartPercent = 0.9,
      _circleTopPercent = 0.25,
      _circleWidthPercent = 0.1,
      _circleHeightPercent = 0.5;
  static const _text = 'Tap here for more details / swipe left';
  final String storyDetailUrl;
  const StoryDetailButton({
    super.key,
    required this.storyDetailUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        bloc.add(LaunchUrlEvent());
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              width: constraints.maxWidth * _btnWidthPercent,
              height: constraints.maxHeight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width * _fontSizePercent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: constraints.maxWidth * _circleStartPercent,
              top: constraints.maxHeight * _circleTopPercent,
              width: constraints.maxWidth * _circleWidthPercent,
              height: constraints.maxHeight * _circleHeightPercent,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        );
      }),
    );
  }
}
