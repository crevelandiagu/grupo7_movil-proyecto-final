import "dart:convert";

import "package:abc_jobs/utils/constants.dart";
import "package:abc_jobs/utils/util.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class CVService {
  Future<http.Response> postExperience(
      {required String position,
      required String companyName,
      required String startDate,
      required String endDate,
      required String place,
      required List<dynamic> skills,
      required int candidateId,
      required http.Client client}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${Constants.experienceUri}$candidateId'),
        headers: buildHeaders(),
        body: jsonEncode({
          "position": position,
          "company_name": companyName,
          "start_date": startDate,
          "end_date": endDate,
          "place": place,
          "skills": skills
        }),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> postEducation(
      {required String university,
      required String subject,
      required String startDate,
      required String endDate,
      required List<dynamic> skills,
      required int candidateId,
      required http.Client client}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${Constants.educationUri}$candidateId'),
        headers: buildHeaders(),
        body: jsonEncode({
          "university": university,
          "subject": subject,
          "start_date": startDate,
          "end_date": endDate,
          "skills": skills
        }),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> postCertificates(
      {required String nameCertificate,
      required String company,
      required String expeditionDate,
      required String dateExpiry,
      required int candidateId,
      required http.Client client}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${Constants.certificatesUri}$candidateId'),
        headers: buildHeaders(),
        body: jsonEncode({
          "name_certificate": nameCertificate,
          "company": company,
          "start_date": expeditionDate,
          "end_date": dateExpiry
        }),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> postBasicInfo(
      {required String name,
      required String lastname,
      required String phoneNumber,
      required String numberId,
      required String location,
      required int candidateId,
      required http.Client client}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${Constants.basicinfoUri}$candidateId'),
        headers: buildHeaders(),
        body: jsonEncode({
          "name": name,
          "lastname": lastname,
          "nacionality": location,
          "phone_number": phoneNumber,
          "number_id": numberId
        }),
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<http.Response> getBasicinfo(
  //     {required int candidateId, required http.Client client}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse('${Constants.basicinfoUri}$candidateId'),
  //         headers: buildHeaders());

  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> getEducation(
  //     {required int candidateId, required http.Client client}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse('${Constants.educationUri}$candidateId'),
  //         headers: buildHeaders());

  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> getExperience(
  //     {required int candidateId, required http.Client client}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse('${Constants.experienceUri}$candidateId'),
  //         headers: buildHeaders());

  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<http.Response> getCertificates(
  //     {required int candidateId, required http.Client client}) async {
  //   try {
  //     http.Response response = await http.get(
  //         Uri.parse('${Constants.certificatesUri}$candidateId'),
  //         headers: buildHeaders());

  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // Future<Map<String, dynamic>> getResponse(
  //     http.Client client, String Url) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     int id = prefs.getInt('id') as int;

  //     http.Response res =
  //         await client.get(Uri.parse('$Url$id'), headers: buildHeaders());

  //     if (res.statusCode == 200) {
  //       return jsonDecode(res.body);
  //     }

  //     return {};
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Map<String, dynamic>> getResponseBasicInfo() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') as int;

      http.Response res = await http.Client().get(
          Uri.parse('${Constants.basicinfoUri}$id'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return {};
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getResponseExperience() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') as int;

      http.Response res = await http.Client().get(
          Uri.parse('${Constants.experienceUri}$id'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return {};
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getResponseEducation() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') as int;

      http.Response res = await http.Client().get(
          Uri.parse('${Constants.educationUri}$id'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return {};
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> getResponseCertification() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') as int;

      http.Response res = await http.Client().get(
          Uri.parse('${Constants.certificatesUri}$id'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return {};
    } catch (e) {
      throw Exception(e);
    }
  }
}
