import 'dart:convert';

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

import '../services/cv_service.dart';

class Experience extends StatelessWidget {
  Experience({super.key, required this.service});

  CVService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        bottomNavigationBar: bottomNavigation((index) => null, context, 0),
        body: FutureBuilder<Map<String, dynamic>>(
            future: service.getResponse(http.Client(), Constants.experienceUri),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var data = snapshot.data!;
              List<dynamic> experience = data['experience'];

              return experience.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      padding: EdgeInsets.all(40),
                      itemCount: experience.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          color: Colors.grey[200],
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.company,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),

                              Text(experience[index]['company_name'],
                                  style: GoogleFonts.workSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(AppLocalizations.of(context)!.startDate_e,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                Jiffy.parse(experience[index]['start_date'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(AppLocalizations.of(context)!.endDate_e,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),

                              Text(
                                Jiffy.parse(experience[index]['end_date'])
                                    .yMMMMd,
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              Text(AppLocalizations.of(context)!.position_e,
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),

                              Text(
                                experience[index]['position'],
                                style: GoogleFonts.workSans(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),

                              const SizedBox(
                                height: 5,
                              ),

                              // Text('Place ',
                              //      style: GoogleFonts.workSans(
                              //       fontSize: 20,
                              //       fontWeight: FontWeight.w500
                              //      )
                              //      ),

                              // Text(experience[index]['place'],
                              // style: GoogleFonts.workSans(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.w400
                              //      ),
                              //      ),

                              // const SizedBox(
                              //   height: 5,
                              // ),

                              Text(
                                  experience[index]['skills'].isNotEmpty
                                      ? AppLocalizations.of(context)!.skills_e
                                      : "",
                                  style: GoogleFonts.workSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),

                              Column(
                                children: [
                                  for (var text in experience[index]['skills'])
                                    Text(
                                      text,
                                      style: GoogleFonts.workSans(fontSize: 16),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(AppLocalizations.of(context)!.noExperience));
            }));
  }
}
