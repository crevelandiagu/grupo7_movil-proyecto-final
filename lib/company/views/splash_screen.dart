import 'package:abc_jobs/candidates/views/signin.dart';
import 'package:abc_jobs/company/views/signin_company.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(100),
            child: Center(
              child: Text(
                "ABC Jobs",
                style: GoogleFonts.workSans(
                    fontSize: 40, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fixedSize: Size(300, 60),
              ),
              onPressed: () {
                Get.to(() => SigninC());
              },
              child: Text(
                AppLocalizations.of(context)!.youAreCompany,
                style: GoogleFonts.workSans(
                    fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fixedSize: Size(300, 60)),
              onPressed: () {
                Get.to(() => Signin());
              },
              child: Text(
                AppLocalizations.of(context)!.youAreCandidate,
                style: GoogleFonts.workSans(
                    fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
