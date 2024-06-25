import 'package:doctor_appointment/screens/bottomNavigationBar.dart';
import 'package:doctor_appointment/screens/doctor/doctorsHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/Appointment.dart';
import '../../models/appointmentModel.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  List<Appointment> myAppointment = [];

  void initState() {
    super.initState();
    load();
  }

  void load() async {
    List<Appointment> data = [];
    data = await getAppointments();
    setState(() {
      myAppointment = data;
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
                "Appointment Requests",
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
                        Appointment ap = myAppointment[index];
                        return ListTile(
                          key: ValueKey(index),
                          tileColor: Colors.red,
                          title: Text(ap.patientName),
                          subtitle: Text(ap.patientPhone.toString()),

                          leading: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(Icons.person),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () async {
                              bool? ack = await acceptAppointment(ap.patientPhone);

    if (ack == true) {
        setState(() {
          ap.status = "Accepted"; // Update UI status after successful acceptance
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>BottomNavBar()),
        );
      }




                              // if (ap.status=="Pending") { // Check if status is empty
                              //   bool? ack = await acceptAppointment(ap.patientPhone);
                              //   if (ack == true) {
                              //     setState(() {
                              //       ap.status = "Accepted"; // Update UI status after successful acceptance
                              //     });
                              //     Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(builder: (context) => Doctors()),
                              //     );
                              //   } else {
                              //     return;
                              //
                              //   }
                              // }
                            },

                            child: ap.status == "Accepted"
                                ? Text("Aceepted")
                                : Text("Accept"),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                              // White text
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15), // Curved border
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: myAppointment.length,
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
