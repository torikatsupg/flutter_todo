import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/util/logger.dart';

const _username = 'username';

class UserRepositoryImpl extends UserRepository<FirestoreError> {
  @override
  Future<Result<User, FirestoreError>> findById(UserId id) async {
    try {
      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(id.value)
          .get();

      final data = result.data();
      if (data == null) {
        return Result.err(FirestoreError.notFound);
      } else {
        return Result.ok(
          User(
            userId: id,
            username: data[_username],
          ),
        );
      }
    } on dynamic catch (e, sc) {
      // TODO(torikatsu): handle error correctly
      logError(e, sc);
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<User, FirestoreError>> register({
    required UserId id,
    required String username,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(id.value).set(
        {
          _username: username,
        },
      );
      return Result.ok(
        User(
          userId: id,
          username: username,
        ),
      );
    } on dynamic catch (e, sc) {
      logError(e, sc);
      return Result.err(FirestoreError.error);
    }
  }

  @override
  Future<Result<void, FirestoreError>> update(User user) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.userId.value)
          .update(
        {
          _username: user.username,
        },
      );
      return Result.ok(null);
    } on dynamic catch (e, sc) {
      logError(e, sc);
      return Result.err(FirestoreError.error);
    }
  }
}
