
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_events.dart';

class UploadButton extends StatelessWidget {
  static const _btnText = 'Upload';
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return ElevatedButton(
      onPressed: () {
        bloc.add(ValidateAndUploadEvent());
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_btnText),
        ],
      ),
    );
  }
}
