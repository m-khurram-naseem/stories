import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_states.dart';
import 'package:stories/util/asset_constants/image_assets.dart';

class StoryImageField extends StatelessWidget {
  const StoryImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc,UploadState>(
      builder: (context,state) {
        return SizedBox(child: Builder(builder: (context) {
          if(state is ImagePickedState){
          return Image.memory(state.bytes);
        }
        return Image.asset(ImageAssets.startupImage);
        },),);
      }
    );
  }
}