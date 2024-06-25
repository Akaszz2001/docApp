
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottomNavigationBar.dart';
import 'login.dart';
class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  State<Flashscreen> createState() => _FlashscreenState();
}

class _FlashscreenState extends State<Flashscreen> {
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    bool? usersts = prefs.getBool('userSts');
    if(usersts==true){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNavBar()));
    }else{
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginpage()));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/animations/Animation_1718905017533.json',width: 300,
      height: 500),
    );
  }
}
