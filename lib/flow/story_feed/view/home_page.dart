import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/discover/view/discover_page.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:stories/flow/story_feed/widgets/feed_widgets.dart';
import 'package:stories/flow/story_feed/widgets/url_launcher_part.dart';

class HomePage extends StatefulWidget {
  static const pageName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<FeedBloc>().add(const LoadFeedEvent());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PageView(
            controller: bloc.horizontalPagesController,
            onPageChanged: (value) {
              if (value == 2) {
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
    );
  }
}

List<Story> storyList = [
  for (int i = 0; i < 10; i++)
    Story(
        storyId: 1,
        title:
            'Pic of screw in sandwich served on IndiGo flight goes viral, airline responds',
        description:
            'Pic of screw in sandwich served on IndiGo flight goes viral, airline responds Pic of screw in sandwich served on IndiGo flight goes viral, airline responds Pic of screw in sandwich served on IndiGo flight goes viral, airline responds Pic of screw in sandwich served on IndiGo flight goes viral, airline responds Pic of screw in sandwich served on IndiGo',
        imageUrl:
            'https://images.unsplash.com/photo-1575936123452-b67c3203c357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
        storyDetailUrl: 'https://www.instagram.com',
        category: 'General',
        dateTime: DateTime.now(),
        storyBy: 'M Khurram Naseem'),
];
