import 'dart:convert';
import 'dart:ui';

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

void httpErrorHandle({
  required http.Response response,
  required VoidCallback onSuccess,
}) {

  switch(response.statusCode) {
    case 201:
     onSuccess();
     break;
    case 412:
     Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        jsonDecode(response.body)['message'],
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
     break;
    case 200:
     onSuccess();
     break;
    case 400:
      Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        jsonDecode(response.body)['message'],
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
     break;
    case 404:
     Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        jsonDecode(response.body)['mensaje'],
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
     break;
     
     break;
    default:
      Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        response.body,
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
  }

}


void httpErrorHandleSi({
  required http.Response response,
  required VoidCallback onSuccess,
}) {

  switch(response.statusCode) {
    case 400:
      Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        jsonDecode(response.body)['mensaje'],
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
     break;
    case 404:
     Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        jsonDecode(response.body)['mensaje'],
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
     break;
    default:
      Get.snackbar(
      "",
      "",
      titleText: Text(
        "Error",
        style: GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      messageText: Text(
        response.body,
        style:  GoogleFonts.workSans(
          textStyle: const TextStyle(
            color: Colors.white60,
          ),
          fontSize: 16,
        ),
        ),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM);
  }

}