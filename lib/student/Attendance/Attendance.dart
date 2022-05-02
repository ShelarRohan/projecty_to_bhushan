import 'package:erp_project/Widgets/AppBar.dart';

import 'package:erp_project/Widgets/StudentDetailCard.dart';
import 'package:erp_project/services/studentsharedpreference.dart';
import 'package:erp_project/student/Attendance/OverallAttendance.dart';
import 'package:erp_project/student/Attendance/TodayAttendance.dart';
import 'package:flutter/material.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final StudentUserCardService _userService = StudentUserCardService();

    _userService.readCache();
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: "Attendance",
        menuenabled: false,
        notificationenabled: true,
        ontap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      // drawer: Drawer(
      //   elevation: 0,
      //   child: MainDrawer(),
      // ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserDetailCard(
              studentid: studentid.toString(),
              studentname: studentname.toString(),
              studentdob: studentdob.toString(),
              studentacademic_year: studentacademic_year.toString(),
            ),
            DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(text: 'Subjectwise'),
                          Tab(text: 'Overall'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height *
                        0.68, //height of TabBarView
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TabBarView(
                      children: <Widget>[
                        TodayAttendance(),
                        OverallAttendance(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
