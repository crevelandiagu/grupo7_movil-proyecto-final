import 'dart:convert';
import 'dart:ui';

import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

Map<String, String> buildHeaders({String? token}) {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  if (token != null) {
    headers['Authorization'] = "Bearer $token";
  }

  return headers;
}

void httpErrorHandle(
    {required http.Response response,
    required VoidCallback onSuccess,
    required GlobalKey<ScaffoldMessengerState> scaffold}) {
  switch (response.statusCode) {
    case 201:
    case 200:
      onSuccess();
      break;
    case 400:
    case 404:
    case 412:
      showSnackbar(jsonDecode(response.body)['message'], scaffold: scaffold);
      break;
    default:
      showSnackbar(jsonDecode(response.body)['message'], scaffold: scaffold);
  }
}

void showSnackbar(String message,
    {bool error = true,
    String label = "",
    bool success = false,
    required GlobalKey<ScaffoldMessengerState> scaffold}) {
  scaffold.currentState?.showSnackBar(SnackBar(
    content: Center(
      child: Text(
        message,
        style: GoogleFonts.workSans(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    duration: const Duration(milliseconds: 3000),
    backgroundColor: error ? Colors.red : Colors.green,
  ));
}
