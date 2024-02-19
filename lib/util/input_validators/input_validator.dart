class InputValidator {
  static const _compulsoryFieldMessage = 'Compulsory Field',
      _titleLengthMessage = 'Length 8-15 words',
      _descriptionLengthMessage = 'Length < 40 words',
      _descriptionLengthExceedsMessage = 'Length > 60';
  static String? titleValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.split(' ').length < 15 && value.split(' ').length > 8) {
        return null;
      }
      return _titleLengthMessage;
    }
    return _compulsoryFieldMessage;
  }

  static String? descriptionValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.split(' ').length > 40) {
        if (value.split(' ').length < 60) {
          return null;
        }
        return _descriptionLengthExceedsMessage;
      }
      return _descriptionLengthMessage;
    }
    return _compulsoryFieldMessage;
  }

  static String? urlValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return _compulsoryFieldMessage;
  }

  static String? categoryValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return _compulsoryFieldMessage;
  }

  static String? storyByValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return _compulsoryFieldMessage;
  }
}
