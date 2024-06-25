import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg,Color bgClr, Color textClr, double textSize){
  Fluttertoast.showToast(msg: msg,
    toastLength: Toast.LENGTH_LONG,
    timeInSecForIosWeb: 3,
    backgroundColor: bgClr,
    textColor: textClr,
    fontSize: textSize,
  );
}