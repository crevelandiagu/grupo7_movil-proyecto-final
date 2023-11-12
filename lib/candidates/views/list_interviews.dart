import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/interviews_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class ListInterviews extends StatelessWidget {
  const ListInterviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 2),
      body: FutureBuilder<List<dynamic>>(
        future: mockData(),
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
                  DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.link)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.result)),
                ],
                source: interviews,
                rowsPerPage: 8,
                horizontalMargin: 15,
                columnSpacing: 80,
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
  await Future.delayed(Duration(milliseconds: 2000));
  var list = [
    {
      "date_interview": "1988/09/19",
      "company_id": 1,
      "company_name": "company 1"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 2,
      "company_name": "company 2"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 3,
      "company_name": "company 3"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 4,
      "company_name": "company 4"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 5,
      "company_name": "company 5"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 6,
      "company_name": "company 6"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 7,
      "company_name": "company 7"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 8,
      "company_name": "company 8"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 9,
      "company_name": "company 9"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 10,
      "company_name": "company 10"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 11,
      "company_name": "company 11"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 12,
      "company_name": "company 12"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 13,
      "company_name": "company 13"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 14,
      "company_name": "company 14"
    },
    {
      "date_interview": "1988/09/19",
      "company_id": 15,
      "company_name": "company 15"
    },
  ];

  return list;
}
