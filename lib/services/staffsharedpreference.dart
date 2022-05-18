import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? empid;
String? staffid;
String? staffdob;
String? staffname;
String? staffdepartment;

class StaffPrefService {
  Future createCache(String empid) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("empid", empid);
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    // print(_preferences.getString("kbtid"));
    empid = _preferences.getString("empid");
    print(empid);
    print("this is cache: -");
    return empid;
  }

  Future removeCache(String empid) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("empid");
  }
}

class StaffUserCardService {
  Future createCache(String staffid, String staffname, String staffdob,
      String staffdepartment) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    _preferences.setString("staffid", staffid);
    _preferences.setString("staffname", staffname);
    _preferences.setString("staffdob", staffdob);
    _preferences.setString("staffdepartment", staffdepartment);
    print("set alll usercard service ");
    print(staffid);
    print(staffdob);
    print(staffname);
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }

  Future readCache() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    staffid = _preferences.getString("staffid");
    staffname = _preferences.getString("staffname");
    staffdob = _preferences.getString("staffdob");
    staffdepartment = _preferences.getString("staffdepartment");
    print("this is cacheeeeeeeeeeeeeeeeeeeeeeee: -");
    print(staffid);
    return staffid;
  }

  Future removeCache(
    String staffid,
    String staffname,
    String staffdob,
    String staffdepartment,
  ) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove("staffid");
    _preferences.remove("staffname");
    _preferences.remove("staffdob");
    _preferences.remove("staffdepartment");
  }
}
