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
        DataCell(Text(data[index]['company_name'])),
        //    DataCell(Text(data[index]['project_name'].toString())),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview']).yMMMMd),
        ),
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview']).jm),
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
                      content: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        right: -40,
                        top: -40,
                        child: InkResponse(
                          onTap: () => Navigator.of(context).pop(),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(data[index]['status']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              data[index]['project_name'],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                                AppLocalizations.of(context)!.interviewLink),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(AppLocalizations.of(context)!.ok),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
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
