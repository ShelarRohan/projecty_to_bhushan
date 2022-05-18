import 'package:erp_project/Widgets/Notification_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifCard extends StatefulWidget {
  String title;
  String message;
  String created_on;
  String notice_file;

  NotifCard({
    Key? key,
    required this.title,
    required this.message,
    required this.created_on,
    required this.notice_file,
  });

  @override
  State<NotifCard> createState() =>
      _NotifCardState(title, message, created_on, notice_file);
}

class _NotifCardState extends State<NotifCard> {
  String title;
  String description;
  String created_on;
  String notice_file;

  _NotifCardState(
      this.title, this.description, this.created_on, this.notice_file);

  get scaffoldKey => null;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title + created_on),
        leading: SizedBox(
          width: 50,
          height: 50,
          child:
              Image.network("http://192.168.43.126:8000" + notice_file + "/"),
        ),
        subtitle: Text(description),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NotificationDetail(
                    title: title,
                    notice_file: notice_file,
                  )));
        },
      ),
    );
  }
}
