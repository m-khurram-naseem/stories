import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_states.dart';
import 'package:stories/flow/upload_story/widget/input_form.dart';
import 'package:stories/flow/upload_story/widget/upload_button.dart';

class UploadPage extends StatefulWidget {
  static const pageName = '/uploadpage';

  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  static const _appBarTitle = 'Upload Story';
  
  static const _leftRightSpace = 10.0;

  void _statesListener(BuildContext context, UploadState state) {
    if(state is UploadErrorState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }else if(state is UploadedState){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
    }
  }
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: BlocListener<UploadBloc,UploadState>(
        listener: _statesListener,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(_appBarTitle),
            actions: const [
             UploadButton()
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: width,
                height: height,
                child: Form(
                  key: bloc.formKey,
                  child: const Padding(
                      padding: EdgeInsets.only(
                          left: _leftRightSpace, right: _leftRightSpace),
                      child: InputForm()),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  
}
