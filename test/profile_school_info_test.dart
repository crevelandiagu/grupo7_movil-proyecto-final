import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){

  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: SchoolInfo(),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final name = find.byKey(const Key('textSchool'));
    final lastname = find.byKey(const Key('textDegree'));
    final numberId = find.byKey(const Key('startdate'));
    final location = find.byKey(const Key('enddate'));
    final phone = find.byKey(const Key('skill'));
    final button = find.byKey(const Key('nextButton'));
    final scroll = find.byKey(const Key('scroll'));
    final paddi = find.byKey(const Key('padding'));
    final skillb = find.byKey(const Key('skillbutton'));
    final icon = find.byKey(const Key('iconkey'));
    final box = find.byKey(const Key('boxskill'));
    final box2 = find.byKey(const Key('box'));
    final next3 = find.byKey(const Key('nextKey'));
   // final list = find.byKey(const Key('listView'));
   // final paddlist = find.byKey(const Key('paddList'));
    //final elevated = find.byKey(const Key('elevated'));
    //final skitext = find.byKey(const Key('skiText'));

    expect(name, findsOneWidget);
    expect(lastname, findsOneWidget);
    expect(numberId, findsOneWidget);
    expect(location, findsOneWidget);
    expect(phone, findsOneWidget);
    expect(scroll, findsOneWidget);
    expect(paddi, findsOneWidget);
    expect(skillb, findsOneWidget);
    expect(button, findsOneWidget);
    expect(icon, findsOneWidget);
    expect(box, findsOneWidget);
    expect(box2, findsOneWidget);
   // expect(list, findsOneWidget);
    //expect(paddlist, findsOneWidget);
    //expect(elevated, findsOneWidget);
    //expect(skitext, findsOneWidget);

  });
}