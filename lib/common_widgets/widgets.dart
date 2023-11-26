import 'package:abc_jobs/candidates/services/candidate_performance_service.dart';
import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/services/interview_service.dart';
import 'package:abc_jobs/candidates/views/candidate_list_performance.dart';
import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/list_interviews.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/assign_candidate_project.dart';
import 'package:abc_jobs/company/views/company_dashboard.dart';
import 'package:abc_jobs/company/views/performance_evaluation.dart';
import 'package:abc_jobs/company/views/search_candidates.dart';
import 'package:abc_jobs/company/views/splash_screen.dart';
import 'package:abc_jobs/company/views/test_results_company.dart';
import 'package:abc_jobs/utils/candidate_project_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget bottomNavigation(
    Function(int index) onTap, BuildContext context, int idx) {
  NavigationBar navigation = NavigationBar(
      selectedIndex: idx,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Get.to(() => Dashboard());
            break;
          case 1:
            Get.to(() => PerformanceListCandidate(
                service: CandidatePerformanceService()));
            break;
          case 2:
            Get.to(() => ListInterviews(service: InterviewService()));
            break;
          case 3:
            Get.to(() => Profile(
                  service: CVService(),
                ));
            break;
          default:
            break;
        }
      },
      destinations: [
        NavigationDestination(
            icon: Icon(Icons.home_outlined), label: "Dashboard"),
        // BottomNavigationBarItem(icon: Icon(Icons.work_outline), label: "Applications"),
        NavigationDestination(
            icon: Icon(Icons.school_outlined),
            label: AppLocalizations.of(context)!.performance),
        NavigationDestination(
            icon: Icon(Icons.co_present_outlined),
            label: AppLocalizations.of(context)!.interviews),
        NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.profile),
      ]);

  return navigation;
}

Widget bottomNavigationCompany(
    Function(int index) onTap, BuildContext context, int idx) {
  NavigationBar navigation = NavigationBar(
      selectedIndex: idx,
      onDestinationSelected: (int index) {
        switch (index) {
          case 0:
            Get.to(() => CompanyDashBoard());
            break;
          case 1:
            // Get.to(() => PerformanceEvaluation(service: PerformanceService()));
            Get.to(() => TestResultsCompanyView(service: PerformanceService()));
            break;
          case 2:
            Get.to(() => AssignCandidateProject(service: PerformanceService()));

            break;
          case 3:
            Get.to(() => SearchCandidate(service: PerformanceService()));

            break;
          default:
            break;
        }
      },
      destinations: [
        NavigationDestination(
            icon: Icon(Icons.home_outlined), label: "Dashboard"),
        NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.tests),
        NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.project),
        NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.search),
      ]);

  return navigation;
}

Widget cardDashboard(
    String title, BuildContext context, VoidCallback? function) {
  return Container(
    width: 250,
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 3.0,
          color: const Color.fromARGB(255, 58, 0, 229),
        )),
    child: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 58, 0, 229))),
          onPressed: function,
          child: Text(AppLocalizations.of(context)!.details),
        ),
      ],
    ),
  );
}

Widget cardDashboardCompany(String title, BuildContext context,
    VoidCallback? function, VoidCallback? functionB) {
  return Container(
    width: 250,
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 3.0,
          color: const Color.fromARGB(255, 58, 0, 229),
        )),
    child: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
          key: const Key("createButton"),
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 20),
              backgroundColor: Color.fromARGB(255, 58, 0, 229)),
          onPressed: function,
          child: Text(AppLocalizations.of(context)!.createButton),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 20),
              backgroundColor: Color.fromARGB(255, 58, 0, 229)),
          onPressed: functionB,
          child: Text(AppLocalizations.of(context)!.details),
        ),
      ],
    ),
  );
}

Widget cardDashboardProfile(String title, BuildContext context,
    VoidCallback? functionA, VoidCallback? functionB) {
  return Container(
    width: 300,
    padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 3.0,
          color: const Color.fromARGB(255, 58, 0, 229),
        )),
    child: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.workSans(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 58, 0, 229))),
          onPressed: functionB,
          child: Text(AppLocalizations.of(context)!.details),
        ),
        SizedBox(
          width: 8,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 58, 0, 229))),
          onPressed: functionA,
          child: Text(AppLocalizations.of(context)!.add),
        ),
      ],
    ),
  );
}

PreferredSizeWidget customAppBar() {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.language),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      ),

      PopupMenuButton(
        offset: const Offset(-8, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        icon: const Icon(Icons.account_circle),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              padding: EdgeInsets.zero,
              value: 0,
              child: Text(AppLocalizations.of(context)!.logout),
            ),
          ];
        },
        onSelected: (value) async {
          if (value == 0) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            Get.off(() => SplashScreen());
          }
        },
      ),
      // IconButton(
      //   onPressed: () {},
      //   icon: const Icon(Icons.account_circle),
      // ),
    ],
  );
}
