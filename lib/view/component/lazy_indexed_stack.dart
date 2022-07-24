import 'package:flutter/material.dart';

class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack(
      {required this.builders, required this.index, Key? key})
      : super(key: key);

  final List<WidgetBuilder> builders;
  final int index;

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late final List<Widget?> _cache = List.filled(builders.length, null);
  final defaultWidget = const SizedBox.shrink();

  get index => widget.index;
  get builders => widget.builders;

  @override
  Widget build(BuildContext context) {
    assert(0 <= index && index < builders.length);
    final target = _cache[index];
    if (target == null) {
      _cache[index] = builders[index](context);
    }
    return IndexedStack(
      index: widget.index,
      children: _cache.map((e) => e ?? defaultWidget).toList(),
    );
  }
}
