import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
//Keys
  static String userLoggedInKey = 'loggedInKey';
  static String userNameKey = 'userNameKey';
  static String userEmailKey = 'userEmailKey';
  //saving data to sf
  static Future<bool> saveUserLOgedInStatus(
      {required bool isUserLoggedIn}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserName({required String userName}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUseremail({required String userEmail}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }
  //get data from sf

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future getUserEmail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future getUserName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}

//---------------------------------------------------- navigator push
nextPage(context, {page}) {
  return Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return page;
    },
  ));
}

//---------------------------------------------------- navigator push replace
nextPageReplace(context, {page}) {
  return Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) {
      return page;
    },
  ));
}
