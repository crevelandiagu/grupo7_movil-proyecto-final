import 'dart:convert';

import 'package:abc_jobs/candidates/controllers/validator_controller.dart';
import 'package:abc_jobs/candidates/services/auth_service.dart';
import 'package:abc_jobs/candidates/views/dashboard.dart';
import 'package:abc_jobs/candidates/views/signup.dart';
import 'package:abc_jobs/company/services/company_service.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/company_dashboard.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SigninC extends StatelessWidget {
  SigninC({super.key});

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final service = CompanyService();

  final GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Signin"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          key: Key('scroll'),
          child: Column(
            key: Key('col1'),
            children: <Widget>[
              Padding(
                key: Key('pad1'),
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  key: Key('center1'),
                  child: Text(
                    AppLocalizations.of(context)!.welcome,
                    style: GoogleFonts.workSans(
                      textStyle: const TextStyle(
                          color: Colors.black, letterSpacing: 0.0),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                    key: Key('text1'),
                  ),
                ),
              ),

              // TextField email
              Padding(
                key: Key('pad2'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 50.0),
                child: TextField(
                  key: const Key('emailText'),
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: "email",
                  ),
                ),
              ),

              // TextField password
              Padding(
                key: Key('pad3'),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
                child: TextField(
                  key: const Key('passwordText'),
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    labelText: AppLocalizations.of(context)!.password,
                    hintText: AppLocalizations.of(context)!.secure_password,
                  ),
                ),
              ),

              //Signin button
              Padding(
                key: Key('pad4'),
                padding: const EdgeInsets.fromLTRB(15, 90, 15, 20),
                child: ElevatedButton(
                  key: const Key("signinButton"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  onPressed: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      try {
                        http.Response response = await service.signIn(
                            username: emailController.text,
                            password: passwordController.text,
                            client: http.Client());

                        httpErrorHandle(
                            response: response,
                            onSuccess: () async {
                              int companyId = jsonDecode(response.body)['id'];
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setInt("companyId", companyId);
                              debugPrint("id: $companyId");

                              Get.off(() => CompanyDashBoard(
                                    service: PerformanceService(),
                                  ));
                            },
                            scaffold: scaffold);
                      } catch (e) {
                        showSnackbar(e.toString(), scaffold: scaffold);
                      }
                    } else {
                      showSnackbar(AppLocalizations.of(context)!.emptyFields,
                          scaffold: scaffold);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.signin,
                    style: GoogleFonts.workSans(
                        textStyle: const TextStyle(
                            color: Colors.white, letterSpacing: 0.2),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              //sign up text
            ],
          ),
        ),
      ),
    );
  }
}
