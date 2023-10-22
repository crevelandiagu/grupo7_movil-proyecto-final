import 'dart:convert';

import 'package:abc_jobs/candidates/services/cv_service.dart';
import 'package:abc_jobs/common_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Certification extends StatelessWidget {
  const Certification({super.key});




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
          List<dynamic> certificates = data['certificates'];

          return certificates.isNotEmpty ? ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          padding: EdgeInsets.all(30),
          itemCount: certificates.length,
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              color: Colors.grey[200],

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text('Certificate ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(certificates[index]['name_certificate'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      
                      SizedBox(
                        height: 5,
                      ),

                  Text('Organization ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(certificates[index]['company'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      
                      SizedBox(
                        height: 5,
                      ),

                      
                      Text('Expedition Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),
                      Text(certificates[index]['expedition_date'],

                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),

                      SizedBox(
                        height: 5,
                      ),

                      Text('Expiration Date ',
                           style: GoogleFonts.workSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                           )
                           ),

                      Text(certificates[index]['date_expiry'],
                      style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                           )),
                      
                     const SizedBox(
                        height: 5,
                      ),

                ],
              ),


            );
          }
          ): Center(child: Text('No certificates'),);

        }
        ),
      );

  }

   Future<Map<String, dynamic>> getResponse() async {
    
    CVService service = CVService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int candidateId = prefs.getInt("id") as int;
     
     try {

       http.Response response = await service.getCertificates(candidateId: candidateId, client: http.Client());
       
       if (response.statusCode == 200) {

        var decodedJson = jsonDecode(response.body);

        return decodedJson;

       }

       return {'certificates': []};
      
         
     } catch (e) {
       throw Exception(e);
     }
  }


}