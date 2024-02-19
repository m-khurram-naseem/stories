import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/discover/widgets/category_list.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/bloc/feed_events.dart';
import 'package:stories/flow/story_feed/widgets/feed_widgets.dart';

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
  static const _errorMessage = 'No Internet Found',
      _imagePath = 'assets/images/no_internet.png';
  static const _tryAgainText = 'Try Again';
  static const _topSpace = 15,
      _imageFlex = 25,
      _middleSpace = 10,
      _messageTextFlex = 10,
      _btnFlex = 7,
      _bottomSpace = 33;
  static const _leftPadding = 20.0, _rightPadding = 20.0;
  static const _borderRadius = 10.0;
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FeedBloc>();
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: _topSpace,
          ),
          Expanded(flex: _imageFlex, child: Image.asset(_imagePath)),
          const Spacer(
            flex: _middleSpace,
          ),
          const Expanded(flex: _messageTextFlex, child: Text(_errorMessage)),
          Expanded(
            flex: _btnFlex,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: _leftPadding, right: _rightPadding),
              child: SizedBox.expand(
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(const LoadFeedEvent());
                  },
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_borderRadius),
                      ),
                    ),
                  ),
                  child: const Text(_tryAgainText),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: _bottomSpace,
          ),
        ],
      ),
    );
  }
}

class DataNotFoundWidget extends StatelessWidget {
  const DataNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(
            flex: 15,
          ),
          Expanded(flex: 25, child: Image.asset('assets/images/no_data.png')),
          Spacer(
            flex: 5,
          ),
          Expanded(
              flex: 10,
              child: const Text(
                'No story regarding this category\nYou may browse some other categories',
                textAlign: TextAlign.center,
              )),
          Expanded(flex: 35, child: const CategoryList()),
          Spacer(
            flex: 10,
          )
        ],
      ),
    );
  }
}
