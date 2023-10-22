import 'dart:convert';

import 'package:abc_jobs/candidates/views/Education.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/candidates/views/certification.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/cv_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getResponse(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }

          var data = snapshot.data!;

          debugPrint(data.toString());

          
        //  debugPrint(data);


        return SingleChildScrollView(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
                  padding: EdgeInsets.only(top: 10),
                  width: 180,
                  height: 180,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(data['initial_latter']),
                    ),
                ),

                const SizedBox(
                height: 40,
              ),

              InkWell(
                onTap: () {
                  Get.to(()=>PersonalInfo());
                },
                child: Column(
                    children: [
                     Text(data['full_name'],
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                         const Icon(Icons.location_on, color: Colors.blue,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(data['nacionality'], style: TextStyle(fontSize: 16),),                       
                        ],
                      ),
                        const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Icon(Icons.phone, color: Colors.blue,),
                          const SizedBox(width: 5,),
                          Text(data['phone_number'],
                          style: const TextStyle( fontSize: 16),),
                        ],
                      ),
                        const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          const Icon(Icons.mail, color: Colors.blue,),
                         const SizedBox(width: 5,),
                          Text(data['email'],
                           style: const TextStyle(fontSize: 16),
                           ),
                        ],
                      ),
                     const SizedBox(
                        height: 10,
                      ),
              
                    ],
                  ),
              ),

          const SizedBox(
            height: 20,
          ),

          cardDashboardProfile("Experience", context,
           (){ Get.to(()=>WorkInfo());},
          (){Get.to(()=>Experience());}),
          SizedBox(height: 10,),
          cardDashboardProfile("Education", context,
           (){Get.to(()=>SchoolInfo());},
           (){Get.to(()=>Education());}),
          SizedBox(height: 10,),
          cardDashboardProfile("Certification", context,
          (){Get.to(()=>CertificationInfo());},
          (){Get.to(()=>Certification());}),

          
          //listViews
        
            
          ],
        
          ),
        ),
      );

        }
        )
    );
  }

  Future<Map<String, dynamic>> getResponse() async {
    
    CVService service = CVService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int candidateId = prefs.getInt("id") as int;
     
     try {

       http.Response response = await service.getBasicinfo(candidateId: candidateId, client: http.Client());
       
       if (response.statusCode == 201) {

        var decodedJson = jsonDecode(response.body);

        return decodedJson;

       }

       return {};
      
         
     } catch (e) {
       throw Exception(e);
     }
  }
}