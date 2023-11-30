import 'package:abc_jobs/company/views/company_dashboard.dart';
import 'package:abc_jobs/company/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("test splashScreen", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SplashScreen(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    expect(find.text("ABC Jobs"), findsOneWidget);
    expect(find.text("You are a company"), findsWidgets);
    expect(find.text("You are a candidate"), findsOneWidget);
    expect(find.byType(ElevatedButton), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Padding), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
  });
}
