import 'package:flutter_todo/model/form_model/form_model.dart';
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
      : super(_SignupState(
          email: createFormModel(emailValidator),
          password: createFormModel(passwordValidator),
        )) {
    state.email.setListeners(onChangedText, onFocusChangeEmail);
    state.password.setListeners(onChangedText, onFocusChangePassword);
  }

  final Reader _reader;

  void onFocusChangeEmail() => state = state.copyWith.email(hasEdit: true);
  void onFocusChangePassword() =>
      state = state.copyWith.password(hasEdit: true);
  void onChangedText() => state = state.copyWith();

  Future<void> submit() async => _reader(loadingProvider.notifier).run(
        () async {
          state = state.copyWith(
            email: state.email.copyWith(hasEdit: true),
            password: state.password.copyWith(hasEdit: true),
          );
          // change focus process implicitly
          state.email.focusNode.unfocus();
          state.password.focusNode.unfocus();

          if (state.isValidAll) {
            await Future.delayed(Duration(seconds: 1));
            print(state.email.controller.text);
            print(state.password.controller.text);
            // TODO(torikatsu): signup
          } else {}
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
  factory _SignupState(
      {required FormModel email,
      required FormModel password}) = __SignupInputState;

  late final isValidAll = email.isValid && password.isValid;

  _SignupState._();
}
