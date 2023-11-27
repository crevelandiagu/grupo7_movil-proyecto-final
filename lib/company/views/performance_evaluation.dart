import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/utils/performance_data_evaluation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformanceEvaluation extends StatelessWidget {
  PerformanceEvaluation({super.key, this.service});

  PerformanceService? service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigationCompany((index) => null, context, 1),
      body: FutureBuilder<List<dynamic>>(
        future: getData(), //?.getAllEvaluationsCompany(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;

          var performances = PerformanceDataEvaluation(
              data: data, context: context, service: service);

          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              PaginatedDataTable(
                header: Center(
                    child: Text(AppLocalizations.of(context)!.evaluation,
                        style: GoogleFonts.workSans(
                            fontSize: 20, fontWeight: FontWeight.w500))),
                columns: [
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.project)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.candidate)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.evaluator)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.score)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.comments)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.actions)),
                ],
                source: performances,
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

  Future<List<dynamic>> getData() async {
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
}
