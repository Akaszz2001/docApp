import 'package:doctor_appointment/models/models.dart';
import 'package:doctor_appointment/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../helpers/toastHelper.dart';

List<Users> users = [];

// for signup
Future<bool> addPatient(Users usrs) async {
  bool signupSts = false;

  final db = await Hive.openBox<Users>("usersDb");

  users = db.values.toList();
  bool numberExits = false;

  for (var usr in users) {
    if (usr.num == usrs.num) {
      numberExits = true;
      break;
    }
  }
  if (numberExits == true) {
    showToast("Phone number already exists", Colors.red, Colors.white, 25.3);
  } else {
    final uniqueKey = await db.add(usrs);
    if (uniqueKey != null) {
      signupSts = true;
      usrs.id = uniqueKey;
    }
  }

  return signupSts;
}

// for login
Future<String?> getUsers(int num, String pwd) async {
  final db = await Hive.openBox<Users>("usersDb");
  users = db.values.toList();
  String? userName;
  bool numberFound = false;

  for (var user in users) {
    if (user.num == num) {
      numberFound = true;
      if (user.pwd == pwd) {
        userName=user.name;
        break;
      } else {
        showToast("Entered wrong password", Colors.red, Colors.white, 25.3);
      }
      break;
    }
  }

  if (!numberFound) {
    showToast(
        "Please check entered phone number", Colors.red, Colors.white, 25.3);
  }

  return userName;
}

Future<String?>getUserRole(int userNumber)async{
  final db = await Hive.openBox<Users>("usersDb");
  users = db.values.toList();
  String? role;
  for(var userData in users){
    if(userData.num==userNumber){
      print(userData.role);
      role=userData.role;
      break;
    }
  }
  return role;
}
// function for all users
Future<Users>getUserAllData(int num)async{
  Users? userData;
  final db = await Hive.openBox<Users>("usersDb");
  users = db.values.toList();
  for(var usr in users){
    if(usr.num==num){
     userData=usr;
      break;
    }
  }
  return userData!;
}


//function for doctors data
List<Users> doctorsList=[];
Future<List<Users>>getDoctorsData()async{

  final db = await Hive.openBox<Users>("usersDb");
  users = db.values.toList();
  doctorsList=users.where((user)=>user.role=="Doctor").toList();

  return doctorsList;
}