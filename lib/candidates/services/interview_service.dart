import 'dart:convert';

import 'package:abc_jobs/utils/constants.dart';
import 'package:abc_jobs/utils/util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InterviewService {
  Future<List<dynamic>> getInterviewsCanditate() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('id') as int;

      http.Response res = await http.get(
          Uri.parse('${Constants.listInterviewsUri}$id'),
          headers: buildHeaders());

      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }

      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
