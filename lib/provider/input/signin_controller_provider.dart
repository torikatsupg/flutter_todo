import 'package:flutter_todo/model/form_model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/firebase/authenticator_provider.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:flutter_todo/provider/input/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/input/signin_controller_provider.freezed.dart';

final signinControllerProvider =
    StateNotifierProvider.autoDispose<SigninNotifier, _SigninState>(
  (ref) => SigninNotifier(ref.read),
);

class SigninNotifier extends StateNotifier<_SigninState> {
  SigninNotifier(this._reader)
      : super(_SigninState(
          email: createFormModel(emailValidator),
          password: createFormModel(passwordValidator),
        )) {
    state.email.setListeners(onChangedEmail, onFocusChangeEmail);
    state.password.setListeners(onChangedPassword, onFocusChangePassword);
  }

  final Reader _reader;

  void onFocusChangeEmail() =>
      state = state.copyWith(email: state.email.onFocusChange());
  void onFocusChangePassword() =>
      state = state.copyWith(password: state.password.onFocusChange());
  void onChangedEmail() =>
      state = state.copyWith(email: state.email.onChangeText());
  void onChangedPassword() =>
      state = state.copyWith(password: state.password.onChangeText());

  Future<void> submit() async {
    _reader(loadingProvider.notifier).run(
      () async {
        state = state.onSubmit();
        // change focus process implicitly
        state.email.focusNode.unfocus();
        state.password.focusNode.unfocus();

        if (!state.isValidAll) {
          return;
        }

        final result = await _reader(authenticatorProvider).signin(
          email: state.email.text,
          password: state.password.text,
        );

        result.when(
          ok: (_) => _reader(routerProvider).go('/home'),
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
                _reader(networkDialogProvider.notifier).show();

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
