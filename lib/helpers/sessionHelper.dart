import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/signup.dart';
import '../screens/login.dart';

//function for session storing
Future<void>sessinStore(int num,String name)async{

  final prefs = await SharedPreferences.getInstance();
    prefs.setInt('number',num);
    prefs.setBool("userSts",true);
    prefs.setString('userName',name);
      
}


//function for sessionChecking
Future<int?> loadUserCred(BuildContext context) async {
  String? userRole;
  bool? userSts;
  int? userNum;
  final prefs = await SharedPreferences.getInstance();

  userSts = prefs.getBool('userSts') ?? false;
  userNum = prefs.getInt('number');
  print("sessionHelper$userNum");
  if (userSts == false) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Loginpage()));
  }
  return userNum;
}


//Function for logout
void logout(BuildContext context)async{
  final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginpage()));
}