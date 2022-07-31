import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localAuthProvider = Provider<UserAuth>(
  (ref) => throw UnimplementedError(),
);

final localTaskIdParamProvier = Provider<TaskId>(
  (ref) => throw UnimplementedError(),
);

final localTabParamProvier = Provider<String>(
  (ref) => throw UnimplementedError(),
);
final localTodoQueryParamProvier = Provider<String>(
  (ref) => throw UnimplementedError(),
);