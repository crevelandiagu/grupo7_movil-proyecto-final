import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  testWidgets("Dashboard view test", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: Dashboard(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    expect(find.text("Hello"), findsOneWidget);
    expect(find.text("Performance"), findsWidgets);
    expect(find.text("Interviews"), findsWidgets);
    expect(find.text("Tests"), findsWidgets);
    expect(find.text("Profile"), findsWidgets);
    expect(find.text("View Details"), findsWidgets);
    expect(find.byType(SingleChildScrollView), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(SizedBox), findsWidgets);
  });
}
