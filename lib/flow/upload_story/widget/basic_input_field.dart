import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stories/flow/upload_story/bloc/upload_bloc.dart';
import 'package:stories/util/input_validators/input_validator.dart';

typedef Validator = String? Function(String?);

// Base Field made for reusability
class BasicInputField extends StatelessWidget {
  static const _borderRadius = 10.0;
  final TextEditingController controller;
  final String label;
  final int maxlines;
  final Validator validator;
  const BasicInputField(
      {super.key,
      required this.controller,
      required this.validator,
      this.label = '',
      this.maxlines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      validator: validator,
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
      validator: InputValidator.titleValidator,
      controller: bloc.titleController,
      label: _label,
    );
  }
}

// Story Description field
class DescriptionInputField extends StatelessWidget {
  static const _label = 'Description';
  static const _maxLines = 10;
  const DescriptionInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      validator: InputValidator.descriptionValidator,
      maxlines: _maxLines,
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
      validator: InputValidator.urlValidator,
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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: DropdownMenu(
        dropdownMenuEntries: const [
          DropdownMenuEntry(value: 'technology', label: 'Technology'),
          DropdownMenuEntry(value: 'politics', label: 'Politics'),
          DropdownMenuEntry(value: 'entertainment', label: 'Entertainment'),
          DropdownMenuEntry(value: 'sports', label: 'Sports'),
          DropdownMenuEntry(value: 'religious', label: 'Religious'),
          DropdownMenuEntry(value: 'international', label: 'International'),
          DropdownMenuEntry(value: 'startups', label: 'Startups'),
          DropdownMenuEntry(value: 'education', label: 'Education'),
        ],
        controller: bloc.categoryController,
        label: const Text(_label),
      ),
    );
  }
}

// BasicInputField(
//       validator: InputValidator.categoryValidator,
//       controller: bloc.categoryController,
//       label: _label,
//     );

// Describes the owner of story / Which news channel of website published this story
class StoryByInputField extends StatelessWidget {
  static const _label = 'Story By';
  const StoryByInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UploadBloc>();
    return BasicInputField(
      validator: InputValidator.storyByValidator,
      controller: bloc.storyByController,
      label: _label,
    );
  }
}
