import 'dart:ffi';

import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:select_form_field/select_form_field.dart';

class CompanyDashBoard extends StatefulWidget {
  const CompanyDashBoard({super.key});

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

  final _projects = [
    {'label': 'Project 1', 'value': 1},
    {'label': 'Project 2', 'value': 2},
    {'label': 'Project 3', 'value': 3},
  ];

  final _employees = [
    {'label': 'Evaluator 1', 'value': 1},
    {'label': 'Evaluator 2', 'value': 2},
    {'label': 'Evaluator 3', 'value': 3},
  ];

  final _candidates = [
    {'label': 'Candidate 1', 'value': 1},
    {'label': 'Candidate 2', 'value': 2},
    {'label': 'Candidate 3', 'value': 3},
  ];

  @override
  void initState() {
    super.initState();

    _getValues();
  }

  Future<void> _getValues() async {}

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
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
                    }, () {}),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigation((index) => null, context, 0),
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
                          items: _projects,
                          labelText: "project",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter some text";
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
                          items: _candidates,
                          labelText: "select a candidate",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter some text";
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
                          items: _employees,
                          labelText: "select a evaluator",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "please enter some text";
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
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              //llamar api
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
