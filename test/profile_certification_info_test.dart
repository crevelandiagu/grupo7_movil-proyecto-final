import 'dart:developer';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("My widget should have a button sign in",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: CertificationInfo(
          service: CVService(),
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    final certification = find.byKey(const Key('textCertification'));
    final org = find.byKey(const Key('textOrg'));
    final startDate = find.byKey(const Key('startdate'));
    final endDate = find.byKey(const Key('enddate'));
    final button = find.byKey(const Key('createButton'));

    await tester.ensureVisible(button);
    await tester.pumpAndSettle();
    await tester.tap(button);

    await tester.pump();

    expect(find.text("There are empty fields or invalid data"), findsOneWidget);

    await tester.enterText(certification, "");
    await tester.enterText(org, "");

    expect(find.text("certification name"), findsOneWidget);
    expect(find.text("Enter certification name"), findsOneWidget);
    expect(find.text("Issuing organization"), findsOneWidget);
    expect(find.text("Enter Issuing organization"), findsOneWidget);
    expect(find.text("choose a date"), findsWidgets);
    expect(find.text("enter valid certification"), findsWidgets);
    expect(find.text("enter valid organization"), findsWidgets);

    expect(certification, findsOneWidget);
    expect(org, findsOneWidget);
    expect(startDate, findsOneWidget);
    expect(endDate, findsOneWidget);
    expect(button, findsOneWidget);
  });
}
