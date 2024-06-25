// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 1;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as int?,
      name: fields[1] as String?,
      num: fields[2] as int?,
      pwd: fields[3] as String?,
      role: fields[4] as String?,
      adminKey: fields[5] as String?,
      doctorDept: fields[6] as String?,
      doctorHsptl: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.num)
      ..writeByte(3)
      ..write(obj.pwd)
      ..writeByte(4)
      ..write(obj.role)
      ..writeByte(5)
      ..write(obj.adminKey)
      ..writeByte(6)
      ..write(obj.doctorDept)
      ..writeByte(7)
      ..write(obj.doctorHsptl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
