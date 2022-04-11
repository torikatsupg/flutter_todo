import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = Provider((_) => Authenticator());

class Authenticator {
  Future<Result<void, SignupError>> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok();
    } on FirebaseAuthException catch (e) {
      final error = _SignupErrorExt.from(e.message);
      if (error != null) {
        return Result.err(error);
      } else {
        rethrow;
      }
    }
  }

  Future<Result<void, SigninError>> signin({
    required String email,
    required String password,
  }) async {
    try {
      // TODO(torikatsu): credentialsが必要な場面ってあるのかを調べる
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Result.ok();
    } on FirebaseAuthException catch (e) {
      final error = _SigninErrorExt.from(e.message);
      if (error != null) {
        return Result.err(error);
      } else {
        rethrow;
      }
    }
  }
}

//     SignupError.emailAlreadyinUse: "既に登録済みのメールアドレスです",
//     SignupError.invalidEmail: "不正なメールアドレスです",

const _networkErrorMessage =
    'Network error (such as timeout, interrupted connection or unreachable host) has occurred.';

extension _SignupErrorExt on SignupError {
  static const _map = {
    '**email-already-in-use**': SignupError.emailAlreadyInUse,
    '**invalid-email**': SignupError.invalidEmail,
    _networkErrorMessage: SignupError.network,
  };

  static SignupError? from(String? message) => _map[message];
}

enum SignupError {
  emailAlreadyInUse,
  invalidEmail,
  network,
}

extension _SigninErrorExt on SigninError {
  static const _map = {
    '**wrong-password**': SigninError.wrongPassword,
    '**user-disabled**': SigninError.userDisabled,
    '**user-not-found**': SigninError.userNotFound,
    _networkErrorMessage: SigninError.network,
  };

  static SigninError? from(String? message) => _map[message];
}

enum SigninError {
  wrongPassword,
  userDisabled,
  userNotFound,
  network,
}
