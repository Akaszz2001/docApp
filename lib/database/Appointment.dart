import 'package:hive/hive.dart';

import '../models/appointmentModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Appointment> appointments=[];


Future<bool?>sendAppointment(Appointment appoi)async{
  bool? sts;
  final db = await Hive.openBox<Appointment>("appointmentData");
   int ack=   await db.add(appoi);
    appoi.id=ack;
    if(ack!=null){
      sts=true;
    }
    return sts;
}



// function for getting a dcotor individual appointments
List<Appointment> indvidualAppoi = [];

Future<List<Appointment>> getAppointments()async{
  final prefs = await SharedPreferences.getInstance();

  int? dcotorNum = prefs.getInt('number');

  final db = await Hive.openBox<Appointment>("appointmentData");
  appointments=db.values.toList();
indvidualAppoi=appointments.where((appoin)=>appoin.doctorPhone==dcotorNum).toList();

  return indvidualAppoi;
}


// function for getting a patient individual bookings

List<Appointment> bookings = [];

Future<List<Appointment>>getBookings()async{
  final prefs = await SharedPreferences.getInstance();

  int? patientnum= prefs.getInt('number');

  final db = await Hive.openBox<Appointment>("appointmentData");
  appointments=db.values.toList();
  indvidualAppoi=appointments.where((appoin)=>appoin.patientPhone==patientnum).toList();

  return indvidualAppoi;
}


//function for accepting appointment

Future<bool?>acceptAppointment(int patientPhone)async{
  print("its her");
  final db = await Hive.openBox<Appointment>("appointmentData");
  appointments=db.values.toList();
  bool? ack=false;
  for(var appoi in appointments){
    if(appoi.patientPhone==patientPhone){
      appoi.status="Accepted";
    await db.put(appoi.id,appoi);

      ack=true;
      break;
    }
  }
  return ack;
}