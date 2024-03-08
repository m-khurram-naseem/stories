import 'package:flutter/material.dart';
import 'package:stories/flow/option_dialog/widgets/option_dialog_tile.dart';
import 'package:stories/util/app_constants/menu_constants.dart';

class OptionDialogBody extends StatelessWidget {
  const OptionDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0; index < StoryCategories.categories.length; index++)
          OptionDialogTile(
            category: StoryCategories.categories.values.elementAt(index),
          )
      ],
    );
  }
}
