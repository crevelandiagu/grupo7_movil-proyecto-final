import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileSchoolController extends GetxController {
  var skills = [].obs;
  var school = false.obs;
  var degree = false.obs;
  var startDate = false.obs;
  var endDate = false.obs;
  var position = false.obs;

  bool validateFields() {
    if (school.value &&
        degree.value &&
        startDate.value &&
        endDate.value &&
        position.value) {
      return true;
    } else {
      return false;
    }
  }

  validateSchool(String value) {
    school.value = false;

    if (value.isNotEmpty) {
      school.value = true;
    } else {
      school.value = false;
    }
  }

  validatePosition(String value) {
    position.value = false;

    if (value.isNotEmpty) {
      position.value = true;
    } else {
      position.value = false;
    }
  }

  validateDegree(String value) {
    degree.value = false;

    if (value.isNotEmpty) {
      degree.value = true;
    } else {
      degree.value = false;
    }
  }
}
