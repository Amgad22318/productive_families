
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


