import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){

  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: CertificationInfo(),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final name = find.byKey(const Key('textCertification'));
    final lastname = find.byKey(const Key('textOrg'));
    final numberId = find.byKey(const Key('startdate'));
    final location = find.byKey(const Key('enddate'));
    final button = find.byKey(const Key('createButton'));

    expect(name, findsOneWidget);
    expect(lastname, findsOneWidget);
    expect(numberId, findsOneWidget);
    expect(location, findsOneWidget);
    expect(button, findsOneWidget);

  });
}