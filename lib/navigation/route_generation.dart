import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/option_dialog/bloc/dialog_bloc.dart';
import 'package:stories/flow/option_dialog/view/option_dialog.dart';
import 'package:stories/flow/settings/view/settings_page.dart';
import 'package:stories/flow/story_feed/bloc/feed_bloc.dart';
import 'package:stories/flow/story_feed/view/home_page.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/view/upload_page.dart';
import 'package:stories/util/extra_pages/error_page.dart';

class RouteGeneration {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      HomePage.pageName => MaterialPageRoute(
          builder: (context) => BlocProvider<FeedBloc>(
            create: (context) => FeedBloc(),
            child: const HomePage(),
          ),
        ),
      OptionDialogPage.pageName => MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DialogBloc(),
            child: const OptionDialogPage(),
          ),
        ),
      UploadPage.pageName => MaterialPageRoute(
          builder: (context) => BlocProvider<UploadBloc>(
            create: (context) => UploadBloc(),
            child: const UploadPage(),
          ),
        ),
      SettingsPage.pageName => MaterialPageRoute(
          builder: (context) => const SettingsPage(),
        ),
      _ => MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        ),
    };
  }
}
