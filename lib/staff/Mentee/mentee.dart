import 'package:erp_project/Widgets/AppBar.dart';
import 'package:erp_project/Widgets/Mentee/MenteeCard.dart';

import 'package:erp_project/api/api.dart';
import 'package:erp_project/api/menteemodal/mentee.dart';
import 'package:erp_project/services/staffsharedpreference.dart';

import 'package:flutter/material.dart';

import '../SendNotification/SendMenteeNoti.dart';

class Mentee extends StatefulWidget {
  List<MenteeModal> mentees;
  Mentee({
    Key? key,
    required this.mentees,
  }) : super(key: key);
  @override
  _MenteeState createState() => _MenteeState(mentees);
}

class _MenteeState extends State<Mentee> {
  List<MenteeModal> mentees;
  _MenteeState(this.mentees);

  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final StaffPrefService _prefService = StaffPrefService();
    final StaffUserCardService _userService = StaffUserCardService();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    _prefService.readCache();
    _userService.readCache();

    print("In widget ");
    print("222222222222222222222222222222222222222222");
    print(mentees.length);
    print(empid);
    print("End In widget");
    final staff_profile = Staff_Profile_Api(empid);

    return Scaffold(
      appBar: CommonAppBar(
        menuenabled: false,
        notificationenabled: true,
        ontap: () {},
        title: "Staff Mentee",
      ),

      body: Container(
        child: ListView.builder(
            itemCount: mentees.length,
            itemBuilder: (context, index) {
              print(mentees.length);
              var menData = mentees[index];
              print("data");
              print("data");
              print("data");
              print("data");

              print(menData.STUDENT_ID);
              print(menData.NAME);
              print(menData.PER_PNONE_NO);
              return MenteeCard(
                  student_id: menData.STUDENT_ID ?? "",
                  name: menData.NAME ?? "",
                  surname: menData.SURNAME,
                  parent_name: menData.PARENT_NAME ?? "",
                  phone_no: menData.PER_PNONE_NO ?? "",
                  email: menData.EMAIL_ID ?? "");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => SendMenteeNoti(),
            ),
          );
          //code to execute on button press
        },
        child: Icon(Icons.send), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.redAccent,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      // key: scaffoldKey,

      // backgroundColor: Colors.blue,
      // body: ListView(
      //   padding: EdgeInsets.zero,
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     UserDetailCard(
      //       id: id.toString(),
      //       name: name.toString(),
      //       dob: dob.toString(),
      //       academic_year: department.toString(),
      //     ),
      //     Padding(
      //       padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
      //       child: Row(
      //         mainAxisSize: MainAxisSize.max,
      //         children: [
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             height: 30,
      //             decoration: BoxDecoration(
      //                 color: Color(0xFF5189E9),
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(30),
      //                 )),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.max,
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   'Details',
      //                   style: TextStyle(
      //                     fontFamily: 'Poppins',
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 3),
      //       child: Container(
      //         alignment: Alignment(0, 0),
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 10.0, right: 0.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.blue,
      //               borderRadius: BorderRadius.circular(5),
      //             ),
      //             height: height * 0.17,
      //             width: double.infinity,
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       // Transform(
      //                       // transform: Matrix4.translationValues(
      //                       // muchDelayedAnimation.value * width, 0, 0),

      //                       // Transform(
      //                       // transform: Matrix4.translationValues(
      //                       // delayedAnimation.value * width, 0, 0),
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 15.0),
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Padding(
      //                               padding: const EdgeInsets.only(top: 8.0),
      //                               child: Container(
      //                                 padding: EdgeInsets.all(3),
      //                                 decoration: BoxDecoration(
      //                                   color: Colors.orange[50],
      //                                   borderRadius: BorderRadius.circular(10),
      //                                 ),
      //                                 child: Text(
      //                                   "KBTUG18075",
      //                                   style: TextStyle(
      //                                     fontWeight: FontWeight.bold,
      //                                     fontSize: 13,
      //                                     color: Colors.deepOrange,
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                             Padding(
      //                               padding: const EdgeInsets.only(top: 10.0),
      //                               child: Text(
      //                                 "Bhanudas Rane",
      //                                 style: TextStyle(
      //                                   fontWeight: FontWeight.bold,
      //                                   fontSize: 21,
      //                                   color: Colors.white,
      //                                 ),
      //                               ),
      //                             ),
      //                             Padding(
      //                               padding: const EdgeInsets.only(top: 8.0),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.spaceBetween,
      //                                 children: const [
      //                                   Text(
      //                                     "Branch: I.T.",
      //                                     style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Colors.white,
      //                                     ),
      //                                   ),
      //                                   SizedBox(
      //                                     width: 50,
      //                                   ),
      //                                   Text(
      //                                     "Class: B.E.",
      //                                     style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       color: Colors.white,
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ),
      //                       // ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
