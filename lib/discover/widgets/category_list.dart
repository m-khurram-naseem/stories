import 'package:flutter/material.dart';
import 'package:stories/util/asset_constants/image_assets.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  static const _viewPortFraction = 0.3 , _initialPage = 1;
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
    return PageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
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
    );
  }
}

class CategoryView extends StatelessWidget {
  static const _viewPadding = 10.0 , _viewHeightPercent = 0.9 , _imageDiameterPercent = 0.7;
  static const _topFlex = 10 , _bottomFlex = 10 , _imageFlex = 70 , _textFlex = 10;
  final String category;
  final String assetImagePath;
  const CategoryView({
    super.key,
    required this.category,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_viewPadding),
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * _viewHeightPercent,
          child: Column(
            children: [
              const Spacer(flex: _topFlex),
              Expanded(
                flex: _imageFlex,
                child: CircleAvatar(
                  radius: (constraints.maxHeight * _imageDiameterPercent) / 2,
                  foregroundImage: AssetImage(
                    assetImagePath,
                  ),
                ),
              ),
              Expanded(flex: _textFlex, child: Text(category)),
              const Spacer(flex: _bottomFlex),
            ],
          ),
        );
      }),
    );
  }
}
