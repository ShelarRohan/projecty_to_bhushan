import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_project/Widgets/BouncingButton.dart';
// import 'package:erp_project/Widgets/SendNotification/LeaveHistoryCard.dart';
// import 'package:erp_project/Widgets/LeaveApply/datepicker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/AppBar.dart';

class SendNotification extends StatefulWidget {
  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification>
    with SingleTickerProviderStateMixin {
  late Animation animation, delayedAnimation, muchDelayedAnimation, LeftCurve;
  late AnimationController animationController;
  final searchFieldController = TextEditingController();

  late TextEditingController _applyleavecontroller;
  late String _applyleavevalueChanged;
  late String _applyleavevalueToValidate;
  late String _applyleavevalueSaved;

  late TextEditingController _fromcontroller;
  late String _fromvalueChanged;
  late String _fromvalueToValidate;
  late String _fromvalueSaved;

  late TextEditingController _tocontroller;
  late String _tovalueChanged;
  late String _tovalueToValidate;
  late String _tovalueSaved;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _applyleavecontroller =
        TextEditingController(text: DateTime.now().toString());
    _fromcontroller = TextEditingController(text: DateTime.now().toString());
    _tocontroller = TextEditingController(text: DateTime.now().toString());

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.5, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    animationController.forward();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        final GlobalKey<ScaffoldState> _scaffoldKey =
            new GlobalKey<ScaffoldState>();
        return Scaffold(
          key: _scaffoldKey,
          appBar: CommonAppBar(
              menuenabled: false,
              notificationenabled: false,
              title: "Publish Notification",
              ontap: () {}),
          // drawer: Drawer(
          //   elevation: 0,
          //   child: MainDrawer(),
          // ),
          body: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Divider(
                    //   color: Colors.black.withOpacity(0.5),
                    //   height: 1,
                    // ),
                    // SizedBox(
                    //   height: height * 0.05,
                    // ),
                    // Transform(
                    //   transform: Matrix4.translationValues(
                    //       muchDelayedAnimation.value * width, 0, 0),
                    //   child: Text(
                    //     "Apply Leave Date",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 15,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 13,
                      ),
                      child: Container(
                        // height: height * 0.06,
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // child: Row(
                        //   children: [
                        //     Transform(
                        //       transform: Matrix4.translationValues(
                        //           muchDelayedAnimation.value * width, 0, 0),
                        //       child: Container(
                        //         width: width * 0.75,
                        //         child: DateTimePicker(
                        //           type: DateTimePickerType.date,
                        //           dateMask: 'dd/MM/yyyy',
                        //           controller: _applyleavecontroller,
                        //           //initialValue: _initialValue,
                        //           firstDate: DateTime(2000),
                        //           lastDate: DateTime(2100),
                        //           calendarTitle: "Leave Date",
                        //           confirmText: "Confirm",
                        //           enableSuggestions: true,
                        //           //locale: Locale('en', 'US'),
                        //           onChanged: (val) => setState(
                        //               () => _applyleavevalueChanged = val),
                        //           validator: (val) {
                        //             setState(() =>
                        //                 _applyleavevalueToValidate = val!);
                        //             return null;
                        //           },
                        //           onSaved: (val) => setState(
                        //               () => _applyleavevalueSaved = val!),
                        //         ),
                        //       ),
                        //     ),
                        //     Transform(
                        //       transform: Matrix4.translationValues(
                        //           delayedAnimation.value * width, 0, 0),
                        //       child: Icon(
                        //         Icons.calendar_today,
                        //         color: Colors.black,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Select reciver group",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: DropdownSearch<String>(
                        validator: (v) => v == null ? "required field" : null,
                        hint: "Please Select Reciver group",
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: [
                          "All Students",
                          "SE",
                          "TE",
                          'BE',
                        ],
                        showClearButton: true,
                        onChanged: print,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Notification Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          // height: height * 0.06,
                          height: height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            //autofocus: true,
                            minLines: 1,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              suffixIcon: searchFieldController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () => WidgetsBinding.instance!
                                          .addPostFrameCallback((_) =>
                                              searchFieldController.clear()))
                                  : null,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Notification Body",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 13,
                        ),
                        child: Container(
                          // height: height * 0.06,
                          height: height * 0.25,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            //autofocus: true,
                            minLines: 1,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              suffixIcon: searchFieldController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () => WidgetsBinding.instance!
                                          .addPostFrameCallback((_) =>
                                              searchFieldController.clear()))
                                  : null,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(7),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Bouncing(
                        onPress: () {},
                        child: Container(
                          //height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.blue,
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Send Notification",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform(
                            transform: Matrix4.translationValues(
                                muchDelayedAnimation.value * width, 0, 0),
                            child: Text(
                              "Notification History",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () async {},
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Transform(
                    //   transform: Matrix4.translationValues(
                    //       delayedAnimation.value * width, 0, 0),
                    //   child: Bouncing(
                    //     onPress: () {},
                    //     child: const LeaveHistoryCard(
                    //       reason:
                    //           "this is sample reason.this is sample reason.this is sample reason.this is sample reason.",
                    //       enddate: "12.12.2020",
                    //       startdate: "11.12.2020",
                    //       status: "usual reason",
                    //       adate: "05.12.2020",
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
