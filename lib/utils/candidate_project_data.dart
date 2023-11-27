import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:select_form_field/select_form_field.dart';

class AssignCanidateProjectData extends DataTableSource {
  AssignCanidateProjectData({required this.data, this.context});

  final data;
  BuildContext? context;

  String projectValue = "";

  final _formkey = GlobalKey<FormState>();

  TextEditingController scoreController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  List<Map<String, dynamic>> projects = [
    {'label': 'Project 1', 'value': 1},
    {'label': 'Project 2', 'value': 2},
    {'label': 'Project 3', 'value': 3},
  ];

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
        // DataCell(Text(data[index]['project'])),
        DataCell(
          Text(data[index]['candidate']),
        ),
        DataCell(
          ElevatedButton(
            onPressed: () {
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
                              onTap: () {
                                Navigator.of(context).pop();
                              },
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
                                  child: SelectFormField(
                                    type: SelectFormFieldType.dialog,
                                    items: projects,
                                    labelText:
                                        AppLocalizations.of(context)!.project,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocalizations.of(context)!
                                            .enterText;
                                      }
                                      return null;
                                    },
                                    onChanged: ((value) {
                                      projectValue = value ?? "";
                                    }),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    key: const Key('dialogsubmit'),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        // widget.service?.crearEvaluacionDesempeno(
                                        //     candidateId: int.parse(_candidateValue),
                                        //     projectId: int.parse(_projectValue),
                                        //     employeeId: int.parse(_employeeValue),
                                        //     score: 100);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    child: Text(
                                        AppLocalizations.of(context)!.assign),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Text(AppLocalizations.of(context!)!.assign),
          ),
        ),
      ],
    );
  }
}
