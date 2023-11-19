import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("test constants", (){

    expect(Constants.signUpUri, "http://10.0.2.2:3000/candidate/signup");
    expect(Constants.signInUri, "http://10.0.2.2:3000/candidate/login");
    expect( Constants.basicinfoUri, "http://10.0.2.2:3000/candidate/profile/basicinfo/");
    expect(Constants.experienceUri, "http://10.0.2.2:3000/candidate/profile/experience/");
    expect(Constants.educationUri, "http://10.0.2.2:3000/candidate/profile/education/");
    expect(Constants.certificatesUri,"http://10.0.2.2:3000/candidate/profile/certificates/");

  });
  
}