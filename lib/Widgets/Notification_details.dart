import 'dart:collection';

import 'package:flutter/material.dart';

class NotificationDetail extends StatelessWidget {
  String? title;
  String? notice_file;

  NotificationDetail({required this.title, required this.notice_file});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body:

          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 700,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.fill,
          //       image: NetworkImage(
          //           "http://192.168.43.126:8000" + notice_file! + "/"),
          //     ),
          //   ),
          // )
          //     SizedBox(
          //   height: 10,
          // ),

          Image.network(
        "http://192.168.43.126:8000" + notice_file! + "/",
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),

      // Text(
      //   description,
      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      // )
    );
  }
}
