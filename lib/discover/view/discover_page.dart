import 'package:flutter/material.dart';
import 'package:stories/discover/widgets/category_list.dart';
import 'package:stories/discover/widgets/discover_search.dart';
import 'package:stories/discover/widgets/notification_list.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  static const _appBarTitle = 'Discover';
  static const _topSpace = 2,
      _searchFlex = 8,
      _categoryListFlex = 30,
      _notificationListFlex = 60;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(      
      appBar: AppBar(
        title: const Text(_appBarTitle),
        centerTitle: true,
        actions: const [
          Icon(Icons.settings),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: const Column(
              children: [
                Spacer(flex: _topSpace),
                Expanded(flex: _searchFlex, child: DiscoverSearch()),
                Expanded(flex: _categoryListFlex, child: CategoryList()),
                Expanded(flex: _notificationListFlex, child: NotificationList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
