import 'package:flutter/material.dart';
import 'package:flutter_todo/component/screen.dart';
import 'package:go_router/go_router.dart';

class Node {
  Node({required this.path, required this.page, List<Node>? children})
      : children = children ?? [];

  final String path;
  final Page page;
  final List<Node> children;

  get hasChildren => children.isNotEmpty;

  List<Page> build(Uri target) {
    print('uri is: ${target.toString()}');
    final pages = _build([], '', target) ??
        const [MaterialPage(child: Screen(name: 'error'))];
    return pages;
  }

  List<Page>? _build(List<Page> stack, String path, Uri target) {
    // TODO(torikatsu): match uri
    final nextPath = '$path/${this.path}';
    // print('target: ${target.path}, nextPath: $nextPath');
    if(target.path.startsWith(nextPath)) {
      stack.add(page);
    }
    if (target.path == nextPath) {
      print('target: ${target.path}, nextPath: $nextPath');
      return stack;
    }
    final a = children
        .map((child) => child._build(stack, nextPath, target))
        .filter((v) => v != null)
        .myfirst;
    return a;
  }
}

extension IterableExt<T> on Iterable<T> {
  List<T> filter(bool Function(T v) test) {
    var results = <T>[];
    for (var v in this) {
      if (test(v)) results.add(v);
    }
    return results;
  }

  T? get myfirst => isEmpty ? null : first;
}
