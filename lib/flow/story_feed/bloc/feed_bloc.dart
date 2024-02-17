import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/services/story_database.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/bloc/feed_states.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  late PageController pagesController;
  final StoryDb db = StoryDb();
  late int currentIndex = 0;

  FeedBloc() : super(InitialFeedState()) {
    pagesController = PageController(initialPage: 1);
    on<InitialFeedEvent>(_handleInitialEvent);
    on<LoadFeedEvent>(_fetchFeedStories);
    on<PageUpdatedEvent>((event, emit) {
      currentIndex = event.currentIndex;
    });
    on<LaunchUrlEvent>(_launchCurrentStoryUrl);
  }

  FutureOr<void> _handleInitialEvent(
      InitialFeedEvent event, Emitter<FeedState> emit) {
    emit(InitialFeedState());
  }

  FutureOr<void> _fetchFeedStories(
      LoadFeedEvent event, Emitter<FeedState> emit) async {
    try {
      emit(LoadingFeedState());
      List<Story> stories = await db.fetchStories(category: event.category);
      emit(LoadedFeedState(list: stories));
    } on FirebaseException catch (e) {
      emit(ErrorFeedState(message: 'Firebase:${e.toString()}'));
    } catch (e) {
      emit(ErrorFeedState(message: 'Other:${e.toString()}'));
    }
  }

  FutureOr<void> _launchCurrentStoryUrl(
      LaunchUrlEvent event, Emitter<FeedState> emit) async {
    await launchUrl(Uri.parse(storyList[currentIndex].storyDetailUrl))
        .then((value) {
      pagesController.jumpToPage(1);
    });
  }

  @override
  Future<void> close() {
    pagesController.dispose();
    return super.close();
  }
}
