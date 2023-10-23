import 'package:abc_jobs/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("test constants", (){

    expect("http://10.0.2.2:3000/candidate/signup", Constants.signUpUri);
    expect("http://10.0.2.2:3000/candidate/login", Constants.signInUri);
    expect("http://10.0.2.2:3000/candidate/profile/basicinfo/", Constants.basicinfoUri);
    expect("http://10.0.2.2:3000/candidate/profile/experience/", Constants.experienceUri);
    expect("http://10.0.2.2:3000/candidate/profile/education/", Constants.educationUri);
    expect("http://10.0.2.2:3000/candidate/profile/certificates/", Constants.certificatesUri);

  });
  
}