import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/candidates/views/profile.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController numberidController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  CVService service = CVService();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           Container(
                padding: EdgeInsets.only(top: 10),
                width: 150,
                height: 150,
                child: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('Image'),
                  ),
              ),

             Padding(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
              child: TextField(
                controller: nameController,
                key: const Key('textName'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).name,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).nameLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: lastnameController,
                key: const Key('textLastname'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).lastname,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).lastnameLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
              child: TextField(
                controller: numberidController,
                key: const Key('numberId'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).numberId,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).numberIdLabel,
                ),
              ),
              ),
            
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                controller: locationController,
                key: const Key('location'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).location,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).locationLabel,
                ),
              ),
              ),

             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
              child: TextField(
                controller: phonenumberController,
                key: const Key('phone'),
                onChanged: (value) {
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: AppLocalizations.of(context).phoneNumber,
                  //errorText: controller.email.value ? null : AppLocalizations.of(context).valid_email,
                  hintText: AppLocalizations.of(context).phoneLabel,
                ),
              ),
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
                onPressed: () async{
                  try {

                    
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    int candidateId = prefs.getInt('id') as int ;

                    http.Response response = await service.postBasicInfo(
                      name: nameController.text.toLowerCase(),
                      lastname: lastnameController.text.toLowerCase(),
                      numberId: numberidController.text.toLowerCase(),
                      phoneNumber: phonenumberController.text.toLowerCase(),
                      location: locationController.text.toLowerCase(),                      
                      candidateId: candidateId,
                      client: http.Client());

                    
                    if (response.statusCode == 201) {

                      debugPrint(jsonDecode(response.body)['message']);

                       Get.off(()=>Profile());

                    }


                    
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                  
                },
                child: Text(AppLocalizations.of(context).next, style: GoogleFonts.workSans(
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

  


}