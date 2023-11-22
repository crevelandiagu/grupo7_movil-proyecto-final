import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/services/interview_service.dart';
import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/list_interviews.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
import 'package:abc_jobs/company/views/company_dashboard.dart';
import 'package:abc_jobs/company/views/signin_company.dart';
import 'package:abc_jobs/company/views/splash_screen.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:get/get.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ABC Jobs",
      theme: lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("es"),
      ],
      home: SplashScreen(),
    );
  }
}
