
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:productive_families/presentation/styles/colors.dart';

import 'enums.dart';

Color getColor(Set<MaterialState> states,Color color) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return defaultYellow;
  }
  return color;
}


void printResponse(String text) {
  print('\x1B[33m$text\x1B[0m');
}
void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

void navigateToAndFinish(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (Route<dynamic> route) {
      return false;
    },
  );
}



void showToastMsg({required String msg, required ToastStates toastState}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state: toastState),
      textColor: Colors.black,
      fontSize: 16.0);
}


Color chooseToastColor({required ToastStates state}) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

