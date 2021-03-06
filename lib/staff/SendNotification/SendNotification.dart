import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:erp_project/Widgets/BouncingButton.dart';
import 'package:erp_project/services/staffsharedpreference.dart';
// import 'package:erp_project/Widgets/SendNotification/LeaveHistoryCard.dart';
// import 'package:erp_project/Widgets/LeaveApply/datepicker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/AppBar.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'dart:convert' as convert;

class SendNotification extends StatefulWidget {
  @override
  _SendNotificationState createState() => _SendNotificationState();
}

class _SendNotificationState extends State<SendNotification>
    with SingleTickerProviderStateMixin {
  List? _myActivities;
  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }

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
    _myActivities = [];
    _myActivitiesResult = '';
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
    animationController.dispose();
    super.dispose();
  }

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print("Image selected in getimage");
      setState(() {});
    } else {
      print('no image selected');
    }
  }

  final TextEditingController notificationController =
      new TextEditingController();
  final TextEditingController notification_body_Controller =
      new TextEditingController();
  // final TextEditingController passwordController = new TextEditingController();

  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    uploaddata(String notititle, String notibody, File image,
        String myActivitiesResult) async {
      // sharedPreferences = await SharedPreferences.getInstance();
      final StaffPrefService _prefService = StaffPrefService();

      _prefService.readCache();

      print("Empidddd");

      print(empid);
      print(myActivitiesResult);
      // print(myActivitiesResult.runtimeType);

      print("empiddd");

      var uri =
          Uri.parse('http://192.168.43.126:8000/user/notification/token/');

      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] =
          "Token 05ca77736659541562b0986768b48a15423251e3";
      request.fields['title'] = notititle;
      request.fields['message'] = notibody;
      request.fields['notice_type'] = "Notification";
      request.fields['send_to'] = "class";
      request.fields['from_kbtid'] = empid!;
      request.fields['send_to_class'] = myActivitiesResult;

      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(image);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

      print(image.path);
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

      request.files
          .add(await http.MultipartFile.fromPath("notice_file", image.path));

      var response = await request.send();

      print("result");

      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      // print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        print("statsssa");
        // jsonResponse = json.decode(response.body);
        // print(jsonResponse);
      } else {
        setState(() {
          // _isLoading = false;
        });
        // print(response.body);
      }
    }

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
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Text(
                        "Select Class",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(16),
                            child: MultiSelectFormField(
                              autovalidate: AutovalidateMode.disabled,
                              chipBackGroundColor: Colors.blue,
                              chipLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              dialogTextStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                              checkBoxActiveColor: Colors.blue,
                              checkBoxCheckColor: Colors.white,
                              dialogShapeBorder: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              title: Text(
                                "Classes",
                                style: TextStyle(fontSize: 16),
                              ),
                              validator: (value) {
                                if (value == null || value.length == 0) {
                                  return 'Please select one or more options';
                                }
                                return null;
                              },
                              dataSource: [
                                {
                                  "display": "SE",
                                  "value": "SE",
                                },
                                {
                                  "display": "TE",
                                  "value": "TE",
                                },
                                {
                                  "display": "BE",
                                  "value": "BE",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                              okButtonLabel: 'OK',
                              cancelButtonLabel: 'CANCEL',
                              hintWidget: Text('Please choose one or more'),
                              initialValue: _myActivities,
                              onSaved: (value) {
                                if (value == null) return;
                                setState(() {
                                  _myActivities = value;
                                });
                              },
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(8),
                          //   child: ElevatedButton(
                          //     child: Text('Save'),
                          //     onPressed: _saveForm,
                          //   ),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.all(16),
                          //   child: Text(_myActivitiesResult),
                          // )
                        ],
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
                            controller: notificationController,
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
                    SizedBox(
                      height: height * 0.010,
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
                            controller: notification_body_Controller,
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
                    // SizedBox(
                    //   height: height * 0.010,
                    // ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                            child: image == null
                                ? Center(
                                    child: Text('Pick Image'),
                                  )
                                : Container(
                                    child: Center(
                                      child: Image.file(
                                        File(image!.path).absolute,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0, 0),
                      child: Bouncing(
                        onPress: () {
                          setState(() {
                            _myActivitiesResult = _myActivities!.join(',');
                          });
                          uploaddata(
                              notificationController.text,
                              notification_body_Controller.text,
                              image!,
                              _myActivitiesResult);
                        },
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
