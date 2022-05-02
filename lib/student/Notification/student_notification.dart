import 'package:erp_project/Widgets/NotificationCard.dart';
import 'package:erp_project/api/stud_notification/stud_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifPage extends StatefulWidget {
  List<SNotificationModal> notifications;
  NotifPage({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  @override
  State<NotifPage> createState() => _NotifPageState(notifications);
}

class _NotifPageState extends State<NotifPage> {
  List<SNotificationModal> notifications;
  _NotifPageState(this.notifications);

  get scaffoldKey => null;
  // String name = "";
  // bool changeButton = false;

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [],
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView.builder(
          itemCount: notifications.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var notData = notifications[index];
            print("notifications");
            print("notifications");
            print("notifications");
            print("notifications");
            print(notData.title);
            print(notData.description);
            print(notData.time);
            print(notData.date);
            return NotifCard(
                title: notData.title,
                description: notData.description,
                date: notData.date,
                time: notData.time);
          },
          // children: [
          //   FittedBox(
          //     child: Card(
          //       child: Row(
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           Padding(
          //             padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 2),
          //             child: Material(
          //               color: Colors.transparent,
          //               elevation: 0,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(20),
          //               ),
          //               child: Container(
          //                 width: MediaQuery.of(context).size.width,
          //                 height: 155,
          //                 decoration: BoxDecoration(
          //                   color: Color(0xFFFFFFFF),
          //                   borderRadius: BorderRadius.circular(20),
          //                   shape: BoxShape.rectangle,
          //                   border: Border.all(
          //                     color: Colors.black,
          //                     width: 2.6,
          //                   ),
          //                 ),
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.max,
          //                   children: [
          //                     Padding(
          //                       padding:
          //                           EdgeInsetsDirectional.fromSTEB(15, 8, 0, 0),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           Text(
          //                             'Admin',
          //                             style: TextStyle(
          //                               fontFamily: 'Poppins',
          //                               fontWeight: FontWeight.w900,
          //                               fontSize: 20,
          //                               color: Colors.blue[500],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           EdgeInsetsDirectional.fromSTEB(16, 2, 0, 0),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           Text(
          //                             'Date: 21st August 2022',
          //                             style: TextStyle(
          //                               fontFamily: 'Poppins',
          //                               color: Colors.black,
          //                               fontSize: 14,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           EdgeInsetsDirectional.fromSTEB(10, 8, 8, 0),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           Padding(
          //                             padding: EdgeInsetsDirectional.fromSTEB(
          //                                 8, 0, 0, 0),
          //                             child: Text(
          //                               'The University stands for humanism and tolerance, for reason, \nfor adventure of ideas and for the search\nof .....',
          //                               style: TextStyle(
          //                                 fontFamily: 'Poppins',
          //                                 color: Colors.grey[700],
          //                                 fontSize: 12,
          //                               ),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Padding(
          //                       padding:
          //                           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          //                       child: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           Padding(
          //                             padding: EdgeInsetsDirectional.fromSTEB(
          //                                 280, 0, 0, 0),
          //                             child: TextButton(
          //                               onPressed: () {},
          //                               child: Text("Read more"),
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
        ),
      ),
    );
  }
}
