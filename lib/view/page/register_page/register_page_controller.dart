import 'package:flutter_todo/infrastructure/firestore_error.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/infrastructure/user_provider.dart';
import 'package:flutter_todo/provider/model/user_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/view/page/register_page/register_page_controller.freezed.dart';

final registerPageControllerProvider = StateNotifierProvider.autoDispose
    .family<RegisterPageController, RegisterPageState, UserId>(
  RegisterPageController.new,
);

class RegisterPageController extends StateNotifier<RegisterPageState> {
  RegisterPageController(this._ref, this._userid)
      : super(
          RegisterPageState(
            username: createFormModel(
              mandatoryValidator,
            ),
          ),
        );

  final Ref _ref;
  final UserId _userid;

  void onChangeUsername(FormModel username) =>
      state = state.copyWith(username: username);

  Future<void> submit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }
    final result = await _ref.read(userRepositoryProvider).register(
          id: _userid,
          username: state.username.text,
        );

    await _ref.read(loadingProvider.notifier).run(
      () async {
        await result.when(
          ok: (_) async {
            // refresh user and wait for update of user
            _ref.refresh(authProvider);
            await _ref.read(userProvider.stream).first;
          },
          err: (e) async {
            switch (e) {
              case FirestoreError.error:
                state = state.copyWith(
                  username: state.username.addServerError('error has occured'),
                );
                break;
              case FirestoreError.notFound:
                state = state.copyWith(
                  username: state.username.addServerError('error has occured'),
                );
                break;
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
class RegisterPageState with _$RegisterPageState {
  factory RegisterPageState({
    required FormModel username,
  }) = _RegisterPageState;

  RegisterPageState._();

  RegisterPageState onSubmit() => copyWith(
        username: username.onSubmit(),
      );

  late final bool isValidAll = username.isValid;

  void dispose() => username.dispose();
}
