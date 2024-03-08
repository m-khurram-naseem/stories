import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/util/app_constants/image_assets.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  static const _viewPortFraction = 0.3, _initialPage = 1;
  static const _offAxisFraction = 0.5, _widthPercent = 0.35;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      viewportFraction: _viewPortFraction,
      initialPage: _initialPage,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: ListWheelScrollView(
        itemExtent: MediaQuery.sizeOf(context).width * _widthPercent,
        offAxisFraction: _offAxisFraction,
        // controller: pageController,
        children: const [
          CategoryView(
              category: 'Technology',
              assetImagePath: ImageAssets.technologyImage),
          CategoryView(
              category: 'Politics', assetImagePath: ImageAssets.politicsImage),
          CategoryView(
              category: 'Entertainment',
              assetImagePath: ImageAssets.entertainmentImage),
          CategoryView(
              category: 'Sports', assetImagePath: ImageAssets.sportsImage),
          CategoryView(
              category: 'Religious',
              assetImagePath: ImageAssets.religiousImage),
          CategoryView(
              category: 'International',
              assetImagePath: ImageAssets.internationalImage),
          CategoryView(
              category: 'Startups', assetImagePath: ImageAssets.startupImage),
          CategoryView(
              category: 'Education',
              assetImagePath: ImageAssets.educationImage),
        ],
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  static const _viewPadding = 10.0, _viewHeightPercent = 0.9;
  static const _elevation = 20.0, _borderRadius = 20.0;
  static const _topFlex = 10,
      _bottomFlex = 10,
      _imageFlex = 60,
      _textFlex = 10,
      _middleFlex = 10;
  final String category;
  final String assetImagePath;
  const CategoryView({
    super.key,
    required this.category,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    return RotatedBox(
      quarterTurns: 1,
      child: GestureDetector(
        onTap: () => bloc.add(LoadFeedEvent(category: category.toLowerCase())),
        child: Padding(
          padding: const EdgeInsets.all(_viewPadding),
          child: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight * _viewHeightPercent,
              child: Column(
                children: [
                  const Spacer(flex: _topFlex),
                  Expanded(
                    flex: _imageFlex,
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: _elevation,
                      borderRadius: BorderRadius.circular(_borderRadius),
                      child: Image.asset(
                        assetImagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(flex: _middleFlex),
                  Expanded(flex: _textFlex, child: Text(category)),
                  const Spacer(flex: _bottomFlex),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
