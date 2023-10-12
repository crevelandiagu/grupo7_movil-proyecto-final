import 'package:abc_jobs/signup/views/signup.dart';
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
      home: Signup(),
    );
  }
}