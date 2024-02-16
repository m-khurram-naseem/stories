import 'package:flutter/material.dart';
import 'package:stories/discover/view/discover_page.dart';
import 'package:stories/story_feed/model/story.dart';
import 'package:stories/story_feed/widgets/story_list_view.dart';
import 'package:stories/story_feed/widgets/url_launcher_part.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _initialPageIndex = 1;
  late PageController pageController;
  late ScrollPosition position;

  @override
  void initState() {  
    super.initState();    
    pageController = PageController(initialPage: _initialPageIndex);        
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: PageView(
            controller: pageController,
            children: [
              const DiscoverPage(),
              StoryListView(
              storyList: storyList,
            ),
            const UrlLauncherPart(),
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
        storyDetailUrl: 'https://unsplash.com/s/photos/image',
        category: 'General',
        dateTime: DateTime.now(),
        storyBy: 'M Khurram Naseem'),
];
