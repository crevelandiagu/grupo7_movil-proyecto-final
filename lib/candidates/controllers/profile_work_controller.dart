import 'package:get/get.dart';

class ProfileWorkController extends GetxController {
  var workTye = "Tipo Trabajo 1".obs;
  var position = false.obs;
  var startDate = false.obs;
  var endDate = false.obs;
  var company = false.obs;
  var skills = [].obs;

// bool compareEndDateAfterStartDate(String dateStart, String dateEnd) {
//   var start = DateTime.parse(dateStart);
//   var end = DateTime.parse(dateEnd);

//   if (start.isAfter(end)) {
//     startDate.value ; endDate.value = false;
//     return false;
//   } else if (start.isAtSameMomentAs(end)) {
//     startDate.value ; endDate.value = false;
//     return false;
//   } else {
//     return true;
//   }

// }

  void validatePosition(String value) {
    position.value = false;

    if (value.isNotEmpty) {
      position.value = true;
    } else {
      position.value = false;
    }
  }

  void validatCompany(String value) {
    company.value = false;
    if (value.isNotEmpty) {
      company.value = true;
    } else {
      company.value = false;
    }
  }

  bool validateForm() {
    if (startDate.value &&
        endDate.value &&
        position.value &&
        workTye.value.isNotEmpty) {
      return true;
    }

    return false;
  }
}
