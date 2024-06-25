import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Manageusers extends StatefulWidget {
  const Manageusers({super.key});

  @override
  State<Manageusers> createState() => _ManageusersState();
}

class _ManageusersState extends State<Manageusers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("uusers list for admin"),
      ),
    );
  }
}
