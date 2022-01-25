import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productive_families/presentation/styles/colors.dart';


ThemeData lightTheme = ThemeData(
scaffoldBackgroundColor: backGroundWhite,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: defaultYellow, statusBarIconBrightness: Brightness.dark),
  ),


);


