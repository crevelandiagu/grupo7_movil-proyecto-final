import 'dart:developer';
import 'dart:ffi';

import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/performance_evaluation.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:select_form_field/select_form_field.dart';

class CompanyDashBoard extends StatefulWidget {
  const CompanyDashBoard({super.key, this.service});

  final PerformanceService? service;

  @override
  State<CompanyDashBoard> createState() => _CompanyDashBoardState();
}

class _CompanyDashBoardState extends State<CompanyDashBoard> {
  final _formkey = GlobalKey<FormState>();

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  String _projectValue = "";
  String _candidateValue = "";
  String _employeeValue = "";
  String _scoreValue = "";

  List<Map<String, dynamic>> projects = [
    {'label': 'Project 1', 'value': 1},
    {'label': 'Project 2', 'value': 2},
    {'label': 'Project 3', 'value': 3},
  ];

  List<Map<String, dynamic>> employees = [
    {'label': 'Evaluator 1', 'value': 1},
    {'label': 'Evaluator 2', 'value': 2},
    {'label': 'Evaluator 3', 'value': 3},
  ];

  List<Map<String, dynamic>> candidates = [
    {'label': 'Candidate 1', 'value': 1},
    {'label': 'Candidate 2', 'value': 2},
    {'label': 'Candidate 3', 'value': 3},
  ];

  @override
  void initState() {
    super.initState();

    _getValues();
  }

  Future<void> _getValues() async {
    // var projectsToProcess = await widget.service?.getAllProjects();
    // projects = processProjects(projectsToProcess);

    // var employeesToProcess = await widget.service?.getAllEmployees();
    // employees = processEmployees(employeesToProcess);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.hi,
                      style: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    cardDashboardCompany(
                        AppLocalizations.of(context)!.performance, context, () {
                      crearEvaluacion(context);
                    }, () {
                      Get.to(() =>
                          PerformanceEvaluation(service: PerformanceService()));
                    }),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            bottomNavigationCompany((index) => null, context, 0),
      ),
    );
  }

  void crearEvaluacion(BuildContext context) {
    showDialog(
        context: context,
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
                          labelText: AppLocalizations.of(context)!.project,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.enterText;
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            _projectValue = value ?? "";
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: SelectFormField(
                          type: SelectFormFieldType.dialog,
                          items: candidates,
                          labelText: AppLocalizations.of(context)!.candidate,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.enterText;
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            _candidateValue = value ?? "";
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: SelectFormField(
                          type: SelectFormFieldType.dialog,
                          items: employees,
                          labelText: AppLocalizations.of(context)!.evaluator,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!.enterText;
                            }
                            return null;
                          },
                          onChanged: (value) => setState(() {
                            _employeeValue = value ?? "";
                          }),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.score,
                          ),
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppLocalizations.of(context)!.enterNumber;
                            }
                            try {
                              double number = double.parse(value!);
                              if (number >= 0 && number <= 100) {
                                return null;
                              } else {
                                return AppLocalizations.of(context)!
                                    .enterNumber0100;
                              }
                            } catch (e) {
                              return AppLocalizations.of(context)!
                                  .invalidaNumberFormat;
                            }
                          },
                          onChanged: (value) => setState(() {
                            _scoreValue = value ?? "";
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
                              showSnackbar(
                                  AppLocalizations.of(context)!
                                      .performanceEvaluationSuccess,
                                  scaffold: scaffold,
                                  error: false);
                            }
                          },
                          child:
                              Text(AppLocalizations.of(context)!.createButton),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
