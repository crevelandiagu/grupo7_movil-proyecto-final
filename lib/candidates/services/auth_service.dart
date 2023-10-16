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

  Future<int> signUp({
   required String username,
   required String password,
   required BuildContext context
   }) async{

    
    try {
      
      http.Response response = await http.post(Uri.parse(Constants.signUpUri), headers: buildHeaders(),
                        body: jsonEncode(
                          {
                          "email": username,
                          "password": password
                          }
                        ));
      

      httpErrorHandle(response: response,
       onSuccess: (){

        Get.snackbar(
          "",
          "",
          messageText: Text(
            AppLocalizations.of(context).message_signup_success,
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Colors.white70
              ),
              fontSize: 16

          ),
          ),       
          titleText: Text(
            AppLocalizations.of(context).success,
            style: GoogleFonts.workSans(
              textStyle: const TextStyle(
                color: Colors.white70
              ),
              fontSize: 16

          ),
          ),       
          backgroundColor: Colors.green,
          duration: const Duration(days: 1),
          snackPosition: SnackPosition.BOTTOM,
          mainButton: TextButton(
          onPressed: (){
            
            Get.back(closeOverlays: true);
            //Get.to('/signin');
            Get.offNamed('/');

          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600]),
            alignment: Alignment.centerRight,
          ),
          child: Text(
            AppLocalizations.of(context).signin, 
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

    return Future.value(response.statusCode);


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

    return Future.value(1);


  }



  Future<int> signIn({ required String username,
                       required String password,
                       required BuildContext context}) async {
    
    try {

      http.Response response = await http.post(Uri.parse(Constants.signInUri),
                                headers: buildHeaders(), 
                                body: jsonEncode(
                                  {
                                    "email": username,
                                    "password": password
                                  }
                                ));

      httpErrorHandleSi(
        response: response,
        onSuccess: (){

          Get.snackbar("token", jsonDecode(response.body)['token']);

          //Todo
          

        });
    
    return Future.value(response.statusCode);
      
    } catch (e) {
      log(e.toString());
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

    return Future.value(1);


  }




}




