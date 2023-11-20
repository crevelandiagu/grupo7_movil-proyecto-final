import 'dart:convert';

import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  Future<http.Response> signIn(
      {required String username,
      required String password,
      required http.Client client}) async {
    try {
      http.Response response = await client.post(
          Uri.parse(Constants.companySignInUri),
          headers: buildHeaders(),
          body: jsonEncode({"email": username, "password": password}));

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
