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
        DataCell(Text(data[index]['project_name'].toString())),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview'].toString()).yMMMMd),
        ),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview'].toString()).jm),
        ),
        DataCell(Text(AppLocalizations.of(context!)!.interviewLink)),
        DataCell(
          Text(AppLocalizations.of(context!)!.result),
          onTap: () {
            showDialog<void>(
                context: context!,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.result,
                            style: GoogleFonts.workSans(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 255, 82, 82)),
                          child: Text('reject',
                              style: GoogleFonts.workSans(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"))
                    ],
                  );
                });
          },
        ),
      ],
    );
  }
}
