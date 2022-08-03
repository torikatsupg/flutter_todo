import 'package:flutter_todo/infrastructure/user_repository_impl.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(),
);
