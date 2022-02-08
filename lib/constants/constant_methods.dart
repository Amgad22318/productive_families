
import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

Color getColor(Set<MaterialState> states,Color color) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
  };
  if (states.any(interactiveStates.contains)) {
    return defaultYellow;
  }
  return color;
}


void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
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

