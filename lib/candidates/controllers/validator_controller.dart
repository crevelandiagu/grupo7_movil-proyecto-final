import 'package:get/get.dart';

class ValidatorController extends GetxController {
  
  var email = false.obs;
  var password = false.obs;
  var isPasswordEqual = false.obs;
  

  void validateEmail(String emailStr) {
    if (!GetUtils.isEmail(emailStr)) {
      email.value = false; 
    } else {
      email.value = true;
    }
  }

  void validatePassword(String passwordStr) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    
    if (!regex.hasMatch(passwordStr)) {
      password.value = false;
      return;
    }

    password.value = true;

  }

  void validateEqualPassword(String password1, String password2) {


    if (password1.isNotEmpty && password2.isNotEmpty) {

      if (password1 == password2) {
          isPasswordEqual.value = true;
      } else {
        isPasswordEqual.value = false;
      }

    } else {
      isPasswordEqual.value = false;
    }

  }

}
