import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {

  final int port;
  final String host;
  final String path;
  
  const AuthService(this.port, this.host, this.path);

  Future<void> signUp(String username, String password) async{
    var response = await http.post(Uri.parse("http://$host${port.toString()}$path"), headers: buildHeaders(),
                      body: jsonEncode(
                        {
                        "user": username,
                        "password": password
                        }
                      ));
    
    if (response.statusCode == 200) {
      //Todo
    }


  }

  Future<void> signIn(String username, String password) async {
    
  }




}


Map<String, String> buildHeaders({String? token}) {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  if (token != null) {
    headers['Authorization'] = "Bearer $token";
  }

  return headers;

}

