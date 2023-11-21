// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NewNoteValueKey = 'NewNote';

final Map<String, TextEditingController>
    _NotesHomePageViewTextEditingControllers = {};

final Map<String, FocusNode> _NotesHomePageViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _NotesHomePageViewTextValidations = {
  NewNoteValueKey: null,
};

mixin $NotesHomePageView {
  TextEditingController get newNoteController =>
      _getFormTextEditingController(NewNoteValueKey);

  FocusNode get newNoteFocusNode => _getFormFocusNode(NewNoteValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_NotesHomePageViewTextEditingControllers.containsKey(key)) {
      return _NotesHomePageViewTextEditingControllers[key]!;
    }

    _NotesHomePageViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _NotesHomePageViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_NotesHomePageViewFocusNodes.containsKey(key)) {
      return _NotesHomePageViewFocusNodes[key]!;
    }
    _NotesHomePageViewFocusNodes[key] = FocusNode();
    return _NotesHomePageViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    newNoteController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    newNoteController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NewNoteValueKey: newNoteController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _NotesHomePageViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _NotesHomePageViewFocusNodes.values) {
      focusNode.dispose();
    }

    _NotesHomePageViewTextEditingControllers.clear();
    _NotesHomePageViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get newNoteValue => this.formValueMap[NewNoteValueKey] as String?;

  set newNoteValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NewNoteValueKey: value}),
    );

    if (_NotesHomePageViewTextEditingControllers.containsKey(NewNoteValueKey)) {
      _NotesHomePageViewTextEditingControllers[NewNoteValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasNewNote =>
      this.formValueMap.containsKey(NewNoteValueKey) &&
      (newNoteValue?.isNotEmpty ?? false);

  bool get hasNewNoteValidationMessage =>
      this.fieldsValidationMessages[NewNoteValueKey]?.isNotEmpty ?? false;

  String? get newNoteValidationMessage =>
      this.fieldsValidationMessages[NewNoteValueKey];
}

extension Methods on FormStateHelper {
  setNewNoteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewNoteValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    newNoteValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NewNoteValueKey: getValidationMessage(NewNoteValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _NotesHomePageViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _NotesHomePageViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NewNoteValueKey: getValidationMessage(NewNoteValueKey),
    });
