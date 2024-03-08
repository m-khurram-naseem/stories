import 'package:flutter/foundation.dart';
import 'package:stories/flow/story_feed/model/story.dart';

@immutable
abstract class FeedState{
  const FeedState();
}

@immutable
class InitialFeedState extends FeedState{}

@immutable
class LoadingFeedState extends FeedState{}

@immutable
class LoadedFeedState extends FeedState{
  final List<Story> list;
  const LoadedFeedState({required this.list});
}

@immutable
class ErrorFeedState extends FeedState{
  final String message;
  const ErrorFeedState({required this.message});
}

@immutable
class NoInternetState extends FeedState{}

@immutable
class NewStoriesState extends FeedState{}
