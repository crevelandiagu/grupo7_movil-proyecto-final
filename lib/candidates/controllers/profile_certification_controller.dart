import 'package:get/get.dart';

class ProfileCertificationController extends GetxController {

  var certification = false.obs;
  var organization = false.obs;
  var startDate = false.obs;
  var endDate = false.obs;


  validateCertification(String value) {
    
    certification.value = false;

    if (value.isNotEmpty) {
      certification.value = true;
    } else {
      certification.value = false;
    }
  }

  validateOrganization(String value) {
    organization.value = false;

    if (value.isNotEmpty) {
      organization.value = true;
    } else {
      organization.value = false;
    }
  }


  bool validateFields() {
    if (certification.value && organization.value && endDate.value && startDate.value) {
      return true;
    } else {
      return false;
    }
  }


}