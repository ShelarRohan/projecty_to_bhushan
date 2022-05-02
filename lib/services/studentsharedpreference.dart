import 'package:shared_preferences/shared_preferences.dart';

String? kbtug;
String? studentid;
String? studentdob;
String? studentname;
String? studentacademic_year;

String? mtoken;
String? token;

class StudentToken {
  Future createCache(String mtoken) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("token", mtoken);
    print(mtoken);
    print("%%%%%%%%%%%%%%%%% mtoken %%%%%%%%%%%%%%%%");
    print(mtoken);
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    // print(_preferences.getString("kbtid"));
    token = _preferences.getString("token");
    print(token);
    print("this is reading tokenn: -");
    return token;
  }

  Future removeCache(String token) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("token");
  }
}

class StudentPrefService {
  Future createCache(String kbtid) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("kbtid", kbtid);
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    // print(_preferences.getString("kbtid"));
    kbtug = _preferences.getString("kbtid");
    print(kbtug);
    print("this is cache: -");
    return kbtug;
  }

  Future removeCache(String kbtid) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("kbtid");
  }
}

class StudentUserCardService {
  Future createCache(String studentidid, String studentidname,
      String studentiddob, String studentidacademic_year) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    _preferences.setString("studentid", studentidid);
    _preferences.setString("studentname", studentidname);
    _preferences.setString("studentdob", studentiddob);
    _preferences.setString("studentacademic_year", studentidacademic_year);
    print("set alll usercard service ");
    print(studentidid);
    print(studentiddob);
    print(studentidacademic_year);
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    studentid = _preferences.getString("studentid");
    studentname = _preferences.getString("studentname");
    studentdob = _preferences.getString("studentdob");
    studentacademic_year = _preferences.getString("studentacademic_year");
    print("this is cache: -");
    return studentid;
  }

  Future removeCache(
    String studentid,
    String studentname,
    String studentdob,
    String studentacademic_year,
  ) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("studentid");
    _preferences.remove("studentname");
    _preferences.remove("studentdob");
    _preferences.remove("studentacademic_year");
  }
}
