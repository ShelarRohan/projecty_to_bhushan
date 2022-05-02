import 'package:flutter/material.dart';

class UserDetailCard extends StatefulWidget {
  String studentid;
  String studentname;
  String studentdob;
  String studentacademic_year;
  UserDetailCard(
      {Key? key,
      required this.studentid,
      required this.studentname,
      required this.studentdob,
      required this.studentacademic_year});
  @override
  _UserDetailCardState createState() => _UserDetailCardState(
      studentid, studentname, studentdob, studentacademic_year);
}

class _UserDetailCardState extends State<UserDetailCard>
    with SingleTickerProviderStateMixin {
  String studentid;
  String studentname;
  String studentdob;
  String studentacademic_year;

  _UserDetailCardState(this.studentid, this.studentname, this.studentdob,
      this.studentacademic_year);

  // late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  // late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // animationController =
    //     AnimationController(duration: Duration(seconds: 3), vsync: this);
    // animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: animationController, curve: Curves.fastOutSlowIn));

    // delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    // muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
    //     parent: animationController,
    //     curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return (

        // animation: animationController,
        // builder: (BuildContext context, Widget? child) {
        Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 3),
      child: Container(
        alignment: Alignment(0, 0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            height: height * 0.17,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Transform(
                      // transform: Matrix4.translationValues(
                      // muchDelayedAnimation.value * width, 0, 0),
                      Center(
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage("images/profile.jpg"),
                        ),
                      ),

                      // Transform(
                      // transform: Matrix4.translationValues(
                      // delayedAnimation.value * width, 0, 0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.orange[50],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  studentid,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                studentname,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "DOB: " + studentdob,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    "Academic Year: " + studentacademic_year,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
