import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SchoolInfo extends StatelessWidget {
  SchoolInfo({super.key});

 
  var skills = [].obs;
  TextEditingController institutionController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  var startDate = "";
  var endDate = "";

  CVService service = CVService();


  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        key: const Key('scroll'),
        child: Obx(()=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: TextField(
                controller: institutionController,
                key: const Key('textSchool'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).school,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).schoolLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: gradeController,
                key: const Key('textDegree'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).degree,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).degreeLabel,
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
                          debugPrint(startDate);                        
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
                          labelText: 'end time',
                        ),
                        onDateSelected: (DateTime value) {
                          endDate = value.toString();
                          debugPrint(endDate);                        
                        },                    
                      ),
                      
                    ),
                  ),
                ],
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
              key: const Key('padding'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("skills"),

                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          key: const Key('skill'),
                          controller: skillController,
                          
                        )),
                      IconButton(
                        key: const Key('skillbutton'),
                        onPressed:() {
                          if (skillController.text.isEmpty) {
                            return;
                          }
                          skills.add(skillController.text);
                          skillController.text = '';
                          
                        },
                        icon: const Icon(Icons.add_circle, key: Key('iconkey'),),
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
                child: skills.isNotEmpty ? 
                       ListView.builder(
                      //  key: const Key('listView'),
                        scrollDirection: Axis.horizontal,
                        
                        itemCount: skills.length,
                        itemBuilder: (context, index){
                          return Padding(
                         //   key: const Key('paddList'),
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            
                            child: ElevatedButton(   
                          //    key: const Key('elevated'),
                              onPressed: () {
                                
                              },
                              child: Text(skills[index], 
                              //key: const Key('skiText'),
                              ),
                            ),
                          );

                        },
                        ) : const Text(""),                       
              ),

             

             const  SizedBox(
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
                  
                  if (!validateFields(institutionController.text, gradeController.text, startDate, endDate)){
                    debugPrint('Alguna false');
                        return;
                  } else {
                    try {
                      SharedPreferences pfres = await SharedPreferences.getInstance();
                      int candidateId = pfres.getInt('id') as int;
                      var listskills = skills.value;
                      debugPrint("candidateId: " + candidateId.toString());

                      http.Response res = await service.postEducation(
                        university: institutionController.text.toLowerCase(),
                       subject: gradeController.text.toLowerCase(),
                       startDate: startDate, endDate: endDate, skills: listskills,
                        candidateId: candidateId, client: http.Client());

                      if (res.statusCode == 201) {
                        debugPrint('mensage: ' + jsonDecode(res.body)['message']);

                        Get.off(()=> Profile());
                      }
                      
                    } catch (e) {

                      debugPrint(e.toString());
                      
                    }
                  }

                },
                child: Text(
                  AppLocalizations.of(context).next, style: GoogleFonts.workSans(
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
    );
  }

  bool validateFields(String intituStr, String gradeStr, String startStr, String endStr) {
    if (intituStr.isNotEmpty && gradeStr.isNotEmpty && startStr.isNotEmpty && endStr.isNotEmpty) {
      return true;
    }
    return false;
  }
}