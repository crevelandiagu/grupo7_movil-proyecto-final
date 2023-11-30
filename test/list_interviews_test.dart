import 'dart:convert';

import 'package:abc_jobs/candidates/services/interview_service.dart';
import 'package:abc_jobs/candidates/views/list_interviews.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'auth_service_test.mocks.dart';
import 'list_interviews_test.mocks.dart';

//class Client extends Mock implements http.Client {}

@GenerateMocks([InterviewService])
void main() {
  MockInterviewService service = MockInterviewService();

  Future<List<dynamic>> mockData() async {
    //await Future.delayed(Duration(milliseconds: 2000));
    var list = [
      {
        "date_interview": "1988/09/19",
        "company_id": 1,
        "company_name": "company 1",
        "project_name": "project 1",
        "status": "pass",
        "score": "30"
      },
    ];

    return list;
  }

  testWidgets("test list intervies view", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    // when(client.get(Uri.parse(""), headers: buildHeaders()))
    //     .thenAnswer((_) async => http.Response('[]', 200));

    when(service.getInterviewsCanditate()).thenAnswer((_) => mockData());

    await tester.pumpWidget(
      GetMaterialApp(
        home: ListInterviews(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Interviews"), findsWidgets);
    expect(find.text("Company"), findsWidgets);
    expect(find.text("Result"), findsWidgets);
    // expect(find.text("Link"), findsWidgets);
    expect(find.text("Date"), findsWidgets);
    //  expect(find.text("Project"), findsWidgets);
    expect(find.text("Time"), findsWidgets);
    expect(find.text("Score"), findsWidgets);
  });
}
