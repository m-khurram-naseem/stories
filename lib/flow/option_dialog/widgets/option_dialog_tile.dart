import 'package:flutter/material.dart';
import 'package:stories/models/story_category.dart';
import 'package:stories/util/app_constants/font_family.dart';

class OptionDialogTile extends StatelessWidget {
  static const _fontSizePercent = 0.04;
  static const _startSpace = 5, _textFlex = 70, _switchFlex = 20, _endSpace = 5;
  final StoryCategory category;
  const OptionDialogTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    bool current = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: _startSpace,
        ),
        Expanded(
          flex: _textFlex,
          child: Text(
            category.label,
            style:TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.ebGarmod,
                fontSize: width * _fontSizePercent,
              ),
          ),
        ),
        Expanded(
          flex: _switchFlex,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Switch(
                value: current,
                onChanged: (value) {
                  setState(
                    () {
                      current = value;
                      category.isAllowed = value;
                    },
                  );
                },
              );
            },
          ),
        ),
        const Spacer(
          flex: _endSpace,
        ),
      ],
    );
  }
}
