import 'package:abc_jobs/candidates/services/candidate_performance_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/utils/test_result_candidate_data.dart';
import 'package:abc_jobs/utils/test_result_company_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class TestResultsCompanyView extends StatelessWidget {
  TestResultsCompanyView({super.key, required this.service});

  PerformanceService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigationCompany((index) => null, context, 1),
      body: FutureBuilder<List<dynamic>>(
        future: mockData(), //.getAllTestResults(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;

          var testResults =
              TestResultCompany(data: data, context: context, service: service);

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
                      label: Text(AppLocalizations.of(context)!.candidate)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.test)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.score)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.comments)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.actions)),
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

Future<List<dynamic>> mockData() async {
  //await Future.delayed(Duration(milliseconds: 2000));
  var list = [
    {
      "project_name": "project 1",
      "candidate_name": "company 1",
      "score": null,
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "company 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "candidate 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "candidate 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "candidate 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "candidate 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
    {
      "project_name": "project 1",
      "candidate_name": "candidate 1",
      "score": "30",
      "progress_status": "evaluator 1",
      "comments": "lorem ipsum ordo seclorum"
    },
  ];

  return list;
}
