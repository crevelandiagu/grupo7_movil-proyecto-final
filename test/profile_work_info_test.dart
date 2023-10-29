import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){

  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: WorkInfo(service: CVService(),),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final name = find.byKey(const Key('textPosition'));
    final lastname = find.byKey(const Key("place"));
    final numberId = find.byKey(const Key('company'));
    final location = find.byKey(const Key('startdate'));
    final phone = find.byKey(const Key('enddate'));
    final nbutton = find.byKey(const Key('nextButton'));

    expect(name, findsOneWidget);
    expect(lastname, findsOneWidget);
    expect(numberId, findsOneWidget);
    expect(location, findsOneWidget);
    expect(phone, findsOneWidget);
    expect(nbutton, findsOneWidget);

  });
}