import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/util/app_constants/font_family.dart';
import 'package:stories/util/app_constants/image_assets.dart';
import 'package:stories/util/theme/color_scheme.dart';

class StoryImage extends StatelessWidget {
  static const _borderRadius = 30.0, _sigmaX = 15.0, _sigmaY = 15.0;
  final String imageUrl;
  const StoryImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    CachedNetworkImage(imageUrl: imageUrl);
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
          ),
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: _sigmaX,
                sigmaY: _sigmaY,
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageAssets.noInternetImage,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          Positioned(
            child: Image.network(
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame != null) return child;
                return Shimmer.fromColors(
                  baseColor: AppColorScheme.shimmerBaseColor,
                  highlightColor: AppColorScheme.shimmerHighlightColor,
                  child: Container(
                    color: AppColorScheme.primary,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImageAssets.noInternetImage,
                fit: BoxFit.cover,
              ),
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ],
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
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      maxLines: _maxLines,
      style: TextStyle(
        fontFamily: FontFamily.tinos,
        fontSize: width * _fontSizePercent,
      ),
    );
  }
}

class StoryDescription extends StatelessWidget {
  static const _fontSizePercent = 0.045, _padding = 10.0, _maxLines = 10;
  final String description, storyBy;
  const StoryDescription({
    super.key,
    required this.description,
    required this.storyBy,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.only(left: _padding, right: _padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            maxLines: _maxLines,
            style: TextStyle(
              fontSize: width * _fontSizePercent,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Credit : $storyBy',
              textAlign: TextAlign.start,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: FontFamily.ebGarmod,
                overflow: TextOverflow.ellipsis,
                fontSize: width * _fontSizePercent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
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
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned(
            width: constraints.maxWidth * _btnWidthPercent,
            height: constraints.maxHeight,
            child: InkWell(
              onTap: () {
                bloc.add(LaunchUrlEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColorScheme.shadowColor,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _text,
                      style: TextStyle(
                        color: AppColorScheme.primary,
                        fontSize: width * _fontSizePercent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: constraints.maxWidth * _circleStartPercent,
            top: constraints.maxHeight * _circleTopPercent,
            width: constraints.maxWidth * _circleWidthPercent,
            height: constraints.maxHeight * _circleHeightPercent,
            child: InkWell(
              onTap: () {
                bloc.add(ShareStoryEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColorScheme.onPrimary,
                  ),
                  color: AppColorScheme.primary,
                ),
                child: const Icon(Icons.share),
              ),
            ),
          )
        ],
      );
    });
  }
}
