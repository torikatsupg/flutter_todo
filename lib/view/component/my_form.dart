import 'package:flutter/material.dart';
import 'package:flutter_todo/model/form_model.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    required this.model,
    this.decoration = const InputDecoration(),
    super.key,
  });

  final FormModel model;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: model.controller,
      focusNode: model.focusNode,
      decoration: decoration.copyWith(
        errorText: model.errors,
      ),
    );
  }
}
