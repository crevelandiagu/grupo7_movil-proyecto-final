import 'package:abc_jobs/utils/validator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class Signup extends StatelessWidget {
  
  Signup({super.key});

  final controller = Get.put(ValidatorController());
  final textPasswordEditingController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sigup"), 
        centerTitle: true,     
      ),

      body: SingleChildScrollView(
        child: Obx(()=>Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Text(
                  AppLocalizations.of(context).create_Account,
                  style: GoogleFonts.workSans(
                    textStyle: const TextStyle(color: Colors.black, letterSpacing: 0.0),
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                  ),
              ),
              ),

            // TextField email
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 80, 15, 40),
              child: TextField(
                onChanged: (value) {
                  controller.validateEmail(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: "email",
                  errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).email,
                ),
              ),
              ),
      
            // TextField password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: TextField(
                onChanged: (value) {
                  controller.validatePassword(value);
                },
                controller: textPasswordEditingController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: AppLocalizations.of(context).password,
                  hintText: AppLocalizations.of(context).secure_password,
                  errorText: controller.password.value ? null : AppLocalizations.of(context).password_error_length
                ),
              ),
              ),

            //repeat password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40.0),
              child: TextField(
                onChanged: (value) {
                  controller.validateEqualPassword(value, textPasswordEditingController.text);
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  labelText: AppLocalizations.of(context).password,
                  hintText: AppLocalizations.of(context).repeat_password,
                  errorText: controller.isPasswordEqual.value ? null : AppLocalizations.of(context).password_error_equal,
                ),
              ),
              ),
            
            //Signup button
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: (controller.email.value && controller.password.value && controller.isPasswordEqual.value) ? submitSignupButton : null,
                child: Text(
                  AppLocalizations.of(context).signup,
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
            
            //sign in text
            SizedBox(
              //height: 50.0,              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context).already_account),
                  TextButton(
                    onPressed: (){},
                     child: Text(
                      AppLocalizations.of(context).signin,
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
      ),
    );
  }

  void submitSignupButton() {

  }
}