import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_states.dart';
import 'package:stories/flow/upload_story/widget/basic_input_field.dart';
import 'package:stories/flow/upload_story/widget/story_image.dart';

class InputForm extends StatelessWidget {
  static const _topSpace = 1,
      _imageflex = 31,
      _titleFieldFlex = 9,
      _descriptionFieldFlex = 14,
      _storyUrlFieldFlex = 9,
      _categoryFieldFlex = 9,
      _storyByFieldFlex = 9,
      _bottomSpace = 14,
      _inputFieldBottomSpacerFlex = 1;
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Column(
          children: [
            Spacer(
              flex: _topSpace,
            ),
            Expanded(flex: _imageflex, child: StoryImageField()),
            Spacer(
              flex: _inputFieldBottomSpacerFlex,
            ),
            Expanded(flex: _categoryFieldFlex, child: CategoryInputField()),
            Spacer(
              flex: _inputFieldBottomSpacerFlex,
            ),
            Expanded(flex: _titleFieldFlex, child: TitleInputField()),
            Spacer(
              flex: _inputFieldBottomSpacerFlex,
            ),
            Expanded(
                flex: _descriptionFieldFlex, child: DescriptionInputField()),
            Spacer(
              flex: _inputFieldBottomSpacerFlex,
            ),
            Expanded(flex: _storyUrlFieldFlex, child: StoryUrlInputField()),
            Spacer(
              flex: _inputFieldBottomSpacerFlex,
            ),
            Expanded(flex: _storyByFieldFlex, child: StoryByInputField()),
            Spacer(
              flex: _bottomSpace,
            ),
          ],
        ),
        BlocBuilder<UploadBloc, UploadState>(builder: (context, state) {
          if (state is UploadingState) {
            return const CircularProgressIndicator();
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
