import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = Provider(Authenticator.new);

class Authenticator {
  Authenticator(Ref ref) : _read = ref.read;
  final Reader _read;

  Future<Result<User?, SignupError>> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // wait for update of user
      await _read(userProvider.stream).first;
      return Result.ok(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return Result.err(SignupError.emailAlreadyInUse);
        case 'network-request-failed':
          return Result.err(SignupError.network);
        case 'invalid-email':
          rethrow;
        case 'operation-not-allowed':
          rethrow;
        case 'weak-password':
          rethrow;
        default:
          rethrow;
      }
    }
  }

  Future<Result<User?, SigninError>> signin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // wait for update of user
      await _read(userProvider.stream).first;
      return Result.ok(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          return Result.err(SigninError.userDisabled);
        case 'user-not-found':
          return Result.err(SigninError.userNotFound);
        case 'wrong-password':
          return Result.err(SigninError.wrongPassword);
        case 'network-request-failed':
          return Result.err(SigninError.network);
        case 'invalid-email':
          rethrow;
        default:
          rethrow;
      }
    }
  }

  Future<Result<void, SignOutError>> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // wait for update of user
      await _read(userProvider.stream).first;
      return Result.ok(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          return Result.err(SignOutError.network);
        default:
          rethrow;
      }
    }
  }
}

enum SignupError {
  emailAlreadyInUse,
  network,
}

enum SigninError {
  wrongPassword,
  userDisabled,
  userNotFound,
  network,
}

enum SignOutError { network }
