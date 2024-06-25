import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/admin/adminHome.dart';
import '../screens/admin/manageUsers.dart';
import '../screens/doctor/appointments.dart';
import '../screens/doctor/doctorsHome.dart';
import '../screens/patient/findDoctors.dart';
import '../screens/patient/patientHome.dart';
import '../screens/profilePage.dart';

List<Widget> getScreens(String userRole) {
  return [
    if (userRole == "Patient")
      const Patient()
    else if (userRole == "Doctor")
      const Doctors()
    else
      const Admin(),
    if (userRole == "Patient")
      const Finddoctors()
    else if (userRole == "Doctor")
      const Appointments()
    else
      const Manageusers(),
    const userProfile(),
  ];
}


List<BottomNavigationBarItem> getBottomNavBar(String userRole){
  if (userRole == "Patient") {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.find_in_page), label: 'Find Doctor'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  } else if (userRole == "Doctor") {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Appointments'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  } else {
    return [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: 'Manage'),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  }
}