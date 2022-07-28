import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(torikatsu): handle AppError
    return const Center(
      child: Text('error has occured'),
    );
  }
}
