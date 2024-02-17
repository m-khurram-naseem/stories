import 'package:flutter/material.dart';

class DiscoverSearch extends StatelessWidget {
  static const _leftRightPadding = 10.0;
  static const _hintText = 'Search Story';
  const DiscoverSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding:
            EdgeInsets.only(left: _leftRightPadding, right: _leftRightPadding),
        child: SearchBar(hintText: _hintText),);
  }
}
