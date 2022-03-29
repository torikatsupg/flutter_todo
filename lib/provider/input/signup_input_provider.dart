import 'package:flutter_todo/model/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../generated/provider/input/signup_input_provider.freezed.dart';

// TODO(torikatsu): this file is not completed
final signupInputProvider =
    StateNotifierProvider.autoDispose<SignupInputNotifier, _SignupInputState>(
  (ref) => SignupInputNotifier(),
);

class SignupInputNotifier extends StateNotifier<_SignupInputState> {
  SignupInputNotifier() : super(_SignupInputState());

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPassword(String password) =>
      state = state.copyWith(password: password);

  void submit() {
    print(state);
  }
}

@freezed
class _SignupInputState with _$_SignupInputState {
  factory _SignupInputState({
    String? email,
    String? password,
  }) = __SignupInputState;

  late final emailValidationMessage = emailValidator(email);
  late final passwordValidationMessage = passwordValidator(password);

  late final isValidEmail = emailValidationMessage == null;
  late final isValidPassword = passwordValidationMessage == null;
  late final disableButton = !isValidEmail || !isValidPassword;

  _SignupInputState._();
}
