import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _AuthStateNotifier extends ValueNotifier<UserAuth?> {
  _AuthStateNotifier() : super(null);
  void change(UserAuth? v) => value = v;
}

final authStateNotifier = _AuthStateNotifier();

final authProvider = StreamProvider<UserAuth?>(
  (ref) {
    ref.listenSelf((_, v) => authStateNotifier.change(v.value));
    return FirebaseAuth.instance.authStateChanges().map(
      (v) {
        final maybeAuth = v;
        if (maybeAuth == null) {
          return null;
        } else {
          return UserAuth(userId: UserId(maybeAuth.uid));
        }
      },
    );
  },
);
