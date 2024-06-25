
import 'package:doctor_appointment/screens/login.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/signup.dart';
import '../helpers/botomNavBarHelper.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isLoading = true;
  String? userRole;

  void initState() {
    super.initState();
    loadUserCred();
  }

  void loadUserCred() async {
    bool userSts = false;
    int? userNum;
    final prefs = await SharedPreferences.getInstance();

    userSts = prefs.getBool('userSts') ?? false;
    userNum = prefs.getInt('number');
    print("bottom$userNum");

    if (userSts == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
    } else {
      userRole = await getUserRole(userNum!);
      setState(() {
        isLoading = false;
      });
    }
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final screens = getScreens(userRole!);
    final bottomNavBar=getBottomNavBar(userRole!);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Color(0xff3e3e3e),
        onTap: (currentIndex) {
          setState(() {
            index = currentIndex;
          });
        },
        items:bottomNavBar
      ),
      body: screens[index],
    );
  }
}
