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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int companyId = prefs.getInt('companyId') as int;

      http.Response res = await http.get(
          Uri.parse('${Constants.projectsUri}?companyId=$companyId'),
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

  Future<Map<String, dynamic>> startProcess(
      {required String projectId, required String candidateId}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int companyId = prefs.getInt('companyId') as int;

      http.Response res = await http.post(
          Uri.parse(Constants.candidateStartProcess),
          body: jsonEncode({
            "companyId": companyId,
            "projectId": projectId,
            "candidateId": candidateId
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

  Future<Map<String, dynamic>> getCvCandidateProject(
      {required int candidateId}) async {
    try {
      http.Response res = await http.get(
          Uri.parse('${Constants.getCandidateCvProject}$candidateId'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return {};
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

  Future<Map<dynamic, dynamic>> evaluarTest(
      {required int score, required int assementId}) async {
    try {
      http.Response res = await http.post(
          Uri.parse(
              '${Constants.companyEvaluateCandidateUri}$assementId/candidate'),
          body: jsonEncode({
            "score": score,
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

  Future<List<dynamic>> buscarCandidatoParaProyecto(
      {String? skills, String? experience}) async {
    try {
      http.Response res = await http.get(
          Uri.parse(
              '${Constants.buscarCandidatoParaProyectoUri}?skill=$skills&experienceYears=$experience'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> evaluarPerformance(
      {required int score, required int performanceId}) async {
    try {
      http.Response res = await http.post(
          Uri.parse(Constants.companyEvaluatePerformanceUri),
          body: jsonEncode({"score": score, "performanceId": performanceId}),
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
