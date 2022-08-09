import 'package:flutter/material.dart';
import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/local/local_auth_provider.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocalProviderScope extends ConsumerWidget {
  const LocalProviderScope({
    required this.state,
    required this.child,
    super.key,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maybeAuth = ref.read(authProvider).value;
    final maybeUser = ref.read(userProvider).value;
    final maybeTab = HomeTab.parse(state.params[ParamKeys.tab.value]);
    final maybeTaskId = state.params[ParamKeys.taskId.value];
    final innerTab = InnerTab.parse(state.queryParams[QueryParamKeys.innerTab]);
    return ProviderScope(
      overrides: [
        if (maybeAuth != null) localAuthProvider.overrideWithValue(maybeAuth),
        if (maybeUser != null) localUserProvider.overrideWithValue(maybeUser),
        if (maybeTab != null) localTabParamProvier.overrideWithValue(maybeTab),
        if (maybeTaskId != null)
          localTaskIdParamProvier.overrideWithValue(TaskId(maybeTaskId)),
        localInnerTabProvier.overrideWithValue(innerTab),
      ],
      child: child,
    );
  }
}
