import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("My widget should have a button sign in",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SchoolInfo(
          service: CVService(),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    final school = find.byKey(const Key('textSchool'));
    final degree = find.byKey(const Key('textDegree'));
    final startDate = find.byKey(const Key('startdate'));
    final endDate = find.byKey(const Key('enddate'));
    final skill = find.byKey(const Key('skill'));
    final buttonnext = find.byKey(const Key('nextButton'));
    final scroll = find.byKey(const Key('scroll'));
    final paddi = find.byKey(const Key('padding'));
    final skillButton = find.byKey(const Key('skillbutton'));
    final icon = find.byKey(const Key('iconkey'));
    final box = find.byKey(const Key('boxskill'));
    final box2 = find.byKey(const Key('box'));
    final next3 = find.byKey(const Key('nextKey'));
    // final list = find.byKey(const Key('listView'));
    // final paddlist = find.byKey(const Key('paddList'));
    //final elevated = find.byKey(const Key('elevated'));
    //final skitext = find.byKey(const Key('skiText'));

    await tester.enterText(school, "");
    await tester.enterText(degree, "");

    await tester.enterText(skill, "python");

    await tester.ensureVisible(skillButton);
    await tester.pumpAndSettle();
    await tester.tap(skillButton);

    await tester.pump();

    expect(find.text("python"), findsOneWidget);

    await tester.ensureVisible(buttonnext);
    await tester.pumpAndSettle();
    await tester.tap(buttonnext);

    await tester.pump();

    expect(find.text("There are empty fields or invalid data"), findsOneWidget);

    expect(find.text("school"), findsOneWidget);
    expect(find.text("Enter school name"), findsOneWidget);
    expect(find.text("enter a valid school name"), findsOneWidget);
    expect(find.text("degree"), findsOneWidget);
    expect(find.text("Enter degree"), findsOneWidget);
    expect(find.text("enter a valid degree"), findsOneWidget);

    expect(find.text("skills"), findsOneWidget);
    expect(find.text("choose a date"), findsWidgets);

    expect(school, findsOneWidget);
    expect(degree, findsOneWidget);
    expect(startDate, findsOneWidget);
    expect(endDate, findsOneWidget);
    expect(skill, findsOneWidget);
    expect(scroll, findsOneWidget);
    expect(paddi, findsOneWidget);
    expect(skillButton, findsOneWidget);
    expect(buttonnext, findsOneWidget);
    expect(icon, findsOneWidget);
    expect(box, findsOneWidget);
    expect(box2, findsOneWidget);
    expect(next3, findsOneWidget);
  });
}
