import 'package:doctor_appointment/database/Appointment.dart';
import 'package:doctor_appointment/helpers/toastHelper.dart';
import 'package:doctor_appointment/models/appointmentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> Moredetails(BuildContext context,
    {String? doctorName, int? docotrPhone, String? dept, String? hsptl}) async {
  //for getting current user data
  final prefs = await SharedPreferences.getInstance();
  String? patientName = prefs.getString("userName");
  int? patientPhone = prefs.getInt("number");

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (ctxt) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: (doctorName))),
                TextField(
                    decoration: InputDecoration(hintText: (docotrPhone.toString()))),
                TextField(decoration: InputDecoration(hintText: (dept))),
                TextField(decoration: InputDecoration(hintText: (hsptl))),
                SizedBox(height: 25),
                TextButton(
                    onPressed: () async {
                      Appointment appoi = Appointment(
                          patientPhone: patientPhone!,
                          doctorPhone: docotrPhone!,
                          dateTime: DateTime.now(),
                          patientName: patientName!,
                          doctorName: doctorName!,
                          doctorHsptl: hsptl!,
                          doctorDept: dept!);
                      bool? ack = await sendAppointment(appoi);
                      if (ack == true) {
                        Navigator.pop(context);
                        showToast("Appointment booked successfully",
                            Colors.green, Colors.white, 23.6);
                      } else {
                        showToast("Appointment not  booked ", Colors.red,
                            Colors.white, 23.6);
                      }
                    },
                    child: Text('Book Appointment'),
                    style: TextButton.styleFrom(
                      minimumSize: Size(75, 50),
                      backgroundColor: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ))
              ],
            ),
          ),
        );
      });
}
