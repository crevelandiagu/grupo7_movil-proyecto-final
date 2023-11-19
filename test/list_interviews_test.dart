import 'package:abc_jobs/candidates/views/list_interviews.dart';
import 'package:abc_jobs/utils/test_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("test list intervies view", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;
    await tester.pumpWidget(
      GetMaterialApp(
        home: ListInterviews(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    await tester.pump(Duration(milliseconds: 3000));

    expect(find.text("Interviews"), findsWidgets);
    expect(find.text("Company"), findsWidgets);
    expect(find.text("Result"), findsWidgets);
    expect(find.text("Link"), findsWidgets);
    expect(find.text("Date"), findsWidgets);
    expect(find.text("Project"), findsWidgets);
    expect(find.text("Time"), findsWidgets);
  });
}
