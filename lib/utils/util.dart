import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    case 200:
     onSuccess();
     break;
    case 201:
     Get.snackbar("title", "message", snackPosition: SnackPosition.BOTTOM);
     break;
    case 400:
    case 500:
     break;
    default:

  }

}