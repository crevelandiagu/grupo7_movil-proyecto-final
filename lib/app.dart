import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
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
      /* initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>Signin()),
        GetPage(name:'/signup', page: () => Signup()),
        GetPage(name: '/dashboard', page: ()=>Dashboard()),
        GetPage(name: '/experience', page: ()=>Experience()),
       // GetPage(name: '/profile', page: ()=>Profile()),
      ], */

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("es"),
      ],
      home: Signin(),
    );
  }
}
