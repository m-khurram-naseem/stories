
import 'package:flutter/material.dart';
import 'package:stories/util/comman_widgets/loading_widget.dart';

class UrlLauncherPart extends StatelessWidget {  
  const UrlLauncherPart({super.key ,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child:LoadingWidget()),);
  }
}