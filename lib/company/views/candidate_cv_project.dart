import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class CandidateCVProject extends StatelessWidget {
  CandidateCVProject({super.key, required this.service});

  PerformanceService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigationCompany((index) => null, context, 1),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          var data = snapshot.data!;
          List<dynamic> certificates = data['certificates'];
          List<dynamic> experience = data['experience'];
          List<dynamic> education = data['education'];
          Map<String, dynamic> basicInfo = data['basicinfo'];

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: showBasicInformation(basicInfo),
                ),
                SizedBox(height: 400, child: showEducation(education)),
                SizedBox(
                  height: 400,
                  child: showExperience(experience),
                ),
                SizedBox(
                  height: 400,
                  child: showCertificates(certificates),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getData() async {
    var arguments = Get.arguments;

    int id = arguments['id'];

    return service.getCvCandidateProject(candidateId: id);
  }

  Widget showCertificates(var listCertificates) {
    return ListView.builder(
        // padding: const EdgeInsets.all(30),
        scrollDirection: Axis.horizontal,
        itemCount: listCertificates.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            //    color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.certificate,
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text(listCertificates[index]['name_certificate'],
                    style: GoogleFonts.workSans(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text(AppLocalizations.of(context)!.organization_c,
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text(listCertificates[index]['company'],
                    style: GoogleFonts.workSans(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text(AppLocalizations.of(context)!.expeditionDate,
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text(
                    Jiffy.parse(listCertificates[index]['expedition_date'])
                        .yMMMMd,
                    style: GoogleFonts.workSans(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
                Text(AppLocalizations.of(context)!.expirationDate,
                    style: GoogleFonts.workSans(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text(Jiffy.parse(listCertificates[index]['date_expiry']).yMMMMd,
                    style: GoogleFonts.workSans(
                        fontSize: 16, fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        });
  }

  Widget showBasicInformation(var data) {
    return Column(
      children: [
        Text(
          data['full_name'],
          key: const Key('fullname'),
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data['nacionality'] ?? "",
              key: const Key('nacionality'),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data['phone_number'] ?? "",
              key: const Key('phone_number'),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.mail,
              color: Colors.blue,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              data['email'],
              key: const Key('email'),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget showEducation(var listEducation) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        //   padding: const EdgeInsets.all(30),
        itemCount: listEducation.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              // color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(AppLocalizations.of(context)!.university,
                      style: GoogleFonts.workSans(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(listEducation[index]['university'],
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(AppLocalizations.of(context)!.grade,
                      style: GoogleFonts.workSans(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(listEducation[index]['subject'],
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(AppLocalizations.of(context)!.startDate_e,
                      style: GoogleFonts.workSans(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(Jiffy.parse(listEducation[index]['start_date']).yMMMMd,
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(AppLocalizations.of(context)!.endDate_e,
                      style: GoogleFonts.workSans(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(Jiffy.parse(listEducation[index]['end_date']).yMMMMd,
                      style: GoogleFonts.workSans(
                          fontSize: 16, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                      listEducation[index]['skills'].isNotEmpty
                          ? AppLocalizations.of(context)!.skills_e
                          : "",
                      style: GoogleFonts.workSans(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Column(
                    children: [
                      for (var text in listEducation[index]['skills'])
                        Text(
                          text,
                          style: GoogleFonts.workSans(fontSize: 16),
                        )
                    ],
                  )
                ],
              ));
        });
  }

  Widget showExperience(var listExperience) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      //  padding: EdgeInsets.all(30),
      itemCount: listExperience.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          //    color: Colors.grey[200],
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.company,
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Text(listExperience[index]['company_name'],
                  style: GoogleFonts.workSans(
                      fontSize: 16, fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 5,
              ),
              Text(AppLocalizations.of(context)!.startDate_e,
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Text(
                Jiffy.parse(listExperience[index]['start_date']).yMMMMd,
                style: GoogleFonts.workSans(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(AppLocalizations.of(context)!.endDate_e,
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Text(
                Jiffy.parse(listExperience[index]['end_date']).yMMMMd,
                style: GoogleFonts.workSans(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(AppLocalizations.of(context)!.position_e,
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Text(
                listExperience[index]['position'],
                style: GoogleFonts.workSans(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  listExperience[index]['skills'].isNotEmpty
                      ? AppLocalizations.of(context)!.skills_e
                      : "",
                  style: GoogleFonts.workSans(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              Column(
                children: [
                  for (var text in listExperience[index]['skills'])
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
    );
  }
}
