// import 'dart:async';

import 'package:erp_project/api/api.dart';
import 'package:erp_project/main.dart';
import 'package:erp_project/services/studentsharedpreference.dart';
import 'package:erp_project/student/studentonboardscreen/StudentOnboardingscreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'dart:async';

import 'package:erp_project/api/api.dart';
import 'package:erp_project/main.dart';
import 'package:erp_project/services/studentsharedpreference.dart';
import 'package:erp_project/student/studentonboardscreen/StudentOnboardingscreen2.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class StudentOnboardingscreen1 extends StatefulWidget {
  const StudentOnboardingscreen1({Key? key}) : super(key: key);

  @override
  State<StudentOnboardingscreen1> createState() =>
      _StudentOnboardingscreen1State();
}

var student_profile;
String? mtoken = "";
String kbt = "kbt";

class _StudentOnboardingscreen1State extends State<StudentOnboardingscreen1> {
  get scaffoldKey => null;
  // late AndroidNotificationChannel channel;
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Widget build(BuildContext context) {
    final StudentToken _studentToken = StudentToken();

    _studentToken.readCache();

    final StudentPrefService _prefService = StudentPrefService();
    _prefService.readCache();

    // student_profile = Student_Profile_Api(kbtug);
    // print(kbtug);
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
                      'images/first.jpeg',
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
                          'Connect people around the world!',
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
                          'Maratha Vidya Prasarak Samaj Maratha Vidya prasarak Samajs Karmaveer Baburao Ganpatrao Thakare College of Engineering.',
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
                                  StudentOnboardingscreen2(
                                      kbtug: kbtug!, token: token!, kbt: kbt),
                            ),
                            // tokenAccess(token, kbtug, kbt),
                          );
                        }),
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
