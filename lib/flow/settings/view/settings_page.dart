
import 'package:flutter/material.dart';
import 'package:stories/flow/settings/widgets/upload_icon_button.dart';


class SettingsPage extends StatefulWidget {
  static const pageName = '/settingspage';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const _appBarTitle = 'Settings';
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_appBarTitle),
          actions: const[
            UploadIconButton()
          ],
        ),
      ),
    );
  }
}
