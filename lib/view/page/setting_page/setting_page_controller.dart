import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/model/user_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/view/page/setting_page/setting_page_controller.freezed.dart';

final settingPageControllerProvider =
    StateNotifierProvider.family<SettingPageController, SettingPageState, User>(
  SettingPageController.new,
);

class SettingPageController extends StateNotifier<SettingPageState> {
  SettingPageController(this.ref, User initUser)
      : super(
          SettingPageState(
            initUser: initUser,
            username: createFormModel(mandatoryValidator),
          ),
        );

  final Ref ref;

  void onChangeUsername(FormModel username) =>
      state = state.copyWith(username: username);

  void onSubmit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }

    final nextUser = state.initUser.copyWith(username: state.username.text);
    ref.read(loadingProvider.notifier).run(
      () async {
        final result = await ref.read(userRepositoryProvider).update(nextUser);

        // TODO(torikatsu): handle result
        result.when(
          ok: (_) {},
          err: (e) {
            switch (e) {
              case FirestoreError.error:
                return;
              case FirestoreError.notFound:
                return;
              default:
                return;
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}

@freezed
class SettingPageState with _$SettingPageState {
  factory SettingPageState({
    required User initUser,
    required FormModel username,
  }) = _SettingPageState;

  SettingPageState._();

  late final isValidAll = username.isValid;

  SettingPageState onSubmit() => copyWith(username: username.onSubmit());

  void dispose() => username.dispose();
}
