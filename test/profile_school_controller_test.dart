import 'package:abc_jobs/candidates/controllers/profile_school_controller.dart';
import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProfileSchoolController? controller;

  setUp(() {
    controller = ProfileSchoolController();
  });

  group("test profile schoolcontroller", () {
    test("test initial values", () {
      expect(controller?.school.value, false);
      expect(controller?.degree.value, false);
      expect(controller?.startDate.value, false);
      expect(controller?.endDate.value, false);
    });
    test("test school valid", () {
      var school = "school";
      controller?.validateSchool(school);
      expect(controller?.school.value, true);
    });
    test("test school invalid", () {
      var school = "";
      controller?.validateSchool(school);
      expect(controller?.school.value, false);
    });
    test("test degree valid", () {
      var degree = "degree";
      controller?.validateDegree(degree);
      expect(controller?.degree.value, true);
    });
    test("test degree invalid", () {
      var degree = "";
      controller?.validateDegree(degree);
      expect(controller?.degree.value, false);
    });
    test("test form fields", () {
      controller?.school.value = true;
      controller?.degree.value = true;
      controller?.startDate.value = true;
      controller?.endDate.value = true;

      expect(controller?.validateFields(), true);
    });
  });
}
