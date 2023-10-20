import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {

  
  testWidgets("My widget should have a button sign in", (WidgetTester tester) async{

    await tester.pumpWidget(
      GetMaterialApp(
        home: Signup(),
        localizationsDelegates: [
        AppLocalizations.delegate,
        ],
      ),
    );

    final foundButton = find.byKey(const Key("signupButton"));
    final passwordText = find.byKey(const Key("textPassword"));
    final passwordTextr = find.byKey(const Key("textPasswordr"));
    final emailText = find.byKey(const Key("textEmail"));

    expect(passwordText, findsOneWidget);
    expect(passwordText, findsOneWidget);
    expect(emailText, findsOneWidget);

  });
  
}