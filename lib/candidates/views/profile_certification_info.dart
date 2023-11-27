import 'dart:convert';

import 'package:abc_jobs/candidates/controllers/profile_certification_controller.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/cv_service.dart';

class CertificationInfo extends StatelessWidget {
  CertificationInfo({super.key, required this.service});

  CVService service;

  TextEditingController certController = TextEditingController();
  TextEditingController orgContoller = TextEditingController();

  ProfileCertificationController controller =
      Get.put(ProfileCertificationController());
  String startDate = "";
  String endDate = "";

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
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(AppLocalizations.of(context)!.certificate,
                      style: GoogleFonts.workSans(
                          fontSize: 23, fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                  child: TextField(
                    controller: certController,
                    key: const Key('textCertification'),
                    onChanged: (value) {
                      controller.validateCertification(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.certification,
                      errorText: controller.certification.value
                          ? null
                          : AppLocalizations.of(context)!.validcertification,
                      hintText:
                          AppLocalizations.of(context)!.certificationLabel,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: TextField(
                    controller: orgContoller,
                    key: const Key('textOrg'),
                    onChanged: (value) {
                      controller.validateOrganization(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: AppLocalizations.of(context)!.organization,
                      errorText: controller.organization.value
                          ? null
                          : AppLocalizations.of(context)!.validorganization,
                      hintText: AppLocalizations.of(context)!.organizationLabel,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
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
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  key: const Key('createButton'),
                  style: ElevatedButton.styleFrom(
                    // minimumSize: const Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 58, 0, 229),
                  ),
                  onPressed: () async {
                    if (!controller.validateFields()) {
                      showSnackbar(AppLocalizations.of(context)!.emptyFields,
                          scaffold: scaffold);
                      return;
                    } else {
                      try {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        int candidateId = prefs.getInt('id') as int;

                        http.Response res = await service.postCertificates(
                            nameCertificate: certController.text.toString(),
                            company: orgContoller.text.toLowerCase(),
                            expeditionDate: startDate,
                            dateExpiry: endDate,
                            candidateId: candidateId,
                            client: http.Client());

                        if (res.statusCode == 200) {
                          debugPrint(jsonDecode(res.body)['message']);

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
                    AppLocalizations.of(context)!.createButton,
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
