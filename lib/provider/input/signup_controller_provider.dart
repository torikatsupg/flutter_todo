import 'package:flutter_todo/model/form_model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/firebase/authenticator_provider.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:flutter_todo/provider/input/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/input/signup_controller_provider.freezed.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupNotifier, _SignupState>(
  (ref) => SignupNotifier(ref.read),
);

class SignupNotifier extends StateNotifier<_SignupState> {
  SignupNotifier(this._reader)
      : super(_SignupState(
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

  Future<void> submit() async => _reader(loadingProvider.notifier).run(
        () async {
          state = state.copyWith(
            email: state.email.copyWith(hasEdit: true),
            password: state.password.copyWith(hasEdit: true),
          );
          // change focus process implicitly
          state.email.focusNode.unfocus();
          state.password.focusNode.unfocus();

          if (!state.isValidAll) {
            return;
          }

          final result = await _reader(authenticatorProvider).signup(
            email: state.email.text,
            password: state.password.text,
          );

          result.when(
            ok: (_) => _reader(routerProvider).go('/home'),
            err: (e) {
              switch (e) {
                case SignupError.emailAlreadyInUse:
                  state = state.copyWith(
                      email: state.email.addServerError('既に登録されたメールアドレスです'));
                  break;
                case SignupError.invalidEmail:
                  state = state.copyWith(
                      email: state.email.addServerError('不正なメールアドレスです'));
                  break;
                case SignupError.network:
                  _reader(networkDialogProvider.notifier).show();
                  break;
              }
            },
          );
        },
      );

  @override
  void dispose() {
    state.email.dispose();
    state.password.dispose();
    super.dispose();
  }
}

@freezed
class _SignupState with _$_SignupState {
  factory _SignupState({
    required FormModel email,
    required FormModel password,
  }) = __SignupInputState;

  late final isValidAll = email.isValid && password.isValid;

  _SignupState._();
}
