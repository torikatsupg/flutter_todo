import 'package:flutter/material.dart';
import 'package:flutter_todo/model/validator.dart';
import 'package:flutter_todo/provider/input/loading_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/input/signup_controller_provider.freezed.dart';

final signupControllerProvider =
    StateNotifierProvider.autoDispose<SignupNotifier, _SignupState>(
  (ref) => SignupNotifier(ref.read),
);

class SignupNotifier extends StateNotifier<_SignupState> {
  SignupNotifier(this._reader)
      : super(
          _SignupState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            emailFocusNode: FocusNode(),
            passwordFocusNode: FocusNode(),
          ),
        ) {
    state.emailController
        .addListener(() => onChangedEmail(state.emailController.text));
    state.passwordController
        .addListener(() => onChangedPassword(state.passwordController.text));
    state.emailFocusNode
        .addListener(() => onFocusChangeEmail(state.emailFocusNode.hasFocus));
    state.passwordFocusNode.addListener(
        () => onFocusChangePassword(state.passwordFocusNode.hasFocus));
  }

  final Reader _reader;

  void onFocusChangeEmail(bool isFocused) =>
      state = state.copyWith(isFocusingEmail: isFocused, hasEditEmail: true);

  void onFocusChangePassword(bool isFocused) => state =
      state.copyWith(isFocusingPassword: isFocused, hasEditPassword: true);

  void onChangedEmail(String email) => state = state.copyWith(email: email);

  void onChangedPassword(String password) =>
      state = state.copyWith(password: password);

  Future<void> submit() async => _reader(loadingProvider.notifier).run(
        () async {
          state = state.copyWith(
            hasEditEmail: true,
            hasEditPassword: true,
          );
          if (state.isValidAll) {
            await Future.delayed(Duration(seconds: 1));
            // TODO(torikatsu): signup
          } else {}
        },
      );

  @override
  void dispose() {
    state.emailController.dispose();
    state.passwordController.dispose();
    state.emailFocusNode.dispose();
    state.passwordFocusNode.dispose();
    super.dispose();
  }
}

@freezed
class _SignupState with _$_SignupState {
  factory _SignupState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool hasEditEmail,
    @Default(false) bool hasEditPassword,
    @Default(false) bool isFocusingEmail,
    @Default(false) bool isFocusingPassword,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
  }) = __SignupInputState;

  late final emailError = _canDisplayEmailError ? _emailError : null;
  late final passwordError = _canDisplayPasswordError ? _passwordError : null;
  late final isValidAll = _isValidEmail && _isValidPassword;

  late final _canDisplayEmailError = !isFocusingEmail && hasEditEmail;
  late final _canDisplayPasswordError = !isFocusingPassword && hasEditPassword;
  late final _emailError = emailValidator(email);
  late final _passwordError = passwordValidator(password);
  late final _isValidEmail = _emailError == null;
  late final _isValidPassword = _passwordError == null;

  _SignupState._();
}
