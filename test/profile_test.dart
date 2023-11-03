import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'profile_test.mocks.dart';

@GenerateMocks([CVService])
void main() {
  MockCVService service = MockCVService();

  // setUp((){
  //   service = MockCVService();

  // });

  Future<Map<String, dynamic>> res() async {
    // await Future.delayed(Duration(milliseconds: 5000));
    return {
      "initial_latter": "DH",
      "full_name": "Daniel Huertas",
      "email": "dan@gmail.com",
      "nacionality": "colombia",
      "phone_number": "1234567"
    };
  }

  testWidgets("test profile view widget", (WidgetTester tester) async {
    when(service.getResponseBasicInfo()).thenAnswer((_) => res());

    await tester.pumpWidget(
      GetMaterialApp(
        home: Profile(
          service: service,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
        ],
      ),
    );

    // final progress = find.byKey(Key('progress'));

    // expect(progress, findsOneWidget);

    // final resp = await service.getResponseBasicInfo();

    // expect(resp['initial_latter'], 'DH');

    await tester.pump();

    expect(find.text("Experience"), findsOneWidget);
    expect(find.text("Education"), findsOneWidget);
    expect(find.text("Certification"), findsOneWidget);
    expect(find.text("DH"), findsOneWidget);
    expect(find.text("Daniel Huertas"), findsOneWidget);
    expect(find.text("dan@gmail.com"), findsOneWidget);
    expect(find.text("colombia"), findsOneWidget);
    expect(find.text("1234567"), findsOneWidget);
  });
}
