import 'dart:convert';
import 'dart:io';
import 'package:erp_project/api/menteemodal/mentee.dart';
import 'package:erp_project/api/semmodal/sem.dart';
import 'package:erp_project/api/stud_notification/stud_notification.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

List<Sem> sem = [];
var semresult;

List<MenteeModal> ment = [];
var allmentee;

List<SNotificationModal> prev_notifications = [];
var allnotifications;

class Authentication_Token with ChangeNotifier {
  // Map<String, dynamic> details = {};
  // late String empid;
  // late int password;

  // var _list = [];
  // Authentication_Token() {
  //   this.loginfetch();
  // }

  // List get student_data {
  //   return [..._list];
  // }
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  Future Authentication_TokenFetch(token) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.126:8000/user/notification_token/send/'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Token 05ca77736659541562b0986768b48a15423251e3"
        },
        body: json.encode(token));

    print(response);
    print("In Authentication TokenFetch ");
    print("In Authentication TokenFetch ");
    print("In Authentication TokenFetch ");
    // return response;
    //   final response = await http.post('http://192.168.43.126:8000/apis/v1/',
    //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
    if (response.statusCode == 201) {
      // todo.id = json.decode(response.body)['id'];
      // _todos.add(todo);
      print("Authentinsjnjdnjdns");
      notifyListeners();
      return response;
    }
  }
}

class Semwise_Result_Api with ChangeNotifier {
  late String id;

  Map<String, List> semdetails = {};

  // late String name;
  // late String dob;
  // late String academic_year;
  // late String sex;
  // late String per_phone_no;
  // late String email;R
  // late String admission_date;
  String kbtugg = "";
  var _rlist = [];
  Semwise_Result_Api(kbtug) {
    print("Semwise_Result_Api@@@s");
    print(kbtug);
    print("Semwise_Result_Api@@@s");

    kbtugg = kbtug;
    this.fetchSemwiseResult();
  }

  List get cgpa_data {
    return [..._rlist];
  }

  get ItemCategoryModel => null;
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  fetchSemwiseResult() async {
    print("Semwise_Result_ApiKbtug in api ");
    print(kbtugg);
    final r = await http.get(
        Uri.http("192.168.43.126:8000", "/user/student/sgpa/" + kbtugg + "/"));
    // final url = 'http://192.168.43.126:8000/apis/v1/?format=json';
    // final response = await http.get(r);
    print(" r = ");
    print(r);
    print("r.body =");
    print(r.body);
    print("r type= ");
    print(r.runtimeType);
    print("r.body type= ");
    print(r.body.runtimeType);
    print("a");
    // var a = r.body;
    // print(a.runtimeType);

    semresult = r.body;
    print("app runtype");
    if (r.statusCode == 200) {
      List<dynamic> data = jsonDecode(r.body);
      sem = data.map((data) => Sem.fromJson(data)).toList();
      //   print(sems[0].EM0REF);
      //   _rlist = semdetails.values.toList();
      //   print("rlist****************************************");

      //   print(_rlist);
      //   print("rlistenf****************************************");

      //   notifyListeners();
      // }
      // details = json.decode(r.body);
      // _list = details.values.toList();
    }
  }
}

class Stud_Notification_Api with ChangeNotifier {
  late String id;

  Map<String, List> prev_noti = {};

  String stud_idd = "";
  var _nlist = [];
  Stud_Notification_Api(stud_id) {
    print("Mentter_Api@@@s");
    print(stud_id);
    print("Menttee_Api@@@s");

    stud_idd = stud_id;
    this.fetchNotiList();
  }

  List get noti_history {
    return [..._nlist];
  }

  fetchNotiList() async {
    print("Notification historyyyyyyyyyyyyyyyyyyyyyy");
    print(stud_idd);
    // final r = await http.get(
    //     Uri.http("192.168.43.87:8000", "/user/student/sgpa/" + kbtugg + "/"));

    final m = await http.get(
      Uri.http("192.168.43.126:8000",
          "/user/student/notification/" + stud_idd + "/"),
      headers: {
        "Authorization": "Token 05ca77736659541562b0986768b48a15423251e3",
      },
    );

    // final url = 'http://192.168.43.126:8000/apis/v1/?format=json';
    // final response = await http.get(r);
    print(" lalalal = ");
    print(m);
    print("mlaalal.body =");
    print(m.body);
    print("alalal type= ");
    print(m.runtimeType);
    print("m.body type= ");
    print(m.body.runtimeType);
    print("aaaaaaaa");

    allnotifications = m.body;
    print("gandnn app runtype");
    if (m.statusCode == 200) {
      List<dynamic> data = jsonDecode(m.body);
      prev_notifications =
          data.map((data) => SNotificationModal.fromJson(data)).toList();
      print("noti list****************************************");
      print("notification.title");
      print(prev_notifications[0].title);

      notifyListeners();
    }
  }
}

class Staff_Mentee_Api with ChangeNotifier {
  late String id;

  Map<String, List> mentee = {};

  String emp_idd = "";
  var _mlist = [];
  Staff_Mentee_Api(emp_id) {
    print("Mentter_Api@@@s");
    print(emp_idd);
    print("Menttee_Api@@@s");

    emp_idd = emp_id;
    this.fetchMenteeList();
  }

  List get mentee_data {
    return [..._mlist];
  }

