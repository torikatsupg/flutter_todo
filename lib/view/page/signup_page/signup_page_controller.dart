import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/view/page/signup_page/signup_page_controller.freezed.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupController, _SignupState>(
        SignupController.new);

class SignupController extends StateNotifier<_SignupState> {
  SignupController(Ref ref)
      : _read = ref.read,
        super(_SignupState(
          email: createFormModel(emailValidator),
          password: createFormModel(passwordValidator),
          confirmPassword: createFormModel(mandatoryValidator),
        )) {
    state.email.setListeners(onChangedEmail, onFocusChangeEmail);
    state.password.setListeners(onChangedPassword, onFocusChangePassword);
    state.confirmPassword
        .setListeners(onChangedConfirmPassword, onFocusChangeConfirmPassword);
  }

  final Reader _read;

  void onFocusChangeEmail() =>
      state = state.copyWith(email: state.email.onFocusChange());

  void onFocusChangePassword() =>
      state = state.copyWith(password: state.password.onFocusChange());

  void onFocusChangeConfirmPassword() => state =
      state.copyWith(confirmPassword: state.confirmPassword.onFocusChange());

  void onChangedEmail() =>
      state = state.copyWith(email: state.email.onChangeText());

  void onChangedPassword() =>
      state = state.copyWith(password: state.password.onChangeText());

  void onChangedConfirmPassword() => state =
      state.copyWith(confirmPassword: state.confirmPassword.onChangeText());

  void toSignin() => _read(routerProvider).go_('/signin');

  Future<void> submit() async {
    return _read(loadingProvider.notifier).run(
      () async {
        state = state.onSubmit();
        if (!state.isValidAll) {
          return;
        }

        final result = await _read(authenticatorProvider).signup(
          email: state.email.text,
          password: state.password.text,
        );

        result.when(
          ok: (_) {},
          err: (e) {
            switch (e) {
              case SignupError.emailAlreadyInUse:
                state = state.copyWith(
                    email: state.email.addServerError('既に登録されたメールアドレスです'));
                break;
              case SignupError.network:
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
class _SignupState with _$_SignupState {
  factory _SignupState({
    required FormModel email,
    required FormModel password,
    required FormModel confirmPassword,
  }) = __SignupInputState;

  late final isValidAll =
      email.isValid && password.isValid && isValidConrirmPassword;

  late final isValidConrirmPassword = _confirmPasswordError == null;

  late final confirmPasswordError =
      confirmPassword.canDisplayError ? _confirmPasswordError : null;

  _SignupState onSubmit() => copyWith(
        email: email.onSubmit(),
        password: password.onSubmit(),
        confirmPassword: confirmPassword.onSubmit(),
      );

  String? get _confirmPasswordError {
    if (confirmPassword.errors != null) {
      return confirmPassword.errors;
    } else if (confirmPassword.controller.text != password.controller.text) {
      return 'パスワードと確認用パスワードが一致しません';
    } else {
      return null;
    }
  }

  _SignupState._();
}