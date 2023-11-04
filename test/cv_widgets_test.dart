import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/Education.dart';
import 'package:abc_jobs/candidates/views/certification.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cv_widgets_test.mocks.dart';

@GenerateMocks([CVService])
void main() {
  MockCVService service = MockCVService();

  // setUp((){
  //   service = MockCVService();

  // });

  Future<Map<String, dynamic>> personalInfo() async {
    // await Future.delayed(Duration(milliseconds: 5000));
    return {
      "initial_latter": "DH",
      "full_name": "Daniel Huertas",
      "email": "dan@gmail.com",
      "nacionality": "colombia",
      "phone_number": "1234567"
    };
  }

  Future<Map<String, dynamic>> experienceInfo() async {
    // await Future.delayed(Duration(milliseconds: 5000));
    return {
      "experience": [
        {
          "company_name": "company1",
          "start_date": "2007/07/23",
          "end_date": "2009/08/05",
          "position": "desarrollador",
          "skills": []
        },
      ],
    };
  }

  Future<Map<String, dynamic>> EducationInfo() async {
    // await Future.delayed(Duration(milliseconds: 5000));
    return {
      "education": [
        {
          "university": "university1",
          "subject": "subject1",
          "start_date": "2007/07/23",
          "end_date": "2009/08/05",
          "skills": []
        },
      ],
    };
  }

  Future<Map<String, dynamic>> certificationInfo() async {
    // await Future.delayed(Duration(milliseconds: 5000));
    return {
      "certificates": [
        {
          "name_certificate": "certificate1",
          "company": "company1",
          "expedition_date": "2007/07/23",
          "date_expiry": "2009/08/05",
        },
      ],
    };
  }

  testWidgets("test personal info", (WidgetTester tester) async {
    when(service.getResponseBasicInfo()).thenAnswer((_) => personalInfo());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Profile(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Experience"), findsOneWidget);
    expect(find.text("Education"), findsOneWidget);
    expect(find.text("Certification"), findsOneWidget);
    expect(find.text("DH"), findsOneWidget);
    expect(find.text("Daniel Huertas"), findsOneWidget);
    expect(find.text("dan@gmail.com"), findsOneWidget);
    expect(find.text("colombia"), findsOneWidget);
    expect(find.text("1234567"), findsOneWidget);
  });

  testWidgets("test experience info", (WidgetTester tester) async {
    when(service.getResponseExperience()).thenAnswer((_) => experienceInfo());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Experience(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Company"), findsOneWidget);
    expect(find.text("company1"), findsOneWidget);
    expect(find.text("Start Date"), findsOneWidget);
    // expect(find.text("12/07/2007"), findsOneWidget);
    expect(find.text("End Date"), findsOneWidget);
    // expect(find.text("05/08/2009"), findsOneWidget);
    expect(find.text("Position"), findsOneWidget);
    expect(find.text("desarrollador"), findsOneWidget);
  });
  testWidgets("test education info", (WidgetTester tester) async {
    when(service.getResponseEducation()).thenAnswer((_) => EducationInfo());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Education(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("University"), findsOneWidget);
    expect(find.text("university1"), findsOneWidget);
    expect(find.text("Grade"), findsOneWidget);
    expect(find.text("subject1"), findsOneWidget);

    expect(find.text("Start Date"), findsOneWidget);
    // expect(find.text("12/07/2007"), findsOneWidget);
    expect(find.text("End Date"), findsOneWidget);
    // expect(find.text("05/08/2009"), findsOneWidget);
  });
  testWidgets("test certification info", (WidgetTester tester) async {
    when(service.getResponseCertification())
        .thenAnswer((_) => certificationInfo());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Certification(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Certificate"), findsOneWidget);
    expect(find.text("certificate1"), findsOneWidget);
    expect(find.text("Organization"), findsOneWidget);
    expect(find.text("company1"), findsOneWidget);

    expect(find.text("Expedition Date"), findsOneWidget);
    // expect(find.text("12/07/2007"), findsOneWidget);
    expect(find.text("Expiration Date"), findsOneWidget);
    // expect(find.text("05/08/2009"), findsOneWidget);
  });
}
