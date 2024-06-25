// Ensure this is correctly imported
import 'package:doctor_appointment/models/models.dart';
import 'package:doctor_appointment/screens/login.dart';
import 'package:doctor_appointment/screens/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../database/signup.dart';
import '../helpers/toastHelper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController uname = TextEditingController();
TextEditingController unum = TextEditingController();
TextEditingController upwd = TextEditingController();
TextEditingController adminKey = TextEditingController();
TextEditingController dDept = TextEditingController();
TextEditingController dHsptl = TextEditingController();

class _SignupState extends State<Signup> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              //Field for username
              TextFormField(
                controller: uname,
                decoration: InputDecoration(labelText: 'Name',fillColor: Colors.white),
              ),
              //Field for username
              TextFormField(
                controller: unum,
                decoration: InputDecoration(labelText: 'Number'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: upwd,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              DropdownButton<String>(
                hint: Text("Select a role"),
                items: const [
                  DropdownMenuItem<String>(
                    child: Text("Patient"),
                    value: "Patient",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("Doctor"),
                    value: "Doctor",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("Admin"),
                    value: "Admin",
                  )
                ],
                value: selectedRole,
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
              ),
              selectedRole == 'Admin'
                  ? TextFormField(
                      controller: adminKey,
                      decoration: InputDecoration(labelText: 'Admin Key'),
                    )
                  : Container(),
              selectedRole=="Doctor"
                      ? Column(
                children: [
                  TextFormField(
                    controller: dDept,
                    decoration: InputDecoration(labelText: 'Your department'),
                  ),TextFormField(
                    controller: dHsptl,
                    decoration: InputDecoration(labelText: 'Hospital name'),
                  ),
                ],
              )
                  : Container(),
              ElevatedButton(
                onPressed: () async{
                  if (selectedRole == "Admin" && adminKey.text != 'admin123') {
                    showToast("Entered wrong admin key", Colors.red, Colors.white,
                        20.1);
                  } else {
                    var user = Users(
                      name: uname.text,
                      num: int.tryParse(unum.text),
                      pwd: upwd.text,
                      role: selectedRole,
                      adminKey: selectedRole == 'Admin' ? adminKey.text : null,
                      doctorDept: selectedRole=='Doctor' ?dDept.text    : null,
                      doctorHsptl: selectedRole=='Doctor' ?dHsptl.text  : null,
                    );
                   bool signSts= await addPatient(user);
                   if(signSts==true){
                     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Loginpage()));
                   }else{
                     showToast("Erorr oocured",Colors.red,Colors.white,23.2);
                   }
                  }
                },
                child: Text("Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
