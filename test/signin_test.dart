
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){

  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: Signin(),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final foundButton = find.byKey(const Key("signinButton"));
    final foundPasswordText = find.byKey(const Key("passwordText"));
    final foundemailText = find.byKey(const Key("emailText"));

    expect(foundButton, findsOneWidget);
    expect(foundPasswordText, findsOneWidget);
    expect(foundemailText, findsOneWidget);

  });
}