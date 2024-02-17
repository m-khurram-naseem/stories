import 'package:flutter/foundation.dart';

@immutable
abstract class UploadState{
  const UploadState();
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
  final String message;
  const UploadingState({required this.message});
}

@immutable
class UploadedState extends UploadState{
  final String message;
  const UploadedState({required this.message});
}

@immutable
class UploadErrorState extends UploadState{
  final String message;
  const UploadErrorState({required this.message});
}