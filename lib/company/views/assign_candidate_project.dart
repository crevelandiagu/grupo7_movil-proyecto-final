import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/test_results_company.dart';
import 'package:abc_jobs/utils/candidate_project_data.dart';
import 'package:abc_jobs/utils/performance_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignCandidateProject extends StatelessWidget {
  AssignCandidateProject({super.key, required this.service});

  PerformanceService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigationCompany((index) => null, context, 2),
      body: FutureBuilder<List<dynamic>>(
        future: getDataMock(), //
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;

          var performances =
              AssignCanidateProjectData(data: data, context: context);

          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              PaginatedDataTable(
                header: Center(
                    child: Text(AppLocalizations.of(context)!.assignProject,
                        style: GoogleFonts.workSans(
                            fontSize: 20, fontWeight: FontWeight.w500))),
                columns: [
                  // DataColumn(
                  //     label: Text(AppLocalizations.of(context)!.project)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.candidate)),
                  // DataColumn(
                  //     label: Text(AppLocalizations.of(context)!.evaluator)),
                  // DataColumn(label: Text(AppLocalizations.of(context)!.score)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.assign)),
                ],
                source: performances,
                rowsPerPage: 8,
                horizontalMargin: 60,
                columnSpacing: 100,
                showCheckboxColumn: false,
              ),
            ],
          );
        },
      ),
    );
  }

  // Future<List<dynamic>> getData() {
  //   var arguments = Get.arguments;
  //   var string = arguments.search;

  //   return this.service.getAllSearchedCandidates(string);
  // }
}

Future<List<dynamic>> getDataMock() async {
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
