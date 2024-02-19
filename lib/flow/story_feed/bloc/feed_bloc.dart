import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/services/story_database.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/bloc/feed_states.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  late PageController horizontalPagesController;
  late PageController verticalPagesController;
  static const int animationDuration = 300, delayDuration = 500;
  final StoryDb db = StoryDb();
  List<Story> stories = storyList;
  late int currentIndex = 0;

  FeedBloc() : super(InitialFeedState()) {
    horizontalPagesController = PageController(initialPage: 1);
    verticalPagesController = PageController();
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
      if (horizontalPagesController.page != null) {
        horizontalPagesController.animateToPage(1,
            duration: const Duration(milliseconds: animationDuration),
            curve: Curves.easeIn);
      }
      stories = await db.fetchStories(category: event.category);
      emit(LoadedFeedState(list: stories));
    } on FirebaseException catch (e) {
      emit(ErrorFeedState(message: 'Firebase:${e.toString()}'));
    } catch (e) {
      emit(ErrorFeedState(message: 'Other:${e.toString()}'));
    }
  }

  FutureOr<void> _launchCurrentStoryUrl(
      LaunchUrlEvent event, Emitter<FeedState> emit) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      await launchUrl(Uri.parse(stories[currentIndex].storyDetailUrl))
          .then((value) async {
        await Future.delayed(const Duration(milliseconds: delayDuration));
        horizontalPagesController.jumpToPage(1);
      });
    } else {
      horizontalPagesController.animateToPage(1,
          duration: const Duration(milliseconds: animationDuration),
          curve: Curves.linear);
    }
  }

  @override
  Future<void> close() {
    horizontalPagesController.dispose();
    verticalPagesController.dispose();
    return super.close();
  }
}
