import 'package:doctor_appointment/database/signup.dart';
import 'package:doctor_appointment/helpers/sessionHelper.dart';
import 'package:doctor_appointment/helpers/toastHelper.dart';
import 'package:doctor_appointment/screens/bottomNavigationBar.dart';
import 'package:doctor_appointment/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}
final TextEditingController unum=TextEditingController();
final TextEditingController upwd=TextEditingController();
String? userSts;
class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: unum,
              decoration: InputDecoration(labelText: 'number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },

            ),
            TextFormField(
              controller: upwd,
              decoration: InputDecoration(labelText: 'Admin Key'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }

                return null;
              },
            ),

            ElevatedButton(onPressed: ()async{
              int? num=int.tryParse(unum.text);
           if(num!=null){
          userSts=await getUsers(num,upwd.text);
          if(userSts!=null){
              await  sessinStore(num,userSts!);
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>BottomNavBar()));

          }
          print("hello$userSts");
           }else{
           showToast("enter registered phone number and paswword",Colors.red,Colors.white, 28);
           }
            }, child:Text("Login")),
            SizedBox(height:20),
            InkWell(
              child: Text("New to here please signup"),
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Signup()));
              },
            )
          ],
        ),
      ),
    );
  }
}
