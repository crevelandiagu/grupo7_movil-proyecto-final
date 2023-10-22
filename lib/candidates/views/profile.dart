import 'package:abc_jobs/candidates/views/Education.dart';
import 'package:abc_jobs/candidates/views/experience.dart';
import 'package:abc_jobs/candidates/views/profile_certification_info.dart';
import 'package:abc_jobs/candidates/views/profile_school_info.dart';
import 'package:abc_jobs/candidates/views/profile_work_info.dart';
import 'package:abc_jobs/candidates/views/certification.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
                  padding: EdgeInsets.only(top: 10),
                  width: 180,
                  height: 180,
                  child: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('Image'),
                    ),
                ),

                const SizedBox(
                height: 40,
              ),

              Column(
                  children: [
                   const Text('Nombre',
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
                      children: const [
                        Icon(Icons.location_on, color: Colors.blue,),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Location', style: TextStyle(fontSize: 16),),                       
                      ],
                    ),
                      const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.phone, color: Colors.blue,),
                        SizedBox(width: 5,),
                        Text('phone number',
                        style: TextStyle( fontSize: 16),),
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
                        Text("email@email.com",
                         style: const TextStyle(fontSize: 16),
                         ),
                      ],
                    ),
                   const SizedBox(
                      height: 10,
                    ),

                  ],
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
        
          
          //botones +
          /* Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: IconButton(
                  icon: const Icon(Icons.add_circle_rounded),
                  onPressed: () {
                    
                  },
                   color: const Color.fromARGB(255, 13, 110, 253),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(55, 0, 30, 0),
                child: IconButton(
                  icon: const Icon(Icons.add_circle_rounded),
                  color: const Color.fromARGB(255, 13, 110, 253),
                  onPressed: () {
                    
                  },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: IconButton(
                  icon: const Icon(Icons.add_circle_rounded),
                  onPressed: () {
                    
                  },
                   color: const Color.fromARGB(255, 13, 110, 253),
                  ),
                ),
            ],

          ),
 */
            
          ],
        
          ),
        ),
      ),
    );
  }
}