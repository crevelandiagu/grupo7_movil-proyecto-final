import 'dart:convert';

import 'package:abc_jobs/candidates/controllers/profile_work_controller.dart';
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
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WorkInfo extends StatelessWidget {
  WorkInfo({super.key, required this.service});

  ProfileWorkController controller = Get.put(ProfileWorkController());

  var startDate = "";
  var endDate = "";

  TextEditingController positionContoller = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController workTypeController = TextEditingController();

  CVService service;

  GlobalKey<ScaffoldMessengerState> scaffold =
      GlobalKey<ScaffoldMessengerState>();

  // final items = [
  //   "Tipo Trabajo 1",
  //   "Tipo Trabajo 2",
  //   "Tipo Trabajo 3",
  //   "Tipo Trabajo 4",
  //   "Tipo Trabajo 5",
  //   "Tipo Trbajo 6",
  //   "Tipo Trabajo 7"
  // ];

  //var skills = [].obs;

  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffold,
      child: Scaffold(
        appBar: customAppBar(),
        bottomNavigationBar: bottomNavigation((index) => null, context, 0),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(AppLocalizations.of(context)!.experience,
                      style: GoogleFonts.workSans(
                          fontSize: 23, fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
                  child: TextField(
                    controller: positionContoller,
                    key: const Key('textPosition'),
                    onChanged: (value) {
                      controller.validatePosition(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.position,
                      errorText: controller.position.value
                          ? null
                          : AppLocalizations.of(context)!.validPosition,
                      hintText: AppLocalizations.of(context)!.positionLabel,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                  child: TextField(
                    controller: workTypeController,
                    key: const Key('textworkType'),
                    onChanged: (value) {
                      controller.validateWorktype(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.location,
                      errorText: controller.workTye.value
                          ? null
                          : AppLocalizations.of(context)!.validlocation,
                      hintText: AppLocalizations.of(context)!.locationLabel,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    controller: companyController,
                    key: const Key('company'),
                    onChanged: (value) {
                      controller.validatCompany(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.companyName,
                      errorText: controller.company.value
                          ? null
                          : AppLocalizations.of(context)!.validCompanyName,
                      hintText: AppLocalizations.of(context)!.companyLabel,
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
                            startDate = DateFormat('yyyy-MM-dd')
                                .format(DateTime.parse(value.toString()));
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
                            // endDate = value.toString();
                            // DateTime input = DateTime.parse(value.toString());
                            endDate = DateFormat('yyyy-MM-dd')
                                .format(DateTime.parse(value.toString()));
                            debugPrint(endDate);
                            controller.endDate.value = true;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 40),
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
                            key: const Key('skillButton'),
                            onPressed: () {
                              if (skillController.text.isEmpty) return;
                              controller.skills.add(skillController.text);
                              skillController.text = '';
                            },
                            icon: const Icon(Icons.add_circle),
                            color: const Color.fromARGB(255, 13, 110, 253),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: controller.skills.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.skills.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.skills.removeAt(index);
                                },
                                child: Text(controller.skills[index]),
                              ),
                            );
                          },
                        )
                      : const Text(""),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  key: const Key('nextButton'),
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size.fromHeight(50),
                    backgroundColor: const Color.fromARGB(255, 58, 0, 229),
                  ),
                  onPressed: () async {
                    if (!controller.validateForm()) {
                      showSnackbar(AppLocalizations.of(context)!.emptyFields,
                          scaffold: scaffold);
                    } else {
                      try {
                        SharedPreferences pfres =
                            await SharedPreferences.getInstance();
                        int candidateId = pfres.getInt('id') as int;
                        var listskills = controller.skills.value;
                        debugPrint("candidateId: " + candidateId.toString());

                        http.Response res = await service.postExperience(
                            position: positionContoller.text.toLowerCase(),
                            companyName: companyController.text.toLowerCase(),
                            startDate: startDate,
                            endDate: endDate,
                            place: workTypeController.text.toLowerCase(),
                            skills: listskills,
                            candidateId: candidateId,
                            client: http.Client());

                        if (res.statusCode == 200) {
                          debugPrint(jsonDecode(res.body)['message']);

                          Get.off(() => Profile(service: CVService()));
                        } else {
                          debugPrint(jsonDecode(res.body)['message']);
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
