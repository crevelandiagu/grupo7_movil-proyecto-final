import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getResponse(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){

          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );            
          }

          var data = snapshot.data!;
          List<dynamic> education = data['education'];
           debugPrint(data.toString());

        return education.isNotEmpty ? ListView.separated(
          padding: EdgeInsets.all(40),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: education.length,
          itemBuilder: (context, index){

            return Container(           
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: Colors.grey[200],      
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('University ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(education[index]['university'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      
                      SizedBox(
                        height: 5,
                      ),
                      
                      
                      Text('Grade ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),
                      
                      Text(education[index]['subject'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      SizedBox(
                        height: 5,
                      ),
                      
                      Text('Start Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),
                      Text(education[index]['start_date'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),

                      SizedBox(
                        height: 5,
                      ),


                      Text('End Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(education[index]['end_date'],
                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      
                     const SizedBox(
                        height: 5,
                      ),

                      
                      Text(education[index]['skills'].isNotEmpty ? 'Skills ' : "", 
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),
                      
                      /* Text(education[index]['skills'].toString(),

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )), */
                      
                      Column(
                        children: [for (var text in education[index]['skills'])
                         Text(text, style: GoogleFonts.workSans(
                          fontSize: 16
                         ),)],
                      )

                      /* Column(
                        children: education[index]['skills'].isNotEmpty ?
                        agregarSkills(education[index]['skills']) : [Text('No skills')]
                      ) */

                      
                       
                    ],
                  )
            );
          }
          
      ) : const Center(child: Text('No education registered'),);

        },
        ),
      );

  }

  Future<Map<String, dynamic>> getResponse() async {
    
    CVService service = CVService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int candidateId = prefs.getInt("id") as int;
     
     try {

       http.Response response = await service.getEducation(candidateId: candidateId, client: http.Client());
       
       if (response.statusCode == 200) {

        var decodedJson = jsonDecode(response.body);

        return decodedJson;

       }

       return {'education': []};
      
         
     } catch (e) {
       throw Exception(e);
     }
  }


}