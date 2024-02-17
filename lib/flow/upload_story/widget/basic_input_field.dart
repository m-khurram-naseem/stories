import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';

// Base Field made for reusability
class BasicInputField extends StatelessWidget {
  static const _borderRadius = 10.0;
  final TextEditingController controller;
  final String label;
  const BasicInputField({super.key, required this.controller, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        helperText: '',
      ),
    );
  }
}

// Title of the story
class TitleInputField extends StatelessWidget {
  static const _label = 'Title';
  const TitleInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      controller: bloc.titleController,
      label: _label,
    );
  }
}

// Story Description field
class DescriptionInputField extends StatelessWidget {
  static const _label = 'Description';
  const DescriptionInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      controller: bloc.descriptionController,
      label: _label,
    );
  }
}

// Web page or Youtube video url which leads to required story
class StoryUrlInputField extends StatelessWidget {
  static const _label = 'Story Url';
  const StoryUrlInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      controller: bloc.storyDetailUrlController,
      label: _label,
    );
  }
}

// Category Related to Story
class CategoryInputField extends StatelessWidget {
  static const _label = 'Category';
  const CategoryInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      controller: bloc.categoryController,
      label: _label,
    );
  }
}

// Describes the owner of story / Which news channel of website published this story
class StoryByInputField extends StatelessWidget {
  static const _label = 'Story By';
  const StoryByInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      controller: bloc.titleController,
      label: _label,
    );
  }
}
