import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = Provider(Authenticator.new);

class Authenticator {
  Authenticator(this._ref);
  final Ref _ref;

  Future<Result<User?, SignupError>> signup({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // wait for update of user
      await _ref.read(userProvider.stream).first;
      return Result.ok(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e, sc) {
      switch (e.code) {
        case 'email-already-in-use':
          return Result.err(SignupError.emailAlreadyInUse);
        case 'network-request-failed':
          return Result.err(SignupError.network);
        case 'invalid-email':
          logError(e, sc);
          rethrow;
        case 'operation-not-allowed':
          logError(e, sc);
          rethrow;
        case 'weak-password':
          logError(e, sc);
          rethrow;
        default:
          logError(e, sc);
          rethrow;
      }
    } catch (e, sc) {
      logError(e, sc);
      rethrow;
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
      await _ref.read(userProvider.stream).first;
      return Result.ok(FirebaseAuth.instance.currentUser);
    } on FirebaseAuthException catch (e, sc) {
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
          logError(e, sc);
          rethrow;
        default:
          logError(e, sc);
          rethrow;
      }
    } catch (e, sc) {
      logError(e, sc);
      rethrow;
    }
  }

  Future<Result<void, SignOutError>> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // wait for update of user
      await _ref.read(userProvider.stream).first;
      return Result.ok(null);
    } on FirebaseAuthException catch (e, sc) {
      switch (e.code) {
        case 'network-request-failed':
          return Result.err(SignOutError.network);
        default:
          logError(e, sc);
          rethrow;
      }
    } catch (e, sc) {
      logError(e, sc);
      rethrow;
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
