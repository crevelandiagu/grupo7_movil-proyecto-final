import 'dart:convert';

import 'package:abc_jobs/candidates/controllers/profile_school_controller.dart';
import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/company/services/performance_service.dart';
import 'package:abc_jobs/company/views/assign_candidate_project.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchCandidate extends StatelessWidget {
  SearchCandidate({super.key});

  ProfileSchoolController controller = Get.put(ProfileSchoolController());

  TextEditingController skillController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        appBar: customAppBar(),
        bottomNavigationBar:
            bottomNavigationCompany((index) => null, context, 2),
        body: SingleChildScrollView(
          key: const Key('scroll'),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(AppLocalizations.of(context)!.searchCandidate,
                      style: GoogleFonts.workSans(
                          fontSize: 23, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 40, 15),
                    child: TextField(
                      controller: experienceController,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.experience),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 30),
                  key: const Key('padding'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.skills),
                      Row(
                        children: [
                          Flexible(
                              child: TextField(
                            key: const Key('skill'),
                            controller: skillController,
                          )),
                          IconButton(
                            key: const Key('skillbutton'),
                            onPressed: () {
                              if (skillController.text.isEmpty) {
                                return;
                              }
                              controller.skills.add(skillController.text);
                              skillController.text = '';
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              key: Key('iconkey'),
                            ),
                            color: const Color.fromARGB(255, 13, 110, 253),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  key: const Key('boxskill'),
                  child: controller.skills.isNotEmpty
                      ? ListView.builder(
                          //  key: const Key('listView'),
                          scrollDirection: Axis.horizontal,

                          itemCount: controller.skills.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              //   key: const Key('paddList'),
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),

                              child: ElevatedButton(
                                key: const Key('elevated'),
                                onPressed: () {
                                  controller.skills.removeAt(index);
                                },
                                child: Text(
                                  controller.skills[index],
                                  //key: const Key('skiText'),
                                ),
                              ),
                            );
                          },
                        )
                      : const Text(""),
                ),
                const SizedBox(
                  height: 20,
                  key: Key('box'),
                ),
                ElevatedButton(
                  key: const Key('nextButton'),
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 58, 0, 229),
                  ),
                  onPressed: () async {
                    Get.to(
                        () => AssignCandidateProject(
                            service: PerformanceService()),
                        arguments: {
                          "skills": controller.formatSearch(controller.skills),
                          "experience": experienceController.text
                        });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.search,
                    style: GoogleFonts.workSans(
                      textStyle: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    key: const Key('nextKey'),
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
