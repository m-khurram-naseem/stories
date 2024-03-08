import 'package:flutter/material.dart';
import 'package:stories/util/app_constants/font_family.dart';
import 'package:stories/util/theme/color_scheme.dart';

class OptionDialogTitle extends StatelessWidget {
  static const _titleText =
      'Choose atleast three categories you are interested in';
  static const _fontSizePercent = 0.06;
  const OptionDialogTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(colors: [
          AppColorScheme.secondary,
          AppColorScheme.tertiary,
        ]).createShader(bounds);
      },
      child: Text(
        _titleText,
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.ebGarmod,
            color: AppColorScheme.lightTextColor,
            fontSize: width * _fontSizePercent,
          ),
      ),
    );
  }
}
