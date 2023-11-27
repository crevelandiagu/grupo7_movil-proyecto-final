import 'dart:convert';

import 'package:abc_jobs/company/services/company_service.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'auth_service_test.mocks.dart';

void main() {
  final client = MockClient();

  test("test company service signin", () async {
    when(client.post(Uri.parse(Constants.companySignInUri),
            headers: buildHeaders(),
            body:
                jsonEncode({'email': 'mock@mock.com', 'password': 'password'})))
        .thenAnswer((_) async =>
            http.Response('{"message": "User successfully added"}', 201));

    http.Response response = await CompanyService().signIn(
        username: "mock@mock.com", password: "password", client: client);

    expect(response.statusCode, 201);
  });
}
