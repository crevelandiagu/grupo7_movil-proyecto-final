import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/assign_candidate_project.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';

import 'assign_candidate_project_test.mocks.dart';

@GenerateMocks([PerformanceService])
void main() {
  MockPerformanceService service = MockPerformanceService();

  Future<List<dynamic>> mockData1() async {
    //await Future.delayed(Duration(milliseconds: 2000));
    var list = [
      {
        "project_name": "project 1",
        "id": "1",
      },
    ];

    return list;
  }

  Future<List<dynamic>> mockData2() async {
    //await Future.delayed(Duration(milliseconds: 2000));
    var list = [
      {"lastName": "lastName", "name": "name", "candidateId": "1"},
    ];

    return list;
  }

  testWidgets("test assing candidate project", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    when(service.buscarCandidatoParaProyecto()).thenAnswer((_) => mockData2());
    when(service.getAllProjects()).thenAnswer((_) => mockData1());

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

    expect(find.text("Assign project"), findsNothing);
    // expect(find.text("Candidate"), findsWidgets);
    // expect(find.text("Start Process"), findsWidgets);
  });
}
