import 'dart:convert';

import 'package:abc_jobs/candidates/controllers/profile_school_controller.dart';
import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SchoolInfo extends StatelessWidget {
  SchoolInfo({super.key, required this.service});

  ProfileSchoolController controller = Get.put(ProfileSchoolController());

  TextEditingController institutionController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  var startDate = "";
  var endDate = "";

  CVService service;

  TextEditingController skillController = TextEditingController();

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        appBar: customAppBar(),
        bottomNavigationBar: bottomNavigation((index) => null, context, 0),
        body: SingleChildScrollView(
          key: const Key('scroll'),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
                  child: TextField(
                    controller: institutionController,
                    key: const Key('textSchool'),
                    onChanged: (value) {
                      controller.validateSchool(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.school,
                      errorText: controller.school.value
                          ? null
                          : AppLocalizations.of(context)!.validSchool,
                      hintText: AppLocalizations.of(context)!.schoolLabel,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    controller: gradeController,
                    key: const Key('textDegree'),
                    onChanged: (value) {
                      controller.validateDegree(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.degree,
                      errorText: controller.degree.value
                          ? null
                          : AppLocalizations.of(context)!.validDegree,
                      hintText: AppLocalizations.of(context)!.degreeLabel,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DateTimeFormField(
                          key: const Key('startdate'),
                          mode: DateTimeFieldPickerMode.date,
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: AppLocalizations.of(context)!.startDate,
                            errorText: controller.startDate.value
                                ? null
                                : AppLocalizations.of(context)!.chooseDate,
                          ),
                          onDateSelected: (DateTime value) {
                            startDate = value.toString();
                            controller.startDate.value = true;
                          },
                        ),
                      ),
                    ),
                    //  SizedBox(width: 10,),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DateTimeFormField(
                          key: const Key('enddate'),
                          mode: DateTimeFieldPickerMode.date,
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.event_note),
                            labelText: AppLocalizations.of(context)!.endDate,
                            errorText: controller.endDate.value
                                ? null
                                : AppLocalizations.of(context)!.chooseDate,
                          ),
                          onDateSelected: (DateTime value) {
                            endDate = value.toString();
                            controller.endDate.value = true;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: TextField(
                    controller: positionController,
                    key: const Key('textPosition'),
                    onChanged: (value) {
                      controller.validatePosition(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.location,
                      errorText: controller.position.value
                          ? null
                          : AppLocalizations.of(context)!.validlocation,
                      hintText: AppLocalizations.of(context)!.positionLabel,
                    ),
                  ),
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
                                //    key: const Key('elevated'),
                                onPressed: () {},
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
                    if (!controller.validateFields()) {
                      showSnackbar(AppLocalizations.of(context)!.emptyFields,
                          scaffold: scaffold);
                    } else {
                      try {
                        SharedPreferences pfres =
                            await SharedPreferences.getInstance();
                        int candidateId = pfres.getInt('id') as int;
                        var listskills = controller.skills.value;
                        debugPrint("candidateId: " + candidateId.toString());

                        http.Response res = await service.postEducation(
                            university:
                                institutionController.text.toLowerCase(),
                            subject: gradeController.text.toLowerCase(),
                            startDate: startDate,
                            endDate: endDate,
                            skills: listskills,
                            candidateId: candidateId,
                            client: http.Client());

                        if (res.statusCode == 200) {
                          debugPrint(
                              'mensage: ' + jsonDecode(res.body)['message']);

                          Get.off(() => Profile(
                                service: CVService(),
                              ));
                        }
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.next,
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
