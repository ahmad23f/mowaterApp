import 'package:Mowater/core/helper/reqexp.dart';

emailValidator(
  String? text,
) {
  if (text!.isEmpty) {
    return 'reqiuerd';
  } else {
    if (!AppRegex.isEmailValid(text)) {
      return 'Invalid email';
    }
  }
}

passwordValidator(String password) {
  if (password.length < 6) return "can' be less then 6 characr";
}

phoneNumberValidator(String password) {
  if (password.length < 9 || password.length > 10) {
    return 'invalid phone number';
  }
}

textValidator(String text) {
  if (text.length < 4) {
    return "can't be less then 4 character";
  }
}
