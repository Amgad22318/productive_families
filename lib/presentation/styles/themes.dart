import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productive_families/presentation/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: darkBlue,
    scaffoldBackgroundColor: backGroundWhite,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    ),
    tabBarTheme:  TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor:defaultYellow,
indicator: UnderlineTabIndicator(borderSide: BorderSide(color: defaultYellow))
    ));
