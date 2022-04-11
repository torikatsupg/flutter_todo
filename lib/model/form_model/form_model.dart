import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/model/form_model/form_model.freezed.dart';

typedef Validator = String? Function(String value);

@freezed
class FormModel with _$FormModel {
  factory FormModel({
    required Validator validator,
    required TextEditingController controller,
    required FocusNode focusNode,
    @Default(false) bool hasEdit,
    @Default([]) List<String> serverErrors,
  }) = _FormModel;

  FormModel._();

  late final errors = _canDisplayError ? _errors.join('\n') : null;
  late final isValid = _errors.isEmpty;
  late final text = controller.text;

  late final _canDisplayError =
      !focusNode.hasFocus && hasEdit && _errors.isNotEmpty;

  List<String> get _errors {
    final validationError = validator(controller.text);
    return [
      if (validationError != null) validationError,
      ...serverErrors,
    ];
  }

  void setListeners(
    VoidCallback onChangeText,
    VoidCallback onFocusChange,
  ) {
    controller.addListener(onChangeText);
    focusNode.addListener(onFocusChange);
  }

  FormModel onChangeText() => this;

  FormModel onFocusChange() => copyWith(hasEdit: true, serverErrors: []);

  FormModel addServerError(String e) =>
      copyWith(serverErrors: [...serverErrors, e]);

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}

FormModel createFormModel(Validator validator) => FormModel(
      validator: validator,
      controller: TextEditingController(),
      focusNode: FocusNode(),
    );
