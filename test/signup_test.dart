import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("test signup view", (WidgetTester tester) async {
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

    final password = find.text("password");
    final securepassword = find.text("Enter secure password");
    final email = find.text("email");
    final validEmail = find.text("Enter a valid email");
    final signuptext = find.text("Sign Up");
    final account = find.text("Already have an account?");
    final signintext = find.text("Sign In");
    final passwordr = find.text("repeat password");
    final createAccount = find.text("Create Account");

    await tester.enterText(passwordText, "1234");
    await tester.enterText(emailText, "abcd");
    await tester.enterText(passwordTextr, "jjnsh");

    await tester.ensureVisible(foundButton);
    await tester.pumpAndSettle();
    await tester.tap(foundButton);

    await tester.pump();

    expect(find.text("There are empty fields or invalid data"), findsOneWidget);

    expect(
        find.text(
            "Password should contain at least one upper case, one special character, one number and must be at least 8 characters in length"),
        findsOneWidget);

    expect(find.text("Enter a valid email"), findsOneWidget);
    expect(find.text("Passwords are not equal"), findsOneWidget);

    expect(passwordText, findsOneWidget);
    expect(emailText, findsOneWidget);
    expect(foundButton, findsOneWidget);
    expect(password, findsWidgets);
    expect(securepassword, findsOneWidget);
    expect(email, findsOneWidget);
    expect(signuptext, findsOneWidget);
    expect(account, findsOneWidget);
    expect(signintext, findsOneWidget);
    expect(passwordr, findsOneWidget);
    expect(validEmail, findsOneWidget);
    expect(createAccount, findsOneWidget);
  });
}
