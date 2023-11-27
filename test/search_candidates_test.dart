import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/company/views/search_candidates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("search candidate test", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SearchCandidate(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump();

    final skill = find.byKey(Key("skill"));
    final skillButton = find.byKey(Key("skill"));

    expect(find.text("Search Candidate"), findsWidgets);

    expect(find.text("Dashboard"), findsWidgets);
    expect(find.text("Tests"), findsWidgets);
    expect(find.byKey(Key("scroll")), findsWidgets);
    expect(find.byKey(Key("padding")), findsWidgets);
    expect(find.byKey(Key("skill")), findsWidgets);
    expect(find.byKey(Key("skillbutton")), findsWidgets);
    expect(find.byKey(Key("iconkey")), findsWidgets);
    expect(find.byKey(Key("boxskill")), findsWidgets);
    expect(find.byKey(Key("nextButton")), findsWidgets);
    expect(find.byKey(Key("nextKey")), findsWidgets);
    expect(find.text("Search"), findsWidgets);
    expect(find.text("skills"), findsWidgets);

    await tester.enterText(skill, "python");

    await tester.ensureVisible(skillButton);
    await tester.pumpAndSettle();
    await tester.tap(skillButton);

    await tester.pump();

    expect(find.text("python"), findsOneWidget);

    await tester.tap(find.text("python"));

    await tester.pump();

    // expect(find.text("python"), findsNothing);
  });
}
