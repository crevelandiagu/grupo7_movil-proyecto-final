import 'dart:developer';

import 'package:abc_jobs/candidates/controllers/validator_controller.dart';
import 'package:abc_jobs/candidates/services/auth_service.dart';
import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class Signup extends StatelessWidget {
  Signup({super.key});

  final controller = Get.put(ValidatorController());
  final passwordController = TextEditingController();
  final passwordRController = TextEditingController();
  final emailController = TextEditingController();
  final service = AuthService();

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.signup),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.create_Account,
                      style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                            color: Colors.black, letterSpacing: 0.0),
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
                    key: const Key('textEmail'),
                    controller: emailController,
                    onChanged: (value) {
                      controller.validateEmail(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "email",
                      errorText: controller.email.value
                          ? null
                          : AppLocalizations.of(context)!.valid_email,
                      hintText: AppLocalizations.of(context)!.email,
                    ),
                  ),
                ),

                // TextField password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: TextField(
                    key: const Key('textPassword'),
                    onChanged: (value) {
                      controller.validatePassword(value);
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: AppLocalizations.of(context)!.password,
                        hintText: AppLocalizations.of(context)!.secure_password,
                        errorText: controller.password.value
                            ? null
                            : AppLocalizations.of(context)!
                                .password_error_length),
                  ),
                ),

                //repeat password
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 40.0),
                  child: TextField(
                    controller: passwordRController,
                    key: const Key('textPasswordr'),
                    onChanged: (value) {
                      controller.validateEqualPassword(
                          value, passwordController.text);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: AppLocalizations.of(context)!.password,
                      hintText: AppLocalizations.of(context)!.repeat_password,
                      errorText: controller.isPasswordEqual.value
                          ? null
                          : AppLocalizations.of(context)!.password_error_equal,
                    ),
                  ),
                ),

                //Signup button
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 60, 15, 20),
                  child: ElevatedButton(
                    key: const Key('signupButton'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      if (controller.email.value &&
                          controller.password.value &&
                          controller.isPasswordEqual.value) {
                        try {
                          http.Response response = await service.signUp(
                              username: emailController.text,
                              password: passwordController.text,
                              client: http.Client());

                          httpErrorHandle(
                              response: response,
                              onSuccess: () {
                                showSnackbar(
                                    AppLocalizations.of(context)!
                                        .message_signup_success,
                                    error: false,
                                    scaffold: scaffold,
                                    success: true,
                                    label:
                                        AppLocalizations.of(context)!.signin);
                              },
                              scaffold: scaffold);
                          emailController.text = "";
                          passwordController.text = "";
                          passwordRController.text = "";
                        } catch (e) {
                          showSnackbar("An error ocurred. Please try again",
                              scaffold: scaffold);
                        }
                      } else {
                        showSnackbar(AppLocalizations.of(context)!.emptyFields,
                            scaffold: scaffold);
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signup,
                      style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                              color: Colors.white, letterSpacing: 0.2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),

                //sign in text
                SizedBox(
                  //height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.already_account),
                      TextButton(
                        onPressed: () {
                          Get.off(() => Signin());
                        },
                        child: Text(
                          AppLocalizations.of(context)!.signin,
                          style: GoogleFonts.workSans(
                              textStyle: const TextStyle(
                                  color: Colors.blueAccent, letterSpacing: 0.2),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
