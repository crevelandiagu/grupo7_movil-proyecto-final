import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InterviewsData extends DataTableSource {
  InterviewsData({required this.data, this.context});

  final data;
  BuildContext? context;

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => data.length;
  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(data[index]['company_name'].toString())),
        //    DataCell(Text(data[index]['project_name'].toString())),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview'].toString()).yMMMMd),
        ),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview'].toString()).jm),
        ),
        //  DataCell(Text(AppLocalizations.of(context!)!.interviewLink)),
        DataCell(
          Text(AppLocalizations.of(context!)!.result),
          onTap: () {
            showDialog<void>(
                context: context!,
                builder: (BuildContext context) {
                  final status = data[index]['status'].toString();
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(AppLocalizations.of(context)!.result,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: colorStatus(status)),
                                child: Text(status,
                                    style: GoogleFonts.workSans(
                                        color: status == 'in process'
                                            ? Colors.black87
                                            : Colors.white70,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(AppLocalizations.of(context)!.project,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Text(data[index]['project_name'],
                                    style: GoogleFonts.workSans(
                                        color: Colors.black87,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(AppLocalizations.of(context)!.link,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                    AppLocalizations.of(context)!.interviewLink,
                                    style: GoogleFonts.workSans(
                                        color: Colors.blueAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(AppLocalizations.of(context)!.ok))
                    ],
                  );
                });
          },
        ),
      ],
    );
  }

  Color colorStatus(String value) {
    switch (value) {
      case "reject":
        return const Color.fromARGB(255, 255, 82, 82);
      case "pass":
        return const Color.fromARGB(255, 76, 175, 80);
      default:
        return const Color.fromARGB(255, 130, 177, 255);
    }
  }
}
