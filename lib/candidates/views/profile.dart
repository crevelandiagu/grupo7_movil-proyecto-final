import 'dart:convert';

import 'package:abc_jobs/candidates/views/Education.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_personal_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/candidates/views/certification.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../services/cv_service.dart';

class Profile extends StatelessWidget {

  Profile({super.key});

   CVService service = CVService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
        future: service.getResponse(http.Client(), Constants.basicinfoUri),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(),);
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
                    key: const Key('circle'),
                    backgroundColor: Colors.grey,
                    child: Text(data['initial_latter']),
                    ),
                ),

                const SizedBox(
                height: 40,
              ),

              InkWell(
                key: const Key('ink'),
                onTap: () {
                  Get.to(()=>PersonalInfo(service: service));
                },
                child: Column(
                    children: [
                     Text(data['full_name'],
                     key: const Key('fullname'),
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
                        children:  [
                          const Icon(Icons.phone, color: Colors.blue,),
                          const SizedBox(width: 5,),
                          Text(
                          data['phone_number'] ?? "",
                          key: const Key('phone_number'),
                          style: const TextStyle( fontSize: 16),
                          ),
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
                  ),
              ),

          const SizedBox(
            height: 20,
          ),

          cardDashboardProfile("Experience", context,
           (){ Get.to(()=>WorkInfo(service: service,));},
          (){Get.to(()=>Experience(service: service));}),
          const SizedBox(height: 10,),
          cardDashboardProfile("Education", context,
           (){Get.to(()=>SchoolInfo(service: service,));},
           (){Get.to(()=>Education(service: service,));}),
          const SizedBox(height: 10,),
          cardDashboardProfile("Certification", context,
          (){Get.to(()=>CertificationInfo(service: service,));},
          (){Get.to(()=>Certification(service: service,));}),

          
          //listViews
        
            
          ],
        
          ),
        ),
      );

        }
        )
    );
  }

}