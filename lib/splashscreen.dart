// import 'dart:html';

import 'dart:async';

import 'package:erp_project/services/staffsharedpreference.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';
import 'services/studentsharedpreference.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

// String? mtoken;

class _SplashState extends State<Splash> {
  final StudentPrefService _studprefService = StudentPrefService();
  final StaffPrefService _staffprefService = StaffPrefService();
  final StudentUserCardService _studuserService = StudentUserCardService();
  final StaffUserCardService _staffuserService = StaffUserCardService();
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  final StudentToken _studentToken = StudentToken();

  @override
  void initState() {
    getToken();
    // mtoken = FirebaseMessaging.instance.getToken();

    requestPermission();

    loadFCM();

    listenFCM();

    // _prefService.readCache();
    // print("kbtug before");
    // print(kbtug);
    // print("kbtug after");

    _studprefService.readCache().then((value) {
      print("In Student Loop");
      print(value.toString());
      print("In Student Loop");
      if (value != null) {
        _studuserService.readCache().then((value) {
          if (value != null) {
            print("Inner IF Loop");

            return Timer(Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(StudentHomeRoute));
          } else {
            print("Inner Else Loop");

            return Timer(
                Duration(seconds: 2),
                () => Navigator.of(context)
                    .pushNamed(StudentOnboardScreenRoute1));
          }
        });
      } else {
        _staffprefService.readCache().then((value) {
          print("In Staff Loop");
          print(value.toString());
          print("In Staff Loop");
          if (value != null) {
            _staffprefService.readCache().then((value) {
              if (value != null) {
                print("Inner IF Loop");

                return Timer(Duration(seconds: 2),
                    () => Navigator.of(context).pushNamed(StaffHomeRoute));
              } else {
                print("Inner Else Loop");

                return Timer(
                    Duration(seconds: 2),
                    () => Navigator.of(context)
                        .pushNamed(StaffOnboardScreenRoute1));
              }
            });
          } else {
            print("Outer Else Loop");
            return Timer(Duration(seconds: 2),
                () => Navigator.of(context).pushNamed(WelcomeRoute));
          }
        });
      }

      //  else {
      //   print("Outer Else Loop");
      //   return Timer(Duration(seconds: 2),
      //       () => Navigator.of(context).pushNamed(WelcomeRoute));
      // }
    });

    super.initState();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
      });

      print(
          "############################################################################# This is the token #############################################################");
      print(mtoken);
      print("Mtoken inside init function");
      print(mtoken);
      print("Mtoken inside init function");

      _studentToken.createCache(mtoken!);

      // saveToken(token!);
    });
  } // final UserCardService _userSe

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void listenFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }

  void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );

      var flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Image.asset(
                'images/logo.png',
                width: 400,
                height: 250,
              ),
            ),
            const Text(
              "MVP's",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "K.B.T. COE",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueAccent[700],
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Udoji Maratha Boarding Campus, Near Pumping Station, Gangapur Road, Nashik",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'images/naac.png',
                width: 400,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );

    // FutureBuilder(
    //   // Replace the 3 second delay with your initialization code:
    //   future: Future.delayed(const Duration(seconds: 5)),
    //   builder: (context, AsyncSnapshot snapshot) {
    //     print("inside future");
    //     // Show splash screen while waiting for app resources to load:
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return MaterialApp(debugShowCheckedModeBanner: false, home: Splash());
    //     } else {
    //       print("OBtainid");

    //       _prefService.readCache("kbtid").then((value) {
    //       print(value.toString());

    //       if (value != null) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: Login(),
    //           // home: Login(),
    //         );
    //       } else {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,
    //           home: MyHome(),
    //           // home: Login(),
    //         );
    //       }
    //     }
    //   },
    // );
  }
}
