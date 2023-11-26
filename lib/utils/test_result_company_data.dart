import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestResultCompany extends DataTableSource {
  TestResultCompany({required this.data, this.context});

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
        DataCell(Text(data[index]['project'])),
        DataCell(
          Text(data[index]['candidate']),
        ),
        DataCell(
          Text(data[index]['test']),
        ),
        DataCell(Text(data[index]['score'])),
        DataCell(
          Text(data[index]['comments']),
        )
      ],
    );
  }
}
