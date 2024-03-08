import 'package:flutter/foundation.dart';

@immutable
abstract class FeedEvent{
  const FeedEvent();
}

@immutable
class InitialFeedEvent extends FeedEvent{}

@immutable
class LoadFeedEvent extends FeedEvent{
  final String category;
  const LoadFeedEvent({this.category = ''});
}

@immutable
class LaunchUrlEvent extends FeedEvent{}

@immutable
class PageUpdatedEvent extends FeedEvent{
  final int currentIndex;
  const PageUpdatedEvent({required this.currentIndex,});
}

@immutable
class NewStoriesEvent extends FeedEvent{}

@immutable
class ShareStoryEvent extends FeedEvent{}