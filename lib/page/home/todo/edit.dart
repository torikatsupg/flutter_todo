import 'package:flutter/material.dart';
import 'package:flutter_todo/router/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Edit extends ConsumerWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final id = ref.watch(routeProvider).params['id']!;
    return Scaffold(
      appBar: AppBar(
        title: Text('edit $id'),
      ),
    );
  }
}
