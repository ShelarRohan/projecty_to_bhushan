import 'package:erp_project/main.dart';
import 'package:erp_project/services/studentsharedpreference.dart';
import 'package:erp_project/student/studentonboardscreen/StudentOnboardingscreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../api/api.dart';

class StudentOnboardingscreen2 extends StatefulWidget {
  String kbtug;
  String kbt;
  String token;

  StudentOnboardingscreen2({
    Key? key,
    required this.kbtug,
    required this.kbt,
    required this.token,
  }) : super(key: key);

  @override
  State<StudentOnboardingscreen2> createState() =>
      _StudentOnboardingscreen2State(kbtug, kbt, token);
}

var student_profile;

class _StudentOnboardingscreen2State extends State<StudentOnboardingscreen2> {
  get scaffoldKey => null;
  String kbtug;
  String kbt;
  String token;
  _StudentOnboardingscreen2State(this.kbtug, this.kbt, this.token);

  @override
  void initState() {
    tokenAccess(token, kbtug, kbt);

    super.initState();
  }

  void tokenAccess(String token, String kbtug, String kbt) async {
    // sharedPreferences = await SharedPreferences.getInstance();
    final StudentPrefService _prefService = StudentPrefService();
    Map data = {'token': token, 'kbtid': kbtug, 'user_type': kbt};
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse('http://192.168.43.126:8000/user/notification_token/send/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token 05ca77736659541562b0986768b48a15423251e3"
        },
        body: json.encode(data));

    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      print("statsssa");
      print(jsonResponse);

      // jsonResponse = json.decode(response.body);

    } else {
      print("In Status code false");
    }
  }

  Widget build(BuildContext context) {
    print("In load scr widget ");
    print(kbtug);
    print("End In widget");
    student_profile = Student_Profile_Api(kbtug);

    print("//////////////////////////////////////////////////////////////////");
    print("//////////////////////////////////////////////////////////////////");
    print("//////////////////////////////////////////////////////////////////");
    print(student_profile);
    return Scaffold(
      key: scaffoldKey,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF7DC0FF),
                Color(0xFFBEE5FF),
                Color(0xFFFFFDFF),
                Color(0xFFFEFEFF),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 40, 10, 10),
                  child: Image(
                    image: AssetImage(
                      'images/second.jpeg',
                    ),
                    width: 360,
                    height: 430,
                  )),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 1.0, bottom: 10.0),
                        child: Text(
                          '\t Live your life smarter with us!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 1.0, bottom: 20.0, left: 10.0, right: 10.0),
                        child: Text(
                          'To educate and train common masses through undergraduate, post graduate, research programs by inculcating the values for discipline, quality and .',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.all(25),
                    child: ElevatedButton(
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                StudentOnboardingscreen3(
                              id: student_profile.student_data[0],
                              name: student_profile.student_data[1],
                              dob: student_profile.student_data[6],
                              academic_year: student_profile.student_data[4],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
