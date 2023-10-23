import 'dart:convert';

import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/cv_service.dart';

class CertificationInfo extends StatelessWidget {
  CertificationInfo({super.key});

  CVService service = CVService();
  TextEditingController certController = TextEditingController();
  TextEditingController orgContoller = TextEditingController();
  String startDate = "";
  String endDate = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: TextField(
                controller: certController,
                key: const Key('textCertification'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).certification,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).certificationLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: orgContoller,
                key: const Key('textOrg'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).organization,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).organizationLabel,
                ),
              ),
              ),

              const SizedBox(
                height: 18,),
            
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: DateTimeFormField(
                        key: const Key('startdate'),
                        mode: DateTimeFieldPickerMode.date,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2100),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'start date',
                        ),
                        onDateSelected: (DateTime value) {
                          startDate = value.toString();
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
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.event_note),
                          labelText: 'end date',
                        ),
                        onDateSelected: (DateTime value) {
                          endDate = value.toString();
                        },                 
                      ),
                    ),
                  ),
                ],
              ),

             
              


             const  SizedBox(
                height: 40,
              ),

                ElevatedButton(
                key: const Key('createButton'),
                style: ElevatedButton.styleFrom(
                 // minimumSize: const Size.fromHeight(50),
                 backgroundColor: Color.fromARGB(255, 58, 0, 229),
                ),
                onPressed: () async {

                  if (!validateFields(
                    certController.text,
                    orgContoller.text,
                    startDate,
                    endDate)) {
                      return;
                    } else {

                      try {

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        int candidateId = prefs.getInt('id') as int;

                        http.Response res = await service.postCertificates(
                          nameCertificate: certController.text.toString(),
                          company: orgContoller.text.toLowerCase(),
                          expeditionDate: startDate,
                          dateExpiry: endDate,
                          candidateId: candidateId,
                          client: http.Client());

                        
                        if (res.statusCode == 201) {
                          debugPrint(jsonDecode(res.body)['message']);

                          Get.off(()=>Profile());
                        }

                        
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                    }

                },
                child: Text(AppLocalizations.of(context).createButton, style: GoogleFonts.workSans(
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
    );
  }

  bool validateFields(String certStr, String orgStr, String startStr, String endStr) {
    if (certStr.isNotEmpty && orgStr.isNotEmpty && endStr.isNotEmpty) {
      return true;
    }
    return false;
  }
}