import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/form_model.freezed.dart';

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

  String? get errors {
    if (!canDisplayError) {
      return null;
    } else if (_errors.isEmpty) {
      return null;
    } else {
      return _errors.join('\n');
    }
  }

  late final isValid = _errors.isEmpty;
  late final text = controller.text;

  late final canDisplayError = !focusNode.hasFocus && hasEdit;

  List<String> get _errors {
    final validationError = validator(controller.text);
    return [
      if (validationError != null) validationError,
      ...serverErrors,
    ];
  }

  FormModel onChangeText() => this;

  FormModel onFocusChange() => copyWith(hasEdit: true, serverErrors: []);

  void unfocus() => focusNode.unfocus();

  FormModel addServerError(String e) =>
      copyWith(serverErrors: [...serverErrors, e]);

  FormModel onSubmit() {
    focusNode.unfocus();
    return copyWith(hasEdit: true);
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }
}

FormModel createFormModel(Validator validator, [String initText = '']) =>
    FormModel(
      validator: validator,
      controller: TextEditingController(text: initText),
      focusNode: FocusNode(),
    );
