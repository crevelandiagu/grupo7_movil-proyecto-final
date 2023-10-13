import 'dart:convert';

import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:abc_jobs/utils/util.dart';

class AuthService {

  Future<void> signUp({
   required String username,
   required String password
   }) async{
    
    try {
      
      http.Response response = await http.post(Uri.parse(Constants.signUpUri), headers: buildHeaders(),
                        body: jsonEncode(
                          {
                          "user": username,
                          "password": password
                          }
                        ));
      
      if (response.statusCode == 200) {
        //Todo
      }


    } catch (e) {
      
    }


  }

  Future<void> signIn(String username, String password) async {

  }




}




