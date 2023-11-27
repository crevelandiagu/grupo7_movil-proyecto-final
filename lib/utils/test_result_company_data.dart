import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TestResultCompany extends DataTableSource {
  TestResultCompany({required this.data, this.context, required this.service});

  final data;
  BuildContext? context;
  PerformanceService service;

  final _formkey = GlobalKey<FormState>();

  TextEditingController scoreController = TextEditingController();
  TextEditingController commentController = TextEditingController();

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
        DataCell(Text(data[index]['project_name'])),
        DataCell(
          Text(data[index]['candidate_name']),
        ),
        DataCell(
          Text(data[index]['progress_status']),
        ),
        DataCell(Text(data[index]['score'] ?? "")),
        DataCell(
          Text(data[index]['comments']),
        ),
        DataCell(
          ElevatedButton(
            onPressed: data[index]['score'] == null
                ? () {
                    showDialog(
                        context: context!,
                        builder: (context) {
                          return AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: -40,
                                  top: -40,
                                  child: InkResponse(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: const CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: Icon(Icons.close),
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formkey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          initialValue: data[index]
                                              ['project_name'],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .project),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          initialValue: data[index]
                                              ['candidate_name'],
                                          readOnly: true,
                                          decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .candidate),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          controller: scoreController,
                                          decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .score),
                                          validator: (String? value) {
                                            if (value != null &&
                                                value.isEmpty) {
                                              return AppLocalizations.of(
                                                      context)!
                                                  .enterNumber;
                                            }
                                            try {
                                              double number =
                                                  double.parse(value!);
                                              if (number >= 0 &&
                                                  number <= 100) {
                                                return null;
                                              } else {
                                                return AppLocalizations.of(
                                                        context)!
                                                    .enterNumber0100;
                                              }
                                            } catch (e) {
                                              return AppLocalizations.of(
                                                      context)!
                                                  .invalidaNumberFormat;
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: TextFormField(
                                          controller: commentController,
                                          decoration: InputDecoration(
                                              labelText:
                                                  AppLocalizations.of(context)!
                                                      .comments),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                //llamada api
                                                // service.evaluarTest(
                                                //     score: int.parse(
                                                //         scoreController.text),
                                                //     assementId: int.parse(
                                                //         data[index]['id']));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(AppLocalizations
                                                          .of(context)!
                                                      .testEvaluationSuccess),
                                                  backgroundColor: Colors.green,
                                                ));

                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)!
                                                    .save)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                : null,
            child: Text(AppLocalizations.of(context!)!.evaluate),
          ),
        ),
      ],
    );
  }
}
