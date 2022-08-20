import 'package:flutter_todo/model/form_model.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/infrastructure/authenticator_provider.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:flutter_todo/provider/global_controller/network_dialog_provider.dart';
import 'package:flutter_todo/provider/route/router_provider.dart';
import 'package:flutter_todo/provider/route/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/view/page/signup_page/signup_page_controller.freezed.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupController, _SignupState>(
        SignupController.new);

class SignupController extends StateNotifier<_SignupState> {
  SignupController(this._ref)
      : super(
          _SignupState(
            email: createFormModel(emailValidator),
            password: createFormModel(passwordValidator),
            confirmPassword: createFormModel(mandatoryValidator),
          ),
        ) {
    // TODO(torikatsu): validate confirm password correctly
    state = state.copyWith(
      confirmPassword: createFormModel(
        confirmPasswordValidator(() => state.password.text),
      ),
    );
  }

  final Ref _ref;

  void onChangedEmail(FormModel email) => state = state.copyWith(email: email);

  void onChangedPassword(FormModel password) =>
      state = state.copyWith(password: password);

  void onChangedConfirmPassword(FormModel confirmFormModel) =>
      state = state.copyWith(confirmPassword: confirmFormModel);

  void toSignin() => _ref.read(routerProvider).goNamed_(Routes.signIn);

  Future<void> submit() async {
    state = state.onSubmit();
    if (!state.isValidAll) {
      return;
    }
    return _ref.read(loadingProvider.notifier).run(
      () async {
        final result = await _ref.read(authenticatorProvider).signup(
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
class _SignupState with _$_SignupState {
  factory _SignupState({
    required FormModel email,
    required FormModel password,
    required FormModel confirmPassword,
  }) = __SignupInputState;

  _SignupState._();

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

  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