  fetchMenteeList() async {
    print("Mentee  in api ggggg");
    print(emp_idd);
    // final r = await http.get(
    //     Uri.http("192.168.43.87:8000", "/user/student/sgpa/" + kbtugg + "/"));

    final m = await http.get(
      Uri.http("192.168.43.126:8000", "/user/emp/mentee/" + emp_idd + "/"),
    );

    // final url = 'http://192.168.43.126:8000/apis/v1/?format=json';
    // final response = await http.get(r);
    print(" m = ");
    print(m);
    print("m.body =");
    print(m.body);
    print("m type= ");
    print(m.runtimeType);
    print("m.body type= ");
    print(m.body.runtimeType);
    print("a");

    allmentee = m.body;
    print("app runtype");
    if (m.statusCode == 200) {
      List<dynamic> data = jsonDecode(m.body);
      ment = data.map((data) => MenteeModal.fromJson(data)).toList();
      print("mlist****************************************");
      print("Ment.Student_ID");
      print(ment[0].STUDENT_ID);

      notifyListeners();
    }
  }
}

class Student_Profile_Api with ChangeNotifier {
  Map<String, dynamic> details = {};
  late String id;
  late String name;
  late String dob;
  late String academic_year;
  late String sex;
  late String per_phone_no;
  late String email;
  late String admission_date;
  String kbtugg = "";
  var _list = [];
  Student_Profile_Api(kbtug) {
    print("@@@s");
    print(kbtug);
    print("@@@s");

    kbtugg = kbtug;
    this.fetchProfile();
  }

  List get student_data {
    return [..._list];
  }
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  fetchProfile() async {
    print("Kbtug in api ");
    print(kbtugg);
    final r = await http
        .get(Uri.http("192.168.43.126:8000", "/user/student/" + kbtugg + "/"));
    // final url = 'http://192.168.43.126:8000/apis/v1/?format=json';
    // final response = await http.get(r);

    if (r.statusCode == 200) {
      details = json.decode(r.body);
      // print("****************************************");
      print(details);
      // print("****************************************");

      _list = details.values.toList();

      // print("****************************************");

      print(_list);
      // print("****************************************");

      notifyListeners();
    }
    // details = json.decode(r.body);
    // _list = details.values.toList();
  }

  // void addTodo(Todo todo) async {
  //   final response = await http.post('http://192.168.43.126:8000/apis/v1/',
  //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
  //   if (response.statusCode == 201) {
  //     todo.id = json.decode(response.body)['id'];
  //     _todos.add(todo);
  //     notifyListeners();
  //   }
  // }

  // void deleteTodo(Todo todo) async {
  //   final response =
  //       await http.delete('http://192.168.43.126:8000/apis/v1/${todo.id}/');
  //   if (response.statusCode == 204) {
  //     _todos.remove(todo);
  //     notifyListeners();
  //   }
  // }

}

class Staff_Profile_Api with ChangeNotifier {
  Map<String, dynamic> details = {};
  late String emp_id;
  late String empname;
  late String fathername;
  late String dob;
  late String sex;
  late String department;
  late String perm_add;
  late String mobileno;
  late String email_id;
  late String shortcode;
  String emp_idd = "";
  var _list = [];
  Staff_Profile_Api(empid) {
    print("@@@s");
    print(empid);
    print("@@@s");

    emp_idd = empid;
    this.fetchProfile();
  }

  List get staff_data {
    return [..._list];
  }
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  fetchProfile() async {
    print("Kbtug in api ");
    print(emp_idd);
    final r = await http
        .get(Uri.http("192.168.43.126:8000", "/user/emp/" + emp_idd + "/"));
    // final url = 'http://192.168.43.126:8000/apis/v1/?format=json';
    // final response = await http.get(r);

    if (r.statusCode == 200) {
      details = json.decode(r.body);
      // print("****************************************");
      print(details);
      // print("****************************************");

      _list = details.values.toList();

      // print("****************************************");

      print(_list);
      // print("****************************************");

      notifyListeners();
    }
    // details = json.decode(r.body);
    // _list = details.values.toList();
  }

  // void addTodo(Todo todo) async {
  //   final response = await http.post('http://192.168.43.126:8000/apis/v1/',
  //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
  //   if (response.statusCode == 201) {
  //     todo.id = json.decode(response.body)['id'];
  //     _todos.add(todo);
  //     notifyListeners();
  //   }
  // }

  // void deleteTodo(Todo todo) async {
  //   final response =
  //       await http.delete('http://192.168.43.126:8000/apis/v1/${todo.id}/');
  //   if (response.statusCode == 204) {
  //     _todos.remove(todo);
  //     notifyListeners();
  //   }
  // }

}

class Login_Api with ChangeNotifier {
  Map<String, dynamic> details = {};
  late String kbtid;
  late int password;

  // var _list = [];
  // Login_Api() {
  //   this.loginfetch();
  // }

  // List get student_data {
  //   return [..._list];
  // }
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  Future loginFetch(todo) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.126:8000/studentlogin/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo));

    print(response);
    // return response;
    //   final response = await http.post('http://192.168.43.126:8000/apis/v1/',
    //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
    if (response.statusCode == 201) {
      // todo.id = json.decode(response.body)['id'];
      // _todos.add(todo);
      notifyListeners();
      return response;
    }
  }
}

class Staff_Login_Api with ChangeNotifier {
  Map<String, dynamic> details = {};
  late String empid;
  late int password;

  // var _list = [];
  // Login_Api() {
  //   this.loginfetch();
  // }

  // List get student_data {
  //   return [..._list];
  // }
  // List<Todo> _todos = [];

  // List<Todo> get todos {
  //   return [..._todos];
  // }

  Future loginFetch(todo) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.126:8000/user/stafflogin/'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(todo));

    print(response);
    // return response;
    //   final response = await http.post('http://192.168.43.126:8000/apis/v1/',
    //       headers: {"Content-Type": "application/json"}, body: json.encode(todo));
    if (response.statusCode == 201) {
      // todo.id = json.decode(response.body)['id'];
      // _todos.add(todo);
      notifyListeners();
      return response;
    }
  }
}
