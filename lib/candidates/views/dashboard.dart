import 'package:abc_jobs/candidates/views/list_interviews.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  cardDashboard(AppLocalizations.of(context)!.applications,
                      context, () {}),
                  SizedBox(
                    height: 50,
                  ),
                  cardDashboard(
                      AppLocalizations.of(context)!.interviews, context, () {
                    Get.to(() => ListInterviews());
                  }),
                  SizedBox(
                    height: 50,
                  ),
                  cardDashboard(
                      AppLocalizations.of(context)!.tests, context, () {}),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
    );
  }
}
