import 'package:get/get.dart';

class ProfilePersonalController extends GetxController {

  var name = false.obs;
  var lastname = false.obs;
  var numberId = false.obs;
  var phoneNumber = false.obs;
  var location = false.obs;


validateName(String value) {

  name.value = false;

  if (value.isNotEmpty) {
    name.value = true;
  } else {
    name.value = false;
  }

}

validateLastname(String value) {

  lastname.value = false;

  if (value.isNotEmpty) {
    lastname.value = true;
  } else {
    lastname.value = false;
  }

}

validateNumberId(String value) {
 // numberId.value = true;
 numberId.value = false;

  if (value.length < 12 && value.isNotEmpty) {
    numberId.value = true;
  } else {
    numberId.value = false;
  }

}

validateLocation(String value) {

  location.value = false;

  if (value.isNotEmpty) {
    location.value  =  true;
  } else {
    location.value = false;
  }

}


bool validateFields() {

  if (numberId.value && phoneNumber.value && name.value && lastname.value && location.value) {
    return true;
  } else {
    return false;
  }
}

validatePhoneNumber(String value) {
 // numberId.value = true;
 phoneNumber.value = false;

  if (value.isNotEmpty) {
    phoneNumber.value = true;
  } else {
    phoneNumber.value = false;
  }

}



}

