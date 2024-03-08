import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/option_dialog/bloc/dialog_bloc.dart';
import 'package:stories/util/app_constants/font_family.dart';
import 'package:stories/util/theme/color_scheme.dart';

class OptionDialogButton extends StatelessWidget {
  static const _fontSizePercent = 0.04,
      _btnText = 'Next',
      _btnHeightPercent = 0.08;
  const OptionDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * _btnHeightPercent,
      child: ElevatedButton.icon(
        onPressed: () {
          context.read<DialogBloc>().add(NavigateEvent());
        },
        icon: const Icon(
          Icons.navigate_next,
          color: AppColorScheme.lightTextColor,
        ),
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColorScheme.secondary,),
        ),
        label: FittedBox(
          child: Text(
            _btnText,
            style: TextStyle(
                fontFamily: FontFamily.ebGarmod,
                color: AppColorScheme.lightTextColor,
                fontWeight: FontWeight.bold,
                fontSize: width * _fontSizePercent,
              ),
          ),
        ),
      ),
    );
  }
}
