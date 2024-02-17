import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UploadEvent{
  const UploadEvent();
}

@immutable
class UploadInitialEvent extends UploadEvent{}

@immutable
class PickImageEvent extends UploadEvent{}

@immutable
class ValidateAndUploadEvent extends UploadEvent{}