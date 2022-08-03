import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/result.dart';
import 'package:flutter_todo/model/user.dart';

const _name = 'name';

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
            name: data[_name],
          ),
        );
      }
    } on dynamic catch (e) {
      // TODO(torikatsu): handle error correctly
      return Result.err(FirestoreError.error);
    }
  }
}
