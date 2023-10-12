import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
    if (passwordStr.length < 8) {
      password.value = false; 
    } else {
      password.value = true;
    }
  }

  void validateEqualPassword(String password1, String password2) {


    if (!password.value) {
      isPasswordEqual.value = false;
    }

/*     if (password1.isEmpty || password2.isEmpty) {
      isPasswordEqual.value = false;
    } */

    if (password1 == password2) {
      isPasswordEqual.value = true;
    }


  }

}