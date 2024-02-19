import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_events.dart';

class UploadButton extends StatelessWidget {
  static const _iconMargin = 10.0, _radius = 50.0;
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return InkWell(
      borderRadius: BorderRadius.circular(_radius),
      onTap: () {
        bloc.add(ValidateAndUploadEvent());
      },
      child: const Padding(
        padding: EdgeInsets.all(_iconMargin),
        child: Icon(
          Icons.done,
        ),
      ),
    );
  }
}
