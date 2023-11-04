import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("profile work info view test", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: WorkInfo(
          service: CVService(),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    final positionF = find.byKey(const Key('textPosition'));
    final companyF = find.byKey(const Key('company'));
    final startDate = find.byKey(const Key('startdate'));
    final endDate = find.byKey(const Key('enddate'));
    final nbutton = find.byKey(const Key('nextButton'));
    final skillButton = find.byKey(const Key('skillButton'));
    final skill = find.byKey(const Key('skill'));

    final positionText = find.text("position");
    final positionLabel = find.text("Enter your position");
    final company = find.text("company name");
    final companyLabel = find.text("Enter company name");
    final startDateText = find.text("start date");
    final endDateText = find.text("end date");
    final skillsText = find.text("skills");
    final nextButton = find.text("Next");

    await tester.enterText(positionF, "");
    await tester.enterText(companyF, "");

    await tester.enterText(skill, "python");

    await tester.ensureVisible(skillButton);
    await tester.pumpAndSettle();
    await tester.tap(skillButton);

    await tester.pump();

    expect(find.text("python"), findsOneWidget);

    await tester.ensureVisible(nbutton);
    await tester.pumpAndSettle();
    await tester.tap(nbutton);

    await tester.pump();

    expect(find.text("There are empty fields or invalid data"), findsOneWidget);

    expect(find.text("enter valid position"), findsOneWidget);
    expect(find.text("enter valid company name"), findsOneWidget);
    expect(find.text("choose a date"), findsWidgets);

    expect(positionF, findsOneWidget);
    expect(companyF, findsOneWidget);
    expect(startDate, findsOneWidget);
    expect(endDate, findsOneWidget);
    expect(nbutton, findsOneWidget);
    expect(skillButton, findsOneWidget);

    expect(positionLabel, findsOneWidget);
    expect(positionText, findsOneWidget);
    expect(company, findsOneWidget);
    expect(companyLabel, findsOneWidget);
    expect(startDateText, findsOneWidget);
    expect(endDateText, findsOneWidget);
    expect(skillsText, findsOneWidget);
    expect(nextButton, findsOneWidget);
  });
}
