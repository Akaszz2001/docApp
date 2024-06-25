import 'dart:async';

import 'package:doctor_appointment/models/models.dart';
import 'package:doctor_appointment/screens/flashScreen.dart';
import 'package:doctor_appointment/screens/login.dart';
import 'package:doctor_appointment/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/appointmentModel.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(UsersAdapter().typeId)){
    Hive.registerAdapter(UsersAdapter());
  }
  if (!Hive.isAdapterRegistered(AppointmentAdapter().typeId)) {
    Hive.registerAdapter(AppointmentAdapter());
  }
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme:AppBarTheme(backgroundColor: Colors.white)
        ),
      home:Flashscreen(),
    );
  }
}
