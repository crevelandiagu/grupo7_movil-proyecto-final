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

  @override
  void initState() {
    super.initState();
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
                        AppLocalizations.of(context)!.performance,
                        context,
                        () {}, () {
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
}
