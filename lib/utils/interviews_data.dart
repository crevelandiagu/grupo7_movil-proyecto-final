import 'package:flutter/material.dart';
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
        DataCell(
          Text(Jiffy.parse(data[index]['date_interview'].toString()).yMMMMdjm),
        ),
        DataCell(Text(AppLocalizations.of(context!)!.interviewLink)),
        DataCell(
          Text(AppLocalizations.of(context!)!.result),
        ),
      ],
    );
  }
}
