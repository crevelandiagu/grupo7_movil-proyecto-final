import 'dart:convert';

import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../services/cv_service.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      bottomNavigationBar: bottomNavigation((index) => null, context, 0),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getResponse(),
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot){

          if (!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          var data = snapshot.data!;
          List<dynamic> experience = data['experience'];


          return experience.isNotEmpty ? ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider() ,
          padding: EdgeInsets.all(40),
          itemCount: experience.length,
          itemBuilder: (context, index){
            return Container(
               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: Colors.grey[200],
              child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Company ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                    Text(experience[index]['company_name'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),

                        const SizedBox(
                        height: 5,
                      ),

                      Text('Start Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),
                      Text(experience[index]['start_date'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           ),
                           ),

                      const  SizedBox(
                        height: 5,
                      ),

                      Text('End Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(experience[index]['end_date'],
                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           ),
                           ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text('Position ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(experience[index]['position'],
                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           ),
                           ),

                      
                      const SizedBox(
                        height: 5,
                      ),

                      Text(experience[index]['skills'].isNotEmpty ? 'Skills ' : "", 
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),



                      Column(
                        children: [for (var text in experience[index]['skills'])
                         Text(text, style: GoogleFonts.workSans(
                          fontSize: 16
                         ),
                         ),
                         ],
                      ),
                    
                    
                  ],

                
              ),      

            );
          },

      ) : Center(child: Text("No experience"));

        }
        )
      );

  }

   Future<Map<String, dynamic>> getResponse() async {
    
    CVService service = CVService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int candidateId = prefs.getInt("id") as int;
     
     try {

       http.Response response = await service.getExperience(candidateId: candidateId, client: http.Client());
       
       if (response.statusCode == 200) {

        var decodedJson = jsonDecode(response.body);

        return decodedJson;

       }

       return {'experience': []};
      
         
     } catch (e) {
       throw Exception(e);
     }
  }


}