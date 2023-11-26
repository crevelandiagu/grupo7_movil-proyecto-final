class Constants {
  static String signUpUri = "http://10.0.2.2:3000/candidate/signup";
  static String signInUri = "http://10.0.2.2:3000/candidate/login";
  static String basicinfoUri =
      "http://10.0.2.2:3000/candidate/profile/basicinfo/";
  static String experienceUri =
      "http://10.0.2.2:3000/candidate/profile/experience/";
  static String educationUri =
      "http://10.0.2.2:3000/candidate/profile/education/";
  static String certificatesUri =
      "http://10.0.2.2:3000/candidate/profile/certificates/";

  //entrevistas candidato
  static String listInterviewsUri =
      "http://10.0.2.2:3010/interviews/candidate/";

  static String companySignInUri = "http://10.0.2.2:3001/company/login";

  //crear evalución
  static String createEvaluationPerformanceUri =
      "http://10.0.2.2:3006/performance/make-evaluation";

  //obtener todas las evaluaciones de una empresa "http://10.0.2.2:3006/performance/company/<id_company>"
  static String companyEvaluationsUri =
      "http://10.0.2.2:3006/performance/company/";

  //obtener empleados compañia "http://10.0.2.2:3002/company-employees/employee/<id_company>"
  static String companyEmployeesUri =
      "http://10.0.2.2:3002/company-employees/employee/";

  //obtener projectos compañia "http://10.0.2.2:3007/projects/<id_company>"
  static String projectsUri = "http://10.0.2.2:3007/projects";

  static String candidateEvaluations = "http://10.0.2.2:3007/candidate/";
}
