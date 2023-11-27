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
      {
        "date_interview": "1988/09/19",
        "company_id": 2,
        "company_name": "company 2",
        "project_name": "project 2",
        "status": "reject",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 3,
        "company_name": "company 3",
        "project_name": "project 3",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 4,
        "company_name": "company 4",
        "project_name": "project 4",
        "status": "in procress",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 5,
        "company_name": "company 5",
        "project_name": "project 5",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 6,
        "company_name": "company 6",
        "project_name": "project 6",
        "status": "reject",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 7,
        "company_name": "company 7",
        "project_name": "project 7",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 8,
        "company_name": "company 8",
        "project_name": "project 8",
        "status": "reject",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 9,
        "company_name": "company 9",
        "project_name": "project 9",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 10,
        "company_name": "company 10",
        "project_name": "project 10",
        "status": "in procress",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 11,
        "company_name": "company 11",
        "project_name": "project 11",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 12,
        "company_name": "company 12",
        "project_name": "project 12",
        "status": "reject",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 13,
        "company_name": "company 13",
        "project_name": "project 13",
        "status": "in procress",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 14,
        "company_name": "company 14",
        "project_name": "project 14",
        "status": "pass",
        "score": "30"
      },
      {
        "date_interview": "1988/09/19",
        "company_id": 15,
        "company_name": "company 15",
        "project_name": "project 15",
        "status": "reject",
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
  });
}
