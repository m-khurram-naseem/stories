import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/story_feed/model/story.dart';
import 'package:stories/flow/upload_story/bloc/upload_events.dart';
import 'package:stories/flow/upload_story/bloc/upload_states.dart';
import 'package:stories/services/story_database.dart';
import 'package:image_picker/image_picker.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  static const _imageMissingMessage = 'Image Missing',
      _storyUploadingMessage = 'Story Uploading';
  static const _imageUploadingMessage = 'Image Uploading',
      _uploadSuccessMessage = 'Story Uploaded Successfully';

  late TextEditingController titleController,
      descriptionController,
      storyDetailUrlController,
      categoryController,
      storyByController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final StoryDb storyDb = StoryDb();
  Uint8List? imageBytes;

  UploadBloc() : super(UploadInitialState()) {
    // Describing Event Handlers
    on<UploadInitialEvent>(_handleInitialEvent);
    on<ValidateAndUploadEvent>(_validateAndUploadStory);
    on<PickImageEvent>(_pickImageFromGallery);

    // Initializing Controllers here
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    storyDetailUrlController = TextEditingController();
    categoryController = TextEditingController();
    storyByController = TextEditingController();
  }

  // Just a dummy event and its handler nothing special
  FutureOr<void> _handleInitialEvent(
      UploadInitialEvent event, Emitter<UploadState> emit) {
    emit(UploadInitialState());
  }

  // Validate and upload data : Upload Image on cloud storage and then upload the resultant url on Firestore
  // To be able to fetch that image next time
  FutureOr<void> _validateAndUploadStory(
      ValidateAndUploadEvent event, Emitter<UploadState> emit) async {
    if (formKey.currentState!.validate()) {
      try {
        if (imageBytes == null) {
          emit(const UploadErrorState(message: _imageMissingMessage));
        } else {
          // Current date and time to keep things specific and different
          DateTime dateTime = DateTime.now();
          emit(const UploadingState(
              message:
                  _imageUploadingMessage)); // Informing UI with current status of Uploading
          // Uploading image on cloud storage and get download url of that image
          String imageUrl = await storyDb.uploadImage(
              imageBytes!, dateTime.millisecondsSinceEpoch.toString());
          emit(const UploadingState(
              message:
                  _storyUploadingMessage)); // Informing UI with current status
          // Now Uploading whole story on Firestore
          await storyDb.insertStory(
            Story(
              storyId: dateTime.millisecondsSinceEpoch,
              title: titleController.text,
              description: descriptionController.text,
              imageUrl: imageUrl,
              storyDetailUrl: storyDetailUrlController.text,
              category: categoryController.text,
              dateTime: dateTime,
              storyBy: storyByController.text,
            ),
          );
          // Emitting success state to notifiy user of successful upload
          emit(const UploadedState(message: _uploadSuccessMessage));
        }
      } on FirebaseException catch (e) {
        emit(UploadErrorState(message: 'Firebase:${e.toString()}'));
      } catch (e) {
        emit(UploadErrorState(message: e.toString()));
      }
    }
  }

  /// Pick Image from gallery and assign it instance variable [imageBytes]
  FutureOr<void> _pickImageFromGallery(
      PickImageEvent event, Emitter<UploadState> emit) async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      // Converting image into Unit8List which is equivalent to byte[] in android
      // Just a way of storing image or other files
      imageBytes = await file.readAsBytes();
      emit(ImagePickedState(bytes: imageBytes!));
    }
  }

  @override
  Future<void> close() {
    // Disposing all controllers to prevent memory leak
    titleController.dispose();
    descriptionController.dispose();
    storyByController.dispose();
    storyDetailUrlController.dispose();
    categoryController.dispose();
    return super.close();
  }
}
