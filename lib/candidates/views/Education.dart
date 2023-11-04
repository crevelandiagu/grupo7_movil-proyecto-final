import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';

class Education extends StatelessWidget {
  Education({super.key, required this.service});

  CVService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
        future: service.getResponseEducation(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var data = snapshot.data!;
          List<dynamic> education = data['education'];
          debugPrint(data.toString());

          return education.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.all(40),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(),
                  itemCount: education.length,
                  itemBuilder: (context, index) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        color: Colors.grey[200],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(AppLocalizations.of(context)!.university,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(education[index]['university'],
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.grade,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(education[index]['subject'],
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.startDate_e,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(
                                Jiffy.parse(education[index]['start_date'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(AppLocalizations.of(context)!.endDate_e,
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                            Text(
                                Jiffy.parse(education[index]['end_date'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                education[index]['skills'].isNotEmpty
                                    ? AppLocalizations.of(context)!.skills_e
                                    : "",
                                style: GoogleFonts.workSans(
                                    fontSize: 20, fontWeight: FontWeight.w500)),

                            /* Text(education[index]['skills'].toString(),

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )), */

                            Column(
                              children: [
                                for (var text in education[index]['skills'])
                                  Text(
                                    text,
                                    style: GoogleFonts.workSans(fontSize: 16),
                                  )
                              ],
                            )

                            /* Column(
                        children: education[index]['skills'].isNotEmpty ?
                        agregarSkills(education[index]['skills']) : [Text('No skills')]
                      ) */
                          ],
                        ));
                  })
              : Center(
                  child: Text(AppLocalizations.of(context)!.noEducation),
                );
        },
      ),
    );
  }
}
