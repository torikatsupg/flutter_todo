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
  }) = _FormModel;

  FormModel._();

  late final error = _canDisplayError ? _error : null;
  late final isValid = _error == null;

  late final _canDisplayError = !focusNode.hasFocus && hasEdit;
  late final _error = validator(controller.text);

  void setListeners(
    VoidCallback onChangeText,
    VoidCallback onFocusChange,
  ) {
    controller.addListener(onChangeText);
    focusNode.addListener(onFocusChange);
  }

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
