import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stories/services/download_image_service.dart';
import 'package:stories/services/story_database.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/bloc/feed_states.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:stories/util/app_constants/horizontal_page_numbers.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  late PageController horizontalPagesController;
  late PageController verticalPagesController;
  static const int animationDuration = 300, delayDuration = 500;
  final StoryDb db = StoryDb();
  final DownloadImageService _imageService = DownloadImageService();
  List<Story> stories = [];
  int currentIndex = 0;

  FeedBloc() : super(InitialFeedState()) {
    horizontalPagesController =
        PageController(initialPage: HorizontalPages.feedPage);
    verticalPagesController = PageController();
    on<InitialFeedEvent>(_handleInitialEvent);
    on<LoadFeedEvent>(_fetchFeedStories);
    on<PageUpdatedEvent>((event, emit) {
      currentIndex = event.currentIndex;
    });
    on<LaunchUrlEvent>(_launchCurrentStoryUrl);
    on<NewStoriesEvent>(_handleNewStories);
    on<ShareStoryEvent>(_handleShareEvent);
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
        horizontalPagesController.animateToPage(HorizontalPages.feedPage,
            duration: const Duration(milliseconds: animationDuration),
            curve: Curves.easeIn);
      }
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        stories = await db.fetchStories(category: event.category);
        stories.sort(
          (a, b) {
            return a.dateTime.isBefore(b.dateTime) ? 1 : 0;
          },
        );
        emit(LoadedFeedState(list: stories));
      } else {
        emit(NoInternetState());
      }
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
        connectivityResult == ConnectivityResult.wifi && stories.isNotEmpty) {
      bool isLaunchable =
          await canLaunchUrl(Uri.parse(stories[currentIndex].storyDetailUrl));
      if (isLaunchable) {
        await launchUrl(Uri.parse(stories[currentIndex].storyDetailUrl),
                mode: LaunchMode.inAppBrowserView)
            .then((value) async {
          await Future.delayed(const Duration(milliseconds: delayDuration));
          horizontalPagesController.jumpToPage(HorizontalPages.feedPage);
        });
      } else {
        horizontalPagesController.animateToPage(HorizontalPages.feedPage,
            duration: const Duration(milliseconds: animationDuration),
            curve: Curves.linear);
      }
    } else {
      horizontalPagesController.animateToPage(HorizontalPages.feedPage,
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

  FutureOr<void> _handleNewStories(
      NewStoriesEvent event, Emitter<FeedState> emit) {
    emit(NewStoriesState());
  }

  FutureOr<void> _handleShareEvent(
      ShareStoryEvent event, Emitter<FeedState> emit) async {        
    try {
      final bytes = await _imageService
          .downloadImageFromUrl(stories[currentIndex].imageUrl);

      final Directory directory = await getTemporaryDirectory();
      final File file =
          await File('${directory.path}/image.png').writeAsBytes(bytes);
      Share.shareXFiles(
        [XFile(file.path)],
        subject: 'image/*',
        text: '${stories[currentIndex].title}\nhttps://www.google.com',
      );      
    } catch (e) {
      log('[Error In Downloading Image : ${e.toString()}]');
    }
  }
}
