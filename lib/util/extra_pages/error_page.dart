import 'package:flutter/material.dart';
import 'package:stories/util/theme/color_scheme.dart';

class ErrorPage extends StatelessWidget {
  static const pageName = '/errorpage';
  static const _errorMessage = 'Something went wrong';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: AppColorScheme.errorTextColor,
          child: const Center(
              child: Text(
            _errorMessage,
            style: TextStyle(
              color: AppColorScheme.lightTextColor,
            ),
          )),
        ),
      ),
    );
  }
}
