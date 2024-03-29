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
    state.email.initialize(_onChangeEmail);
    state.password.initialize(_onChangePassword);
    state.confirmPassword.initialize(_onChangeConfirmPassword);
  }

  void _onChangeEmail(FormModel email) {
    state = state.copyWith(email: email);
  }

  void _onChangePassword(FormModel password) {
    state = state.copyWith(
      password: password,
      confirmPassword: _validateConfirmPassword(
        password,
        state.confirmPassword,
      ),
    );
  }

  void _onChangeConfirmPassword(FormModel confirmPassword) {
    state = state.copyWith(
      confirmPassword: _validateConfirmPassword(
        state.password,
        confirmPassword,
      ),
    );
  }

  final Ref _ref;

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

  FormModel _validateConfirmPassword(
      FormModel password, FormModel confirmPassword) {
    return confirmPassword.copyWith(
      additionalValidationError:
          confirmPasswordValidator(password.text, confirmPassword.text),
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
      email.isValid && password.isValid && confirmPassword.isValid;

  _SignupState onSubmit() => copyWith(
        email: email.onSubmit(),
        password: password.onSubmit(),
        confirmPassword: confirmPassword.onSubmit().copyWith(
              additionalValidationError: confirmPasswordValidator(
                password.text,
                confirmPassword.text,
              ),
            ),
      );

  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
}
