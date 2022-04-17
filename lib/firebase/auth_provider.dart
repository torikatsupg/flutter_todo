import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/model/app_error.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<User>((ref) {
  final maybeUser = ref.watch(authStreamProvider).value;
  if (maybeUser == null) {
    throw AppError.unauthorized();
  } else {
    return maybeUser;
  }
});

final _prev = StateProvider<User?>((ref) => null);

final authStreamProvider = StreamProvider<User?>((ref) {
  final authStream = FirebaseAuth.instance.authStateChanges();
  final stream = authStream.transform<User?>(
    StreamTransformer.fromHandlers(
      handleData: ((data, sink) {
        if (data != ref.read(_prev)) {
          ref.read(_prev.notifier).update((_) => data);
          sink.add(data);
        }
      }),
    ),
  );
  return stream;
});

extension StreamExt<T> on Stream<T> {
  Future<T> next() {
    final completer = Completer<T>();
    final sub = listen(null);
    sub.onData((e) {
      sub.cancel();
      completer.complete(e);
    });
    return completer.future;
  }
}
