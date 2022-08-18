import 'package:flutter/material.dart';
import 'package:flutter_todo/model/form_model.dart';

class MyForm extends StatefulWidget {
  const MyForm({
    required this.model,
    required this.onChanged,
    required this.hintText,
    required this.helperText,
    required this.label,
    super.key,
  });

  final FormModel model;
  final ValueChanged<FormModel> onChanged;
  final String hintText;
  final String helperText;
  final String label;

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  void initState() {
    super.initState();
    widget.model.controller.addListener(
      () => widget.onChanged(
        widget.model.onChangeText(),
      ),
    );
    widget.model.focusNode.addListener(
      () => widget.onChanged(
        widget.model.onFocusChange(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.model.controller,
      focusNode: widget.model.focusNode,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorText: widget.model.errors,
        hintText: widget.hintText,
        helperText: widget.helperText,
        label: Text(widget.label),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.model.controller.removeListener(() {});
    widget.model.focusNode.removeListener(() {});
  }
}
