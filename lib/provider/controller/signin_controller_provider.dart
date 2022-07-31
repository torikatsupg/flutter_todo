import 'package:flutter_todo/provider/infrastructure/auth_provider.dart';
import 'package:flutter_todo/model/app_error.dart';
import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/controller/signin_controller_provider.freezed.dart';

final signinControllerProvider =
    StateNotifierProvider.autoDispose<SigninNotifier, _SigninState>(
  SigninNotifier.new,
);

class SigninNotifier extends StateNotifier<_SigninState> {
  SigninNotifier(Ref ref)
      : _read = ref.read,
        super(
          _SigninState(
            email: createFormModel(emailValidator),
            password: createFormModel(passwordValidator),
          ),
        ) {
    state.email.setListeners(onChangedEmail, onFocusChangeEmail);
    state.password.setListeners(onChangedPassword, onFocusChangePassword);
  }

  final Reader _read;

  void onFocusChangeEmail() =>
      state = state.copyWith(email: state.email.onFocusChange());
  void onFocusChangePassword() =>
      state = state.copyWith(password: state.password.onFocusChange());
  void onChangedEmail() =>
      state = state.copyWith(email: state.email.onChangeText());
  void onChangedPassword() =>
      state = state.copyWith(password: state.password.onChangeText());

  void toSignup() => _read(routerProvider).go_('/signup', _read);

  Future<void> submit() async {
    _read(loadingProvider.notifier).run(
      () async {
        state = state.onSubmit();
        // TODO(torikatsu): change focus process implicitly
        state.email.focusNode.unfocus();
        state.password.focusNode.unfocus();

        if (!state.isValidAll) {
          return;
        }

        final result = await _read(authenticatorProvider).signin(
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
                _read(networkDialogProvider.notifier).show();
                break;
            }
          },
        );
      },
    );
  }
}

@freezed
class _SigninState with _$_SigninState {
  factory _SigninState({
    required FormModel email,
    required FormModel password,
  }) = __SigninInputState;

  late final isValidAll = email.isValid && password.isValid;

  _SigninState onSubmit() => copyWith(
        email: email.onSubmit(),
        password: password.onSubmit(),
      );

  _SigninState._();
}
