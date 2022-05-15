import 'package:flutter/widgets.dart';
import 'package:flutter_todo/app.dart';
import 'package:flutter_todo/infrastructure/firebase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
