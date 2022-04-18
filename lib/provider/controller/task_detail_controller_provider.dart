import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/provider/model/task_provider.dart';
import 'package:flutter_todo/provider/route/route_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskDetailControllerProvider = FutureProvider.autoDispose<Task?>((ref) {
  final uid = ref.watch(authProvider).uid;
  final id = ref.watch(idProvider);
  return ref.watch(taskFamily(TaskArg(uid: uid, id: id)).future);
});
