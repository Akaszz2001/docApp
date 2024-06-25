
import 'package:hive/hive.dart';
part 'models.g.dart';
@HiveType(typeId: 1)


class Users{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  int? num;
  @HiveField(3)
  String? pwd;
  @HiveField(4)
  String? role;
  @HiveField(5)
  String? adminKey;
  @HiveField(6)
  String? doctorDept;
  @HiveField(7)
  String? doctorHsptl;

  Users({this.id,required this.name,required this.num,required this.pwd,required this.role,this.adminKey,this.doctorDept,this.doctorHsptl});
}

