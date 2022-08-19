import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/view/page/signin_page/signin_page_controller.freezed.dart';

final signinControllerProvider =
    StateNotifierProvider.autoDispose<SigninNotifier, _SigninState>(
  SigninNotifier.new,
);

class SigninNotifier extends StateNotifier<_SigninState> {
  SigninNotifier(this._ref)
      : super(
          _SigninState(
            email: createFormModel(emailValidator),
            password: createFormModel(passwordValidator),
          ),
        );

  final Ref _ref;

  void onChangeEmail(FormModel email) => state = state.copyWith(email: email);

  void onChangePassword(FormModel password) =>
      state = state.copyWith(password: password);

  void toSignup() => _ref.read(routerProvider).goNamed_(Routes.signUp);

  Future<void> submit() async {
    _ref.read(loadingProvider.notifier).run(
      () async {
        state = state.onSubmit();
        // TODO(torikatsu): change focus process implicitly
        state.email.unfocus();
        state.password.unfocus();

        if (!state.isValidAll) {
          return;
        }

        final result = await _ref.read(authenticatorProvider).signin(
              email: state.email.text,
              password: state.password.text,
            );

        result.when(
          ok: (_) {},
          err: (e) {
            switch (e) {
              case SigninError.userDisabled:
                state = state.copyWith(
                    email: state.email.addServerError('アカウントが無効です'));
                break;
              case SigninError.userNotFound:
                state = state.copyWith(
                    email: state.email.addServerError('アカウントが存在しません'));
                break;
              case SigninError.wrongPassword:
                state = state.copyWith(
                    password: state.password.addServerError('パスワードが違います'));
                break;
              case SigninError.network:
                _ref.read(networkDialogProvider.notifier).show();
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
class _SigninState with _$_SigninState {
  factory _SigninState({
    required FormModel email,
    required FormModel password,
  }) = __SigninInputState;

  _SigninState._();

  late final isValidAll = email.isValid && password.isValid;

  _SigninState onSubmit() => copyWith(
        email: email.onSubmit(),
        password: password.onSubmit(),
      );

  void dispose() {
    email.dispose();
    password.dispose();
  }
}
