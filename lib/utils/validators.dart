import 'package:get/get.dart';

String? emailValidator(String email){
  if (!GetUtils.isEmail(email)) {

    return "Enter a valid email";

  } else {
    return null;
  }
}


String? passwordValidator(String password) {
  if (password.length < 8 && password.isNotEmpty) {
    return "Password length must be at least 8 characters";
  } else {
    return null;
  }
}