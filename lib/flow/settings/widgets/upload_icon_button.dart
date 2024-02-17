
import 'package:flutter/material.dart';
import 'package:stories/flow/upload_story/view/upload_page.dart';

class UploadIconButton extends StatelessWidget {
  static const _iconMargin = 15.0;
  static const _borderRadius = 50.0;
  const UploadIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              borderRadius: BorderRadius.circular(_borderRadius),
              onTap: () {},
              onLongPress: () {
                Navigator.of(context).pushNamed(UploadPage.pageName);
              },
              child: const Padding(
                padding: EdgeInsets.all(_iconMargin),
                child: Icon(Icons.upload),
              ),
            );
  }
}