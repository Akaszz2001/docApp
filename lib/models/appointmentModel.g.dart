// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointmentModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentAdapter extends TypeAdapter<Appointment> {
  @override
  final int typeId = 2;

  @override
  Appointment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appointment(
      id: fields[0] as int?,
      patientPhone: fields[1] as int,
      doctorPhone: fields[2] as int,
      dateTime: fields[3] as DateTime,
      patientName: fields[5] as String,
      doctorName: fields[6] as String,
      doctorHsptl: fields[8] as String,
      doctorDept: fields[7] as String,
      status: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Appointment obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.patientPhone)
      ..writeByte(2)
      ..write(obj.doctorPhone)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.patientName)
      ..writeByte(6)
      ..write(obj.doctorName)
      ..writeByte(7)
      ..write(obj.doctorDept)
      ..writeByte(8)
      ..write(obj.doctorHsptl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
