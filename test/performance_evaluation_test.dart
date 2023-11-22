import 'package:abc_jobs/company/views/performance_evaluation.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'performance_results_test.mocks.dart';

void main() {
  Future<List<dynamic>> mockData() async {
    var list = [
      {
        "project": "project 1",
        "candidate": "candidate 1",
        "score": null,
        "evaluator": "evaluator 1",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 2",
        "candidate": "candidate 2",
        "score": "30",
        "evaluator": "evaluator 3",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 3",
        "candidate": "candidate 3",
        "score": null,
        "evaluator": "evaluator 3",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 4",
        "candidate": "candidate 4",
        "score": "30",
        "evaluator": "evaluator 4",
        "comments": "lorem ipsum ordo seclorum"
      },
      {
        "project": "project 5",
        "candidate": "candidate 5",
        "score": null,
        "evaluator": "evaluator 5",
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

  MockPerformanceService service = MockPerformanceService();

  testWidgets("performance evaluation company test",
      (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;
    when(service.getAllEvaluationsCompany()).thenAnswer((_) => mockData());

    await tester.pumpWidget(
      GetMaterialApp(
        home: PerformanceEvaluation(service: service),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.text("Evaluation"), findsOneWidget);
    expect(find.text("Score"), findsOneWidget);
    expect(find.text("Evaluator"), findsOneWidget);
    expect(find.text("Candidate"), findsOneWidget);
    expect(find.text("Project"), findsOneWidget);
    expect(find.text("Action"), findsOneWidget);
    expect(find.text("Comments"), findsOneWidget);
  });
}
