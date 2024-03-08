import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stories/flow/option_dialog/bloc/dialog_bloc.dart';
import 'package:stories/flow/option_dialog/widgets/option_dialog_body.dart';
import 'package:stories/flow/option_dialog/widgets/option_dialog_button.dart';
import 'package:stories/flow/option_dialog/widgets/option_dialog_title.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/services/local_notification_service.dart';
import 'package:stories/util/theme/color_scheme.dart';

import '../../../util/app_constants/preference_constants.dart';

class OptionDialogPage extends StatelessWidget {
  static const pageName = 'dialogpage';
  static const _titleFlex = 15, _bodyFlex = 60, _space = 10, _btnFlex = 15;
  static const _padding = 40.0;
  const OptionDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return SafeArea(
        child: BlocListener<DialogBloc, DialogState>(
          listener: _stateListener,
          child: const Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: _titleFlex,
                  child: OptionDialogTitle(),
                ),
                Expanded(
                  flex: _bodyFlex,
                  child: OptionDialogBody(),
                ),
                Spacer(
                  flex: _space,
                ),
                Expanded(
                  flex: _btnFlex,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(_padding),
                      child: OptionDialogButton(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _stateListener(BuildContext context, DialogState state) {
    if (state is CanNavigateState) {
      GetIt.I<SharedPreferences>().setBool(Preferences.categoriesKey, false);
      Navigator.of(context).pushReplacementNamed(HomePage.pageName);
      LocalNotificationService().requestPermission();
    } else if (state is CannotNavigateState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: state.message,
            message: '',
            contentType: ContentType.warning,
            color: AppColorScheme.secondary,
          ),
        ),
      );
    }
  }
}
