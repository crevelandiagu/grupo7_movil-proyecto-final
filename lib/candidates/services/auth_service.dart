import 'dart:convert';

import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthService {

  Future<void> signUp({
   required String username,
   required String password,
   required BuildContext context
   }) async{
    
    try {
      
      http.Response response = await http.post(Uri.parse(Constants.signUpUri), headers: buildHeaders(),
                        body: jsonEncode(
                          {
                          "user": username,
                          "password": password
                          }
                        ));
      

      httpErrorHandle(response: response,
       onSuccess: (){

        Get.snackbar(
          "",
          "",
          titleText: Text(
            AppLocalizations.of(context).account_created,
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Colors.white70
              ),
              fontSize: 16

          ),
          ),
          messageText: Text(
            AppLocalizations.of(context).message_signup_success,
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Colors.white70
              ),
              fontSize: 16,
          ),
          ),        
          backgroundColor: Colors.green,
          duration: const Duration(days: 1),
          mainButton: TextButton(
          onPressed: (){

            //Get.to('/signin');

          },
          child: Text(
            "", 
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Colors.white70
              ),
              fontSize: 16
            ),
          ),
          ),
          );    
       });


    } catch (e) {
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
        e.toString(),
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

  Future<void> signIn(String username, String password) async {

  }




}




