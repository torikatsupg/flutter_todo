import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = Provider((ref) => Authenticator(ref.read));

class Authenticator {
  Authenticator(this._reader);

  final Reader _reader;

  Future<Result<void, SignupError>> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Result.ok();
    } on FirebaseAuthException catch (e) {
      switch (e.message) {
        case '**email-already-in-use**':
          return Result.err(SignupError.emailAlreadyinUse);
        case '**invalid-email**':
          return Result.err(SignupError.invalidEmail);
        case '**operation-not-allowed**':
          rethrow;
        case '**weak-password**':
          rethrow;
        default:
          rethrow;
      }
    }
  }
}

// TODO(torikatsu): 置き場を考える
enum SignupError { emailAlreadyinUse, invalidEmail }

extension SignupErrorExt on SignupError {
  static const _map = {
    SignupError.emailAlreadyinUse: "既に登録済みのメールアドレスです",
    SignupError.invalidEmail: "不正なメールアドレスです",
  };

  String get toDisplayMessage => _map[this]!;
}
