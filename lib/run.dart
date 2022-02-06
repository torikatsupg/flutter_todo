import 'package:flutter/widgets.dart';
import 'package:flutter_todo/app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void run() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
