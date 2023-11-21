import 'package:abc_jobs/candidates/services/interview_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/interviews_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  //    DataColumn(
                  //        label: Text(AppLocalizations.of(context)!.project)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.date)),
                  DataColumn(label: Text(AppLocalizations.of(context)!.time)),
                  // DataColumn(label: Text(AppLocalizations.of(context)!.link)),
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
