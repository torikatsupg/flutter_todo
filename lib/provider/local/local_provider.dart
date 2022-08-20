import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/model/user_auth.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localAuthProvider = Provider<UserAuth>(
  (ref) => throw UnimplementedError(),
);

final localUserProvider = Provider<User>(
  (ref) => throw UnimplementedError(),
);

final localTaskIdParamProvier = Provider<TaskId>(
  (ref) => throw UnimplementedError(),
);

final localTabParamProvier = Provider<HomeTab>(
  (ref) => throw UnimplementedError(),
);
final localInnerTabProvier = Provider<InnerTab>(
  (ref) => throw UnimplementedError(),
);
