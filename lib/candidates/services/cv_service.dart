

import "dart:convert";

import "package:abc_jobs/utils/constants.dart";
import "package:abc_jobs/utils/util.dart";
import "package:http/http.dart" as http;

class CVService {

   Future<http.Response> sendSkills(
    {required List<String> skills,
     required http.Client client}
  ) async {
    
    try {

    http.Response response = await http.post(Uri.parse(Constants.cvUri),
                            headers: buildHeaders(),
                            body: jsonEncode(
                              {
                                'skills' : skills,
                              }
                            )
                            );
    
    return response;
    
    } catch (e){ 
      throw Exception(e);
    }

  }


  Future<http.Response> sendExperience(
    {required List<String> experience,
     required http.Client client}

  ) async {
    
    try {

    http.Response response = await http.post(Uri.parse(Constants.cvUri),
                                    headers: buildHeaders(),
                                    body: jsonEncode(
                                      {
                                        "experience": experience
                                      }

                                    ),
                                    );
    
    return response;

    } catch (e) {
      throw Exception(e);
    }
  }



  Future<http.Response> sendEducation(
    {required List<String> education,
     required http.Client client}

  ) async {
    
    try {

    http.Response response = await http.post(Uri.parse(Constants.cvUri),
                                    headers: buildHeaders(),
                                    body: jsonEncode(
                                      {
                                        "education": education
                                      }

                                    ),
                                    );
    
    return response;

    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> sendCertificates(
    {required List<String> certificates,
     required http.Client client}

  ) async {
    
    try {

    http.Response response = await http.post(Uri.parse(Constants.cvUri),
                                    headers: buildHeaders(),
                                    body: jsonEncode(
                                      {
                                        "certificates": certificates
                                      }

                                    ),
                                    );
    
    return response;

    } catch (e) {
      throw Exception(e);
    }
  }


  Future<http.Response> sendBasicInfo(
    {required String name,
     required String lastname,
     required http.Client client}

  ) async {
    
    try {

    http.Response response = await http.post(Uri.parse(Constants.cvUri),
                                    headers: buildHeaders(),
                                    body: jsonEncode(
                                      {
                                        "basicinfo": {
                                        "name": name,
                                        "lastname": lastname

                                        }
                                      }

                                    ),
                                    );
    
    return response;

    } catch (e) {
      throw Exception(e);
    }
  }



}