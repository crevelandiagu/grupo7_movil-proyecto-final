import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
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
      initialRoute: '/dashboard',
      getPages: [
        GetPage(name: '/', page: ()=>Signin()),
        GetPage(name:'/signup', page: () => Signup()),
        GetPage(name: '/dashboard', page: ()=>Dashboard()),
      ],

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,  
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("es"),
        
      ],
     // home: Signup(),
    );
  }
}