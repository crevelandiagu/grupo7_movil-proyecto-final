import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/company/views/signin_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("view Signin company", (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: SigninC(),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    final foundButton = find.byKey(const Key("signinButton"));
    final foundPasswordText = find.byKey(const Key("passwordText"));
    final foundemailText = find.byKey(const Key("emailText"));
    final scroll = find.byKey(const Key('scroll'));
    final pad1 = find.byKey(const Key('pad1'));
    final pad2 = find.byKey(const Key('pad2'));
    final pad3 = find.byKey(const Key('pad3'));
    final pad4 = find.byKey(const Key('pad4'));

    final passwordText = find.text("password");
    final securepassword = find.text("Enter secure password");
    final welcometext = find.text("Welcome Back!");
    final signintext = find.text("Sign In");
    final emailText = find.text("email");

    await tester.tap(foundButton);

    await tester.pump();

    expect(
        find.text("There are empty fields or invalid data",
            skipOffstage: false),
        findsOneWidget);

    expect(foundButton, findsOneWidget);
    expect(foundPasswordText, findsOneWidget);
    expect(foundemailText, findsOneWidget);
    expect(scroll, findsOneWidget);
    expect(pad1, findsOneWidget);
    expect(pad2, findsOneWidget);
    expect(pad3, findsOneWidget);
    expect(pad4, findsOneWidget);
    expect(securepassword, findsOneWidget);
    expect(welcometext, findsOneWidget);
    expect(signintext, findsOneWidget);
    expect(passwordText, findsOneWidget);
    expect(emailText, findsOneWidget);
    //expect(find., matcher)
  });
}
