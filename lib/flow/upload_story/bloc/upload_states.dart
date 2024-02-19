import 'package:flutter/foundation.dart';

@immutable
abstract class UploadState{
  final String message;
  const UploadState({this.message = ''});
}


@immutable
class UploadInitialState extends UploadState{}

@immutable
class ImagePickedState extends UploadState{
  final Uint8List bytes;
  const ImagePickedState({required this.bytes});
}

@immutable
class UploadingState extends UploadState{
  const UploadingState({required super.message});
}

@immutable
class UploadedState extends UploadState{  
  const UploadedState({required super.message});
}

@immutable
class UploadErrorState extends UploadState{  
  const UploadErrorState({required super.message});
}