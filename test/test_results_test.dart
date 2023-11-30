import 'package:abc_jobs/candidates/views/test_results.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import 'candidate_list_performance_test.mocks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  MockCandidatePerformanceService service = MockCandidatePerformanceService();

  Future<List<dynamic>> mockData() async {
    //await Future.delayed(Duration(milliseconds: 2000));
    var list = [
      {
        "project_name": "project 1",
        "company_name": "company 1",
        "score": "30",
      },
    ];

    return list;
  }

  testWidgets("result test candidate test", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;
    when(service.getAllTestResults()).thenAnswer((_) => mockData());

    await tester.pumpWidget(
      GetMaterialApp(
        home: TestResults(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Assesments"), findsWidgets);
    expect(find.text("Project"), findsWidgets);
    expect(find.text("Company"), findsWidgets);
    expect(find.text("Score"), findsWidgets);
  });
}
