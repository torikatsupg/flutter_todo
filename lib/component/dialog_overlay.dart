import 'package:flutter/material.dart';

class DialogOverlay extends StatelessWidget {
  const DialogOverlay({required this.child, this.onTap, Key? key})
      : super(key: key);

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ColoredBox(
        color: Colors.black.withOpacity(0.3),
        child: Center(child: child),
      ),
    );
  }
}
