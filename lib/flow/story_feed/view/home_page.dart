import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/discover/view/discover_page.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/bloc/feed_states.dart';
import 'package:stories/flow/story_feed/widgets/feed_widgets.dart';
import 'package:stories/flow/story_feed/widgets/url_launcher_part.dart';
import 'package:stories/util/app_constants/horizontal_page_numbers.dart';
import 'package:stories/util/theme/color_scheme.dart';

class HomePage extends StatelessWidget {
  static const pageName = '/';
  static const _restorationId = 'horizontalScrollId';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    FirebaseMessaging.onMessage.listen((event) {
      log('[Listened]');
      if ((bloc.horizontalPagesController.page ?? 0) ==
          HorizontalPages.feedPage) {
        bloc.add(NewStoriesEvent());
      }
    }, cancelOnError: true, onDone: () {}, onError: (error) {});
    bloc.add(const LoadFeedEvent());
    return SafeArea(
      child: BlocListener<FeedBloc, FeedState>(
        listenWhen: (previous, current) => current is NewStoriesState,
        listener: _statesListener,
        child: Scaffold(
          body: Center(
                child: PageView(
                  controller: bloc.horizontalPagesController,
                  allowImplicitScrolling: true,
                  restorationId: _restorationId,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (value) {
                    if (value == HorizontalPages.urlLauncherPage) {
                      bloc.add(LaunchUrlEvent());
                    }
                  },
                  children: const [
                    DiscoverPage(),
                    MainFeed(),
                    UrlLauncherPart(),
                  ],
                ),
              ),              
        ),
      ),
    );
  }

  void _statesListener(BuildContext context, FeedState state) {
    if (state is NewStoriesState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColorScheme.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        width: MediaQuery.sizeOf(context).width * 0.4,
        content: GestureDetector(
            onTap: () {
              context.read<FeedBloc>().add(const LoadFeedEvent());
            },
            child: const Center(
              child: Text(
                'New Trends',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColorScheme.lightTextColor),
              ),
            )),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
