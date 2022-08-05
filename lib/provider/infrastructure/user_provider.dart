import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:flutter_todo/provider/model/user_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_todo/model/user.dart';

class _UserStateNotifier extends ValueNotifier<void> {
  _UserStateNotifier() : super(null);
  void notify() => notifyListeners();
}

final userStateNotifier = _UserStateNotifier();

final authProvider = StreamProvider<UserAuth?>(
  (ref) {
    return auth.FirebaseAuth.instance.authStateChanges().map(
      (v) {
        final maybeAuth = v;
        if (maybeAuth == null) {
          return null;
        } else {
          return UserAuth(userId: AuthId(maybeAuth.uid));
        }
      },
    );
  },
);

final userProvider = StreamProvider<User?>(
  (ref) {
    ref.listenSelf((_, v) => userStateNotifier.notify());
    return ref.watch(authProvider.stream).asyncMap(
      (auth) async {
        if (auth == null) return null;
        final userId = UserId.fromAuthId(auth.userId);
        final result = await ref.read(userRepositoryProvider).findById(userId);
        return result.map(
          ok: (user) => user.value,
          // TODO(torikatsu): handle error correctory
          err: (e) => null,
        );
      },
    );
  },
);
