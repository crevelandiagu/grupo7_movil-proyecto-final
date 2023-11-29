import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:select_form_field/select_form_field.dart';

class AssignCanidateProjectData extends DataTableSource {
  AssignCanidateProjectData({required this.data, this.context, this.projects});

  final data;
  BuildContext? context;

  String projectValue = "";
  //List<Map<String, dynamic>>? projects;

  final _formkey = GlobalKey<FormState>();

  TextEditingController scoreController = TextEditingController();

  final projects;

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
          Text(data[index]['name'] + " " + data[index]['lastName']),
        ),
        DataCell(
          ElevatedButton(
            onPressed: () {
              final projectsS = processProjects(projects);
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
                                    items: projectsS,
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
                                      debugPrint(projectValue);
                                    }),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: ElevatedButton(
                                    key: const Key('dialogsubmit'),
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        Map<String, dynamic> result =
                                            await PerformanceService()
                                                .startProcess(
                                                    projectId: projectValue,
                                                    candidateId: data[index]
                                                            ['candidateId']
                                                        .toString());

                                        if (result.containsKey('createdAt')) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Center(
                                                child:
                                                    Text(result['createdAt'])),
                                            backgroundColor: Colors.green,
                                          ));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Center(
                                                child: Text(result['messeje'])),
                                            backgroundColor: Colors.red,
                                          ));
                                        }

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
