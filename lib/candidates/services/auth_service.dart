import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthService {

  Future<http.Response> signUp({
   required String username,
   required String password,
   required http.Client client,
   }) async{

    
    try {
      
      http.Response response = await client.post(Uri.parse(Constants.signUpUri), headers: buildHeaders(),
                        body: jsonEncode(
                          {
                          "email": username,
                          "password": password
                          }
                        ));
      
    return response;


    } catch (e) {

      throw Exception(e);

     
    }

  }


  Future<http.Response> signIn({ required String username,
                       required String password,
                       required http.Client client}) async {
    
    try {

      http.Response response = await client.post(Uri.parse(Constants.signInUri),
                                headers: buildHeaders(), 
                                body: jsonEncode(
                                  {
                                    "email": username,
                                    "password": password
                                  }
                                ));
    
    return response;
      
    } catch (e) {

      throw Exception(e);
      
    }

  }


}




