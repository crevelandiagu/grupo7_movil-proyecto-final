import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProfileWorkController? controller;

  setUp(() {
    controller = ProfileWorkController();
  });

  group("test profile work controller", () {
    test("test initial values", () {
      expect(controller?.position.value, false);
      expect(controller?.company.value, false);
      expect(controller?.startDate.value, false);
      expect(controller?.endDate.value, false);
    });
    test("test position valid", () {
      var position = "position";
      controller?.validatePosition(position);
      expect(controller?.position.value, true);
    });
    test("test position invalid", () {
      var position = "";
      controller?.validatePosition(position);
      expect(controller?.position.value, false);
    });
    test("test company", () {
      var company = "company";
      controller?.validatCompany(company);
      expect(controller?.company.value, true);
    });
    test("test company invalid", () {
      var company = "";
      controller?.validatCompany(company);
      expect(controller?.company.value, false);
    });

    test("test worktype", () {
      var worktype = "programer";
      controller?.validateWorktype(worktype);
      expect(controller?.workTye.value, true);
    });
    test("test worktype invalid", () {
      var worktype = "";
      controller?.validateWorktype(worktype);
      expect(controller?.workTye.value, false);
    });

    test("test form fields", () {
      controller?.company.value = true;
      controller?.position.value = true;
      controller?.startDate.value = true;
      controller?.endDate.value = true;
      controller?.workTye.value = true;

      expect(controller?.validateForm(), true);
    });
  });
}
