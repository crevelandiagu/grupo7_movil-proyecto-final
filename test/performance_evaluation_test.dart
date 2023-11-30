import 'package:abc_jobs/company/views/performance_evaluation.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'assign_candidate_project_test.mocks.dart';

void main() {
  Future<List<dynamic>> mockData() async {
    var list = [
      {
        "project_name": "project 1",
        "candidate_name": "candidate 1",
        "score": null,
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

    expect(find.text("Performance evaluation"), findsOneWidget);
    expect(find.text("Score"), findsOneWidget);

    expect(find.text("Candidate"), findsOneWidget);
    expect(find.text("Project"), findsOneWidget);
    expect(find.text("Action"), findsOneWidget);

    expect(find.byType(PaginatedDataTable), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
  });
}
