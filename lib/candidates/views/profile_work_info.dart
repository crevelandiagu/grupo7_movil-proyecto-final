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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WorkInfo extends StatelessWidget {
  WorkInfo({super.key});

  var currentValue = "Tipo Trabajo 1".obs;
  var startDate = "";
  var endDate = "";

  TextEditingController positionContoller = TextEditingController();
  TextEditingController companyController = TextEditingController();

  CVService service = CVService();


  final items = [
    "Tipo Trabajo 1",
    "Tipo Trabajo 2",
    "Tipo Trabajo 3",
    "Tipo Trabajo 4",
    "Tipo Trabajo 5",
    "Tipo Trbajo 6",
    "Tipo Trabajo 7"
  ];

  var skills = [].obs;

  TextEditingController skillController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        child: Obx(()=>Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: TextField(
                controller: positionContoller,
                key: const Key('textPosition'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context)!.position,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context)!.positionLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DropdownButtonFormField(
                key: const Key("place"),
                icon: const Icon(Icons.keyboard_arrow_down),                
                value: currentValue.value,
                items: items.map((String item){
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item)
                        ); 
                      }).toList(),
                onChanged: (String? value){
                  currentValue.value = value as String;

                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.employmentType,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                ),

                
              ),

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
              child: TextField(
                controller: companyController,
                key: const Key('company'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context)!.companyName,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context)!.companyLabel,
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
                      child:DateTimeFormField(
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
                       onDateSelected: (DateTime value){
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
                      onDateSelected: (DateTime value){
                        endDate = value.toString();
                      },                 
                      ),
                    ),
                  ),
                ],
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("skills"),

                  Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: skillController,
                          
                        )),
                      IconButton(
                        onPressed:() {
                          if(skillController.text.isEmpty) return;
                          skills.add(skillController.text);
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
                child: skills.isNotEmpty ? 
                       ListView.builder(
                        scrollDirection: Axis.horizontal,
                        
                        itemCount: skills.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            
                            child: ElevatedButton(   
                              onPressed: () {
                                
                              },
                              child: Text(skills[index]),
                            ),
                          );

                        },
                        ) : const Text(""),                       
              ),

             

             const  SizedBox(
                height: 20,
              ),

                ElevatedButton(
                key: const Key('nextButton'),
                style: ElevatedButton.styleFrom(
                 // minimumSize: const Size.fromHeight(50),
                 backgroundColor: Color.fromARGB(255, 58, 0, 229),
                ),
                onPressed: () async {

                   if (!validateFields(
                    positionContoller.text,
                     currentValue.value,
                    companyController.text,
                    startDate, endDate)) {
                      return;
                    } else {

                      try {
                      SharedPreferences pfres = await SharedPreferences.getInstance();
                      int candidateId = pfres.getInt('id') as int;
                      var listskills = skills.value;
                      debugPrint("candidateId: " + candidateId.toString());

                    
                      http.Response res = await service.postExperience(
                        position: positionContoller.text.toLowerCase(),
                        companyName: companyController.text.toLowerCase(),
                         startDate: startDate,
                        endDate: endDate,
                        place: currentValue.value,
                        skills: listskills,
                        candidateId: candidateId,
                         client: http.Client());

                        if (res.statusCode == 201) {

                          debugPrint(jsonDecode(res.body)['message']);

                          Get.off(()=> Profile());
                        }

                        
                      } catch (e) {
                        debugPrint(e.toString());
                      }


                    }




                },
                child: Text(AppLocalizations.of(context)!.next, style: GoogleFonts.workSans(
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
    );
  }


  bool validateFields(String posStr, String typeStr, String companyStr, String startStr, String endStr) {
    if (posStr.isNotEmpty && typeStr.isNotEmpty && companyStr.isNotEmpty && startStr.isNotEmpty && endStr.isNotEmpty) {
      return true;
    }
    return false;
  }


}