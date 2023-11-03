import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

class Certification extends StatelessWidget {
  Certification({super.key, required this.service});

  CVService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
          future: service.getResponse(http.Client(), Constants.certificatesUri),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            var data = snapshot.data!;
            List<dynamic> certificates = data['certificates'];

            return certificates.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    padding: const EdgeInsets.all(30),
                    itemCount: certificates.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.certificate,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(certificates[index]['name_certificate'],
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.organization_c,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(certificates[index]['company'],
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.expeditionDate,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(
                                Jiffy.parse(
                                        certificates[index]['expedition_date'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.expirationDate,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(
                                Jiffy.parse(certificates[index]['date_expiry'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      );
                    })
                : Center(
                    child: Text(AppLocalizations.of(context)!.noCertificates),
                  );
          }),
    );
  }
}
