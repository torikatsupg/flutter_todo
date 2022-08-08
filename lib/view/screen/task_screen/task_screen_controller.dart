import 'package:flutter_todo/model/task.dart';
import 'package:flutter_todo/provider/route/pram.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskScreenControllerProvider =
    Provider<TaskScreenController>(TaskScreenController.new);

class TaskScreenController {
  TaskScreenController(Ref ref) : _read = ref.read;
  final Reader _read;

  void onTap(int index) {
    _read(routerProvider).goNamed_(
      Routes.home,
      params: {
        ParamKeys.tab: HomeTab.task.value,
      },
      queryParams: {
        QueryParamKeys.innerTab: InnerTab.fromIndex(index).value,
      },
    );
  }

  void toDetailPage(TaskId id) => _read(routerProvider).goNamed_(
        Routes.taskDetail,
        params: {
          ParamKeys.tab: HomeTab.task.value,
          ParamKeys.taskId: id.value,
        },
      );

  void onTapFab() {
    // _read(routerProvider).go('/home/task/create');
    // return;
    _read(routerProvider).goNamed_(
      Routes.taskCreate,
      params: {
        ParamKeys.tab: HomeTab.task.value,
      },
    );
  }
}
