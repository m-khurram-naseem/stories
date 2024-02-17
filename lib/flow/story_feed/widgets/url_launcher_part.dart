import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UrlLauncherPart extends StatelessWidget {  
  const UrlLauncherPart({super.key ,});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CupertinoActivityIndicator(),),);
  }
}