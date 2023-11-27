import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/assign_candidate_project.dart';
import 'package:abc_jobs/company/views/performace_results.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';

import 'performance_results_test.mocks.dart';

@GenerateMocks([PerformanceService])
void main() {
  MockPerformanceService service = MockPerformanceService();

  Future<List<dynamic>> mockData() async {
    //await Future.delayed(Duration(milliseconds: 2000));
    var list = [
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": "30",
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
    ];

    return list;
  }

  testWidgets("test assing candidate project", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    //when(service.getAllEvaluationsCompany()).thenAnswer((_) => mockData());

    await tester.pumpWidget(
      GetMaterialApp(
        home: AssignCandidateProject(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Assign project"), findsWidgets);
    expect(find.text("Candidate"), findsWidgets);
    expect(find.text("Assign"), findsWidgets);
  });
}
