import 'package:flutter/widgets.dart';
import 'package:flutter_todo/app.dart';
import 'package:flutter_todo/infrastructure/firebase.dart';
import 'package:flutter_todo/util/riverpod_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      child: const App(),
    ),
  );
}
