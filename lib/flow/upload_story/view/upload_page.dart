import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/widget/input_form.dart';

class UploadPage extends StatefulWidget {
  static const pageName = '/uploadpage';

  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  static const _appBarTitle = 'Upload Story';
  static const _iconMargin = 15.0;
  static const _leftRightSpace = 10.0;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(_appBarTitle),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: _iconMargin),
              child: Icon(
                Icons.done,
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: width,
              height: height,
              child: Form(
                key: bloc.formKey,
                child: Padding(
                    padding: EdgeInsets.only(
                        left: _leftRightSpace, right: _leftRightSpace),
                    child: const InputForm()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
