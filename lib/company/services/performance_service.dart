import 'dart:convert';

import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PerformanceService {
  Future<List<dynamic>> getAllEvaluationsCompany() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int companyId = prefs.getInt('companyId') as int;

      http.Response res = await http.get(
          Uri.parse('${Constants.companyEvaluationsUri}$companyId/evaluation'),
          headers: buildHeaders());
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> crearEvaluacionDesempeno(
      {required int candidateId,
      required int projectId,
      required int employeeId,
      required int score}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int companyId = prefs.getInt('companyId') as int;

      http.Response res =
          await http.post(Uri.parse(Constants.createEvaluationPerformanceUri),
              body: jsonEncode({
                "candidateId": candidateId,
                "companyId": companyId,
                "employeeId": employeeId,
                "projectId": projectId,
                "score": score
              }),
              headers: buildHeaders());
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return {};
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<dynamic>> getAllProjects() async {
    try {
      http.Response res = await http.get(Uri.parse(Constants.projectsUri),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<dynamic>> getAllTestResults() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int companyId = prefs.getInt('companyId') as int;

      http.Response res = await http.get(
          Uri.parse('${Constants.companyGetResultTestsUri}$companyId'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<List<dynamic>> getAllEmployees() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     int companyId = prefs.getInt('companyId') as int;

  //     http.Response res = await http.get(
  //         Uri.parse('${Constants.companyEmployeesUri}$companyId'),
  //         headers: buildHeaders());

  //     if (res.statusCode == 200) {
  //       return jsonDecode(res.body);
  //     }
  //     return [];
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
