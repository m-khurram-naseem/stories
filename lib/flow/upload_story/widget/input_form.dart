import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stories/flow/upload_story/widget/basic_input_field.dart';
import 'package:stories/flow/upload_story/widget/story_image.dart';
import 'package:stories/flow/upload_story/widget/upload_button.dart';

class InputForm extends StatelessWidget {
  static const _topSpace = 1,
      _imageflex = 30,
      _titleFieldFlex = 10,
      _descriptionFieldFlex = 10,
      _storyUrlFieldFlex = 10,
      _categoryFieldFlex = 10,
      _storyByFieldFlex = 10,
      _btnUploadFlex = 7,
      _bottomSpace = 12;
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Spacer(
          flex: _topSpace,
        ),
        Expanded(flex: _imageflex, child: StoryImageField()),
        Expanded(flex: _titleFieldFlex, child: TitleInputField()),
        Expanded(flex: _descriptionFieldFlex, child: DescriptionInputField()),
        Expanded(flex: _storyUrlFieldFlex, child: StoryUrlInputField()),
        Expanded(flex: _categoryFieldFlex, child: CategoryInputField()),
        Expanded(flex: _storyByFieldFlex, child: StoryByInputField()),
        Expanded(flex: _btnUploadFlex, child: UploadButton()),
        Spacer(
          flex: _bottomSpace,
        ),
      ],
    );
  }
}
