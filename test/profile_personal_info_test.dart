import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets("My widget should have a button sign in",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: PersonalInfo(
          service: CVService(),
        ),
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
    final nextButton = find.byKey(const Key('nextButton'));

    await tester.enterText(name, "");
    await tester.enterText(lastname, "");
    await tester.enterText(numberId, "998393839383938");
    await tester.enterText(location, "");

    await tester.ensureVisible(nextButton);
    await tester.pumpAndSettle();
    await tester.tap(nextButton);

    await tester.pump();

    expect(find.text("There are empty fields or invalid data"), findsOneWidget);

    expect(find.text("name"), findsOneWidget);
    expect(find.text("Enter your name"), findsOneWidget);
    expect(find.text("enter valid name"), findsOneWidget);
    expect(find.text("lastname"), findsOneWidget);
    expect(find.text("Enter your lastname"), findsOneWidget);
    expect(find.text("enter valid lastname"), findsOneWidget);
    expect(find.text("number Id"), findsOneWidget);
    expect(find.text("Enter your Id"), findsOneWidget);
    expect(find.text("enter a valid number"), findsOneWidget);
    expect(find.text("phone"), findsOneWidget);
    expect(find.text("Enter your phone"), findsOneWidget);
    expect(find.text("location"), findsOneWidget);
    expect(find.text("enter valid location"), findsOneWidget);
    expect(find.text("Enter your location"), findsOneWidget);
    expect(find.text("Basic Information"), findsOneWidget);

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
    expect(nextButton, findsOneWidget);
  });
}
