
  import 'package:hive/hive.dart';
  part 'appointmentModel.g.dart';

@HiveType(typeId: 2)
class Appointment {
  @HiveField(0)
  int? id;
  @HiveField(1)
  int patientPhone;
  @HiveField(2)
  int doctorPhone;
  @HiveField(3)
  DateTime dateTime;
  @HiveField(4)
  String status="Pending"; // e.g., "pending", "confirmed", "rejected"
  @HiveField(5)
  String patientName;
  @HiveField(6)
  String doctorName;
  @HiveField(7)
  String doctorDept;
  @HiveField(8)
  String doctorHsptl;

  Appointment({
    this.id,
    required this.patientPhone,
    required this.doctorPhone,
    required this.dateTime,
    required this.patientName,
    required this.doctorName,
    required this.doctorHsptl,
    required this.doctorDept,
    this.status = "pending",
  });
}