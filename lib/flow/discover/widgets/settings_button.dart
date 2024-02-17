
import 'package:flutter/material.dart';
import 'package:stories/flow/settings/view/settings_page.dart';

class SettingsButton extends StatelessWidget {
  static const _borderRadius = 50.0;
    static const _iconMargin = 15.0;
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(_borderRadius),
      onTap: () {
        Navigator.of(context).pushNamed(SettingsPage.pageName);
      },
      child: const Padding(
        padding: EdgeInsets.all(_iconMargin),
        child: Icon(Icons.settings),
      ),
    );
  }
}
