import 'package:doctor_appointment/database/signup.dart';
import 'package:doctor_appointment/screens/patient/bookings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../helpers/sessionHelper.dart';
import '../models/models.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  Users? usr;
  int? num;

  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    int? loadnum = await loadUserCred(context);
    print("profielPage$num");
    setState(() {
      num = loadnum;
    });
    usr = await getUserAllData(num!);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text(
          "Farm Friend",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: ()async{
              logout(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
              CircleAvatar(
              radius: 50,
              backgroundImage:
              AssetImage("assets/images/Natural-farming-.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(usr?.name??"user",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black12,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.black,
                    ),
                    Text(usr?.num.toString()??"number"),

                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.work,
                      size: 30,
                      color: Colors.black,
                    ),
                    Text(usr?.role??"role"),

                  ],
                ),

                SizedBox(height: 20),
              usr?.role=="Doctor"?
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.local_hospital_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(usr?.doctorHsptl??"hospital"),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.business_center,
                        size: 30,
                        color: Colors.black,
                      ),
                      Text(usr?.doctorDept??"department"),

                    ],
                  )
                ],
              ):Container(),
                usr?.role=="Patient" ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.history,
                      size: 30,
                      color: Colors.black,
                    ),
                    InkWell(
                      child: Text("My bookings"),
                      onTap: (){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bookings()));
                      },
                    )

                  ],
                ):
                    Container(),

              ],
            ),
          ),

          ],
        ),
      ),
    )),
    );
  }
}
