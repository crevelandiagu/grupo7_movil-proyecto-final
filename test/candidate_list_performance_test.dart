import 'package:abc_jobs/candidates/services/candidate_performance_service.dart';
import 'package:abc_jobs/candidates/views/candidate_list_performance.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'candidate_list_performance_test.mocks.dart';

@GenerateMocks([CandidatePerformanceService])
void main() {
  MockCandidatePerformanceService service = MockCandidatePerformanceService();

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

  testWidgets("test list performance candidate", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    when(service.getAllEvaluations()).thenAnswer((_) => mockData());

    await tester.pumpWidget(
      GetMaterialApp(
        home: PerformanceListCandidate(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    expect(find.byType(PaginatedDataTable), findsOneWidget);

    expect(find.text("Evaluation performance results"), findsWidgets);
    expect(find.text("Project"), findsWidgets);
    expect(find.text("Score"), findsWidgets);
    expect(find.text("Comments"), findsWidgets);
  });
}
