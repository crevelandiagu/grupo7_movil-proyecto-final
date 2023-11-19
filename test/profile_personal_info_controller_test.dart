import 'package:abc_jobs/candidates/controllers/profile_personal_info_controller.dart';
import 'package:abc_jobs/candidates/controllers/profile_school_controller.dart';
import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProfilePersonalController? controller;

  setUp(() {
    controller = ProfilePersonalController();
  });

  group("test profile personal info controller", () {
    test("test initial values", () {
      expect(controller?.name.value, false);
      expect(controller?.lastname.value, false);
      expect(controller?.location.value, false);
      expect(controller?.phoneNumber.value, false);
      expect(controller?.numberId.value, false);
    });
    test("test name valid", () {
      var name = "name";
      controller?.validateName(name);
      expect(controller?.name.value, true);
    });
    test("test name invalid", () {
      var name = "";
      controller?.validateName(name);
      expect(controller?.name.value, false);
    });
    test("test lastname valid", () {
      var lastname = "lastname";
      controller?.validateLastname(lastname);
      expect(controller?.lastname.value, true);
    });
    test("test lastname invalid", () {
      var lastname = "";
      controller?.validateLastname(lastname);
      expect(controller?.lastname.value, false);
    });
    test("test numberId valid", () {
      var numberId = "33736836";
      controller?.validateNumberId(numberId);
      expect(controller?.numberId.value, true);
    });
    test("test numberId invalid", () {
      var numberId = "5454545454554545474";
      controller?.validateNumberId(numberId);
      expect(controller?.numberId.value, false);
    });
    test("test location invalid", () {
      var location = "";
      controller?.validateLocation(location);
      expect(controller?.location.value, false);
    });
    test("test location valid", () {
      var location = "location";
      controller?.validateLocation(location);
      expect(controller?.location.value, true);
    });
    test("test phone number valid", () {
      var phonenumber = "5545255";
      controller?.validatePhoneNumber(phonenumber);
      expect(controller?.phoneNumber.value, true);
    });
    test("test phone number", () {
      var phonenumber = "";
      controller?.validatePhoneNumber(phonenumber);
      expect(controller?.phoneNumber.value, false);
    });
    test("test form fields", () {
      controller?.name.value = true;
      controller?.lastname.value = true;
      controller?.numberId.value = true;
      controller?.location.value = true;
      controller?.phoneNumber.value = true;

      expect(controller?.validateFields(), true);
    });
  });
}
