import 'package:doctor_appointment/screens/bottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../database/Appointment.dart';
import '../../models/appointmentModel.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  List<Appointment> bookings = [];

  void initState() {
    super.initState();
    load();
  }

  void load() async {
    List<Appointment> data = [];
    data = await getBookings();
    setState(() {
      bookings = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (builder) => BottomNavBar()));
            }
          },
          iconSize: 40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                "My bookings",
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
                        Appointment booking = bookings[index];
                        return ListTile(
                            key: ValueKey(index),
                            tileColor: Colors.black12,
                            title: Text(booking.doctorName),
                            subtitle: Text(booking.doctorDept),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: Icon(Icons.person),
                            ),
                            trailing: booking.status =="Accepted"
                                ? Text(
                                    "Accepted",
                                    style: TextStyle(color: Colors.green),
                                  )
                                : Text(
                                    "not aceepted",
                                    style: TextStyle(color: Colors.red),
                                  ));

                      },
                      itemCount: bookings.length,
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
