final emailExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

final passwordExp = RegExp(r"^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])[a-zA-Z\d]{8,}$");

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '必須項目です';
  } else if (!emailExp.hasMatch(value)) {
    return '不正な形式です';
  } else {
    return null;
  }
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '必須項目です';
  } else if (!passwordExp.hasMatch(value)) {
    return '半角英数字(大文字小文字)8文字以上で入力してください';
  } else {
    return null;
  }
}

String? mandatoryValidator(String? value) {
  if (value == null || value.isEmpty) {
    return '必須項目です';
  } else {
    return null;
  }
}
