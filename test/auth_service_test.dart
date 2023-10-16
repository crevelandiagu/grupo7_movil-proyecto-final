import 'dart:convert';

import 'package:abc_jobs/candidates/services/auth_service.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'auth_service_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {

  group("test status codes from authService functions", () {

    test("test signup status code 201", () async {

      final client = MockClient();

      when(client.post(Uri.parse(Constants.signUpUri),
       headers: buildHeaders(), body: jsonEncode({'email': 'mock@mock.com', 'password':'password'})))
      .thenAnswer((_) async => http.Response( '{"message": "User successfully added"}', 201));


      expect(await AuthService().signUp(
      username: "mock@mock.com", 
      password: "password",
      client: client), isA<http.Response>());
           
    });

     test("test signup status code 412", () async {

      final client = MockClient();

      when(client.post(Uri.parse(Constants.signUpUri),
       headers: buildHeaders(), body: jsonEncode({'email': 'mock@mock.com', 'password':'password'})))
      .thenAnswer((_) async => http.Response( '{"message": "Account already exists. Try with a different one"}', 412));


      expect(await AuthService().signUp(
      username: "mock@mock.com", 
      password: "password",
      client: client), isA<http.Response>());
           
    });

  });

}