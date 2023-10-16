import 'package:abc_jobs/candidates/controllers/validator_controller.dart';
import 'package:abc_jobs/candidates/services/auth_service.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;


class Signin extends StatelessWidget {
  Signin({super.key});

  final controller = Get.put(ValidatorController());
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final service = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"), 
        centerTitle: true,     
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).welcome,
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.0),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
              ),
              ),

            // TextField username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: "email",
                ),
              ),
              ),

            // TextField password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: AppLocalizations.of(context).password,
                  hintText: AppLocalizations.of(context).secure_password,
                ),
              ),
              ),
            
            //Signin button
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 90, 15, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () async {
                 if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                  
                  try {
                    
                    http.Response response = await service.signIn(
                    username: emailController.text,
                    password: passwordController.text,
                    client: http.Client());

                    httpErrorHandleSi(
                      response: response,
                      onSuccess: (){

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

                },
                child: Text(
                  AppLocalizations.of(context).signin,
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.2
                    ),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                  ),
              ),
              ),
            
            //sign up text
            SizedBox(
              //height: 50.0,              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context).dont_account),
                  TextButton(
                    onPressed: (){
                      Get.toNamed('signup');
                    },
                     child: Text(
                      AppLocalizations.of(context).signup,
                      style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                          color: Colors.blueAccent,
                          letterSpacing: 0.2
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                     ),
                     ),                  
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }

}