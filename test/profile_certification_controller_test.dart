import 'package:abc_jobs/candidates/controllers/profile_certification_controller.dart';
import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProfileCertificationController? controller;

  setUp(() {
    controller = ProfileCertificationController();
  });

  group("test profile work controller", () {
    test("test certification valid", () {
      var certification = "certification";
      controller?.validateCertification(certification);
      expect(controller?.certification.value, true);
    });
    test("test certification invalid", () {
      var certification = "";
      controller?.validateCertification(certification);
      expect(controller?.certification.value, false);
    });
    test("test initial values", () {
      expect(controller?.certification.value, false);
      expect(controller?.organization.value, false);
      expect(controller?.startDate.value, false);
      expect(controller?.endDate.value, false);
    });
    test("test organization valid ", () {
      var organization = "organization";
      controller?.validateOrganization(organization);
      expect(controller?.organization.value, true);
    });
    test("test organization invalid ", () {
      var organization = "";
      controller?.validateOrganization(organization);
      expect(controller?.organization.value, false);
    });
    test("test form fields", () {
      controller?.organization.value = true;
      controller?.certification.value = true;
      controller?.startDate.value = true;
      controller?.endDate.value = true;

      expect(controller?.validateFields(), true);
    });
  });
}
