import 'package:abc_jobs/candidates/services/candidate_performance_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/test_result_candidate_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class TestResults extends StatelessWidget {
  TestResults({super.key, required this.service});

  CandidatePerformanceService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 2),
      body: FutureBuilder<List<dynamic>>(
        future: service.getAllTestResults(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;

          var testResults = TestResultCandidate(data: data, context: context);

          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              PaginatedDataTable(
                header: Center(
                    child: Text(AppLocalizations.of(context)!.testResults,
                        style: GoogleFonts.workSans(
                            fontSize: 20, fontWeight: FontWeight.w500))),
                columns: [
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.project)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.company)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.test)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.score)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.comments)),
                ],
                source: testResults,
                rowsPerPage: 8,
                horizontalMargin: 15,
                columnSpacing: 70,
                showCheckboxColumn: false,
              ),
            ],
          );
        },
      ),
    );
  }
}

// Future<List<dynamic>> mockData() async {
//   //await Future.delayed(Duration(milliseconds: 2000));
//   var list = [
//     {
//       "project": "project 1",
//       "company": "company 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "company 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "candidate 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "candidate 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "candidate 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "candidate 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//     {
//       "project": "project 1",
//       "company": "candidate 1",
//       "score": "30",
//       "test": "evaluator 1",
//       "comments": "lorem ipsum ordo seclorum"
//     },
//   ];

//   return list;
// }
