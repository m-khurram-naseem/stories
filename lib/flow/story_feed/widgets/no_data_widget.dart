import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:stories/flow/discover/widgets/category_list.dart';
import 'package:stories/flow/story_feed/widgets/feed_widgets.dart';
import 'package:stories/util/app_constants/font_family.dart';
import 'package:stories/util/app_constants/image_assets.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({super.key});

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  late Future<ConnectivityResult> future;
  @override
  void initState() {
    future = Connectivity().checkConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingFeedWidget();
        } else {
          if (snapshot.hasData) {
            if (snapshot.data == ConnectivityResult.mobile ||
                snapshot.data == ConnectivityResult.wifi) {
              return const DataNotFoundWidget();
            } else {
              return const NoInternetWidget();
            }
          } else {
            return const Placeholder();
          }
        }
      },
    );
  }
}

class NoInternetWidget extends StatelessWidget {
  static const _errorMessage = 'No Internet Connection',
      _refreshText = 'Swipe down to Refresh';
  static const _topSpace = 15,
      _imageFlex = 25,
      _middleSpace = 10,
      _messageTextFlex = 10,
      _btnFlex = 7,
      _bottomSpace = 33;
  static const _fontSizePercent = 0.05;
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            const Spacer(
              flex: _topSpace,
            ),
            Expanded(
              flex: _imageFlex,
              child: Image.asset(
                ImageAssets.noInternetImage,
              ),
            ),
            const Spacer(
              flex: _middleSpace,
            ),
            Expanded(
              flex: _messageTextFlex,
              child: Text(
                _errorMessage,
                style: TextStyle(
                  fontFamily: FontFamily.tinos,
                  fontSize: width * _fontSizePercent,
                ),
              ),
            ),
            Expanded(
              flex: _btnFlex,
              child: Text(
                _refreshText,
                style: TextStyle(
                  fontFamily: FontFamily.tinos,
                  fontSize: width * _fontSizePercent,
                ),
              ),
            ),
            const Spacer(
              flex: _bottomSpace,
            ),
          ],
        ),
      ),
    );
  }
}

class DataNotFoundWidget extends StatelessWidget {
  static const _imageTopSpace = 15,
      _imageFlex = 25,
      _textTopSpace = 5,
      _textFlex = 10,
      _listFlex = 35,
      _listBottomSpace = 10;
  static const _text =
      'No story regarding this category\nYou may browse some other categories';
  const DataNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: _imageTopSpace,
          ),
          Expanded(
            flex: _imageFlex,
            child: Image.asset(
              ImageAssets.noDataImage,
            ),
          ),
          const Spacer(
            flex: _textTopSpace,
          ),
          const Expanded(
              flex: _textFlex,
              child: Text(
                _text,
                textAlign: TextAlign.center,
              )),
          const Expanded(flex: _listFlex, child: CategoryList()),
          const Spacer(
            flex: _listBottomSpace,
          )
        ],
      ),
    );
  }
}
