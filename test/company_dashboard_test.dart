import 'package:abc_jobs/company/views/company_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("test company dashboard", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: CompanyDashBoard(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    expect(find.text("Hello"), findsOneWidget);
    expect(find.text("Performance"), findsWidgets);
    expect(find.text("View Details"), findsOneWidget);
    expect(find.text("Create"), findsOneWidget);

    final button = find.byKey(const Key('createButton'));

    await tester.tap(button);
    await tester.pump();

    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
