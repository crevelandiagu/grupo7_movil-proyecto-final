
import 'package:abc_jobs/candidates/controllers/validator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("test validator controller", () {
  
    test("test email validator", () {

      
     final controller = ValidatorController();


      var email = "dan@gmail.com";

      controller.validateEmail(email);

      expect(controller.email.value, true);

    });
    test("test password validator", () {

      
     final controller = ValidatorController();


      var password = "1@Abcdef";

      controller.validatePassword(password);

      expect(controller.password.value, true);

    });
    test("test equal password validator", () {

      
     final controller = ValidatorController();


      var password1 = "1@Abcdef";
      var password2 = "1@Abcdef";

      controller.validateEqualPassword(password1, password2);

      expect(controller.isPasswordEqual.value, true);

    });

   });
}