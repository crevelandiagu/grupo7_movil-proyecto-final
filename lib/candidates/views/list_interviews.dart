import 'package:abc_jobs/candidates/services/interview_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/interviews_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ListInterviews extends StatelessWidget {
  ListInterviews({super.key, required this.service});

  InterviewService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 2),
      body: FutureBuilder<List<dynamic>>(
        future: service.getInterviewsCanditate(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;

          var interviews = InterviewsData(data: data, context: context);

          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              PaginatedDataTable(
                header: Center(
                    child: Text(AppLocalizations.of(context)!.interviews,
                        style: GoogleFonts.workSans(
                            fontSize: 20, fontWeight: FontWeight.w500))),
                columns: [
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.company)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.score)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.time)),
                  DataColumn(
                      label: Text(AppLocalizations.of(context)!.details)),
                ],
                source: interviews,
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
//       "date_interview": "1988/09/19",
//       "company_id": 1,
//       "company_name": "company 1",
//       "project_name": "project 1",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 2,
//       "company_name": "company 2",
//       "project_name": "project 2",
//       "status": "reject",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 3,
//       "company_name": "company 3",
//       "project_name": "project 3",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 4,
//       "company_name": "company 4",
//       "project_name": "project 4",
//       "status": "in procress",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 5,
//       "company_name": "company 5",
//       "project_name": "project 5",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 6,
//       "company_name": "company 6",
//       "project_name": "project 6",
//       "status": "reject",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 7,
//       "company_name": "company 7",
//       "project_name": "project 7",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 8,
//       "company_name": "company 8",
//       "project_name": "project 8",
//       "status": "reject",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 9,
//       "company_name": "company 9",
//       "project_name": "project 9",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 10,
//       "company_name": "company 10",
//       "project_name": "project 10",
//       "status": "in procress",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 11,
//       "company_name": "company 11",
//       "project_name": "project 11",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 12,
//       "company_name": "company 12",
//       "project_name": "project 12",
//       "status": "reject",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 13,
//       "company_name": "company 13",
//       "project_name": "project 13",
//       "status": "in procress",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 14,
//       "company_name": "company 14",
//       "project_name": "project 14",
//       "status": "pass",
//       "score": "30"
//     },
//     {
//       "date_interview": "1988/09/19",
//       "company_id": 15,
//       "company_name": "company 15",
//       "project_name": "project 15",
//       "status": "reject",
//       "score": "30"
//     },
//   ];

//   return list;
// }
