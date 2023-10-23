


import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){

  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: PersonalInfo(),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final name = find.byKey(const Key('textName'));
    final lastname = find.byKey(const Key('textLastname'));
    final numberId = find.byKey(const Key('numberId'));
    final location = find.byKey(const Key('location'));
    final phone = find.byKey(const Key('phone'));
    final next = find.byKey(const Key('next'));
    final image = find.byKey(const Key('image'));
    final scroll = find.byKey(const Key('scroll'));
    final conta = find.byKey(const Key('1container'));
    final padd1 = find.byKey(const Key('padd1'));
    final padd2 = find.byKey(const Key('pad2'));
    final padd3 = find.byKey(const Key('pad3'));
    final padd4 = find.byKey(const Key('pad4'));
    final box1 = find.byKey(const Key('box1'));

    expect(name, findsOneWidget);
    expect(lastname, findsOneWidget);
    expect(numberId, findsOneWidget);
    expect(location, findsOneWidget);
    expect(phone, findsOneWidget);
    expect(image, findsOneWidget);
    expect(next, findsOneWidget);
    expect(scroll, findsOneWidget);
    expect(conta, findsOneWidget);
    expect(padd1, findsOneWidget);
    expect(padd2, findsOneWidget);
    expect(padd3, findsOneWidget);
    expect(padd4, findsOneWidget);
    expect(box1, findsOneWidget);

  });
}