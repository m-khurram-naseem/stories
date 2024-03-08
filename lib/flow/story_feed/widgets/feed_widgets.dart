import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/bloc/feed_states.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:stories/flow/story_feed/widgets/no_data_widget.dart';
import 'package:stories/util/comman_widgets/loading_widget.dart';
import 'package:stories/flow/story_feed/widgets/story_view.dart';

class MainFeed extends StatelessWidget {
  static const _displacement = 50.0;
  const MainFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      displacement: _displacement,
      onRefresh: () {
        context.read<FeedBloc>().add(const LoadFeedEvent());
        return Future.value(null);
      },
      child: BlocBuilder<FeedBloc, FeedState>(
          buildWhen: (previous, current) => current is! NewStoriesState,
          builder: (context, state) {
            if (state is LoadingFeedState) {
              return const LoadingFeedWidget();
            } else if (state is LoadedFeedState) {
              return LoadedFeedWidget(storyList: state.list);
            } else if (state is ErrorFeedState) {
              return ErrorFeedWidget(message: state.message);
            } else if (state is NoInternetState) {
              return const NoInternetWidget();
            }
            return const NoDataWidget();
          }),
    );
  }
}

class LoadingFeedWidget extends StatelessWidget {
  const LoadingFeedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingWidget();
  }
}

class LoadedFeedWidget extends StatelessWidget {
  final List<Story> storyList;
  const LoadedFeedWidget({
    super.key,
    required this.storyList,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    return storyList.isEmpty
        ? const NoDataWidget()
        : PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              bloc.add(PageUpdatedEvent(currentIndex: value));
            },
            scrollDirection: Axis.vertical,
            itemCount: storyList.length,
            itemBuilder: (context, index) => StoryView(
              story: storyList[index],
            ),
          );
  }
}

class ErrorFeedWidget extends StatelessWidget {
  final String message;
  const ErrorFeedWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
