import 'package:doctor_appointment/database/signup.dart';
import 'package:doctor_appointment/helpers/doctorMoreDetails.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class Finddoctors extends StatefulWidget {
  const Finddoctors({super.key});

  @override
  State<Finddoctors> createState() => _FinddoctorsState();
}

class _FinddoctorsState extends State<Finddoctors> {
  List<Users> doctors = [];

  void initState() {
    super.initState();
    getDoctors();
  }

  void getDoctors() async {
    List<Users> data = [];
    data = await getDoctorsData();
    setState(() {
      doctors = data;
      print("hellofinddoctors");
      print(doctors[0].name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "Available Doctors",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Search Bar

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    child: ListView.separated(
                      padding: EdgeInsets.all(8),
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        Users doctor = doctors[index];
                        return ListTile(
                          key: ValueKey(index),
                          tileColor: Colors.red,
                          title: Text(doctor.name!),
                          subtitle: Text(doctor.doctorDept!),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.person),
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              Moredetails(context,
                                  doctorName: doctor.name,
                                  docotrPhone: doctor.num,
                                  dept: doctor.doctorDept,
                                  hsptl: doctor.doctorHsptl);
                            },
                            child: Text("more details"),
                          ),
                        );
                      },
                      itemCount: doctors.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
