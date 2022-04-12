import 'package:flutter/material.dart';

class CustomModalBarriere extends StatefulWidget {
  const CustomModalBarriere(
      {required this.show, required this.onTap, required this.child, Key? key})
      : super(key: key);

  final bool show;
  final VoidCallback onTap;
  final Widget child;

  @override
  State<CustomModalBarriere> createState() => _CustomModalBarriereState();
}

const duration = Duration(milliseconds: 150);

class _CustomModalBarriereState extends State<CustomModalBarriere>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> animatedOpacity;

  late String currentColor;

  bool show = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    animatedOpacity = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() => setState(() {}));
  }

  @override
  void didUpdateWidget(covariant CustomModalBarriere oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show) {
      _controller.forward();
      show = true;
    } else {
      _controller.reverse().whenCompleteOrCancel(() {
        show = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (show) {
      return Opacity(
        opacity: animatedOpacity.value,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: ColoredBox(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: widget.child,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
