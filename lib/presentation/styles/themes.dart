import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productive_families/presentation/styles/colors.dart';

ThemeData lightTheme = ThemeData(
    //textTheme: TextTheme(button: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
  primarySwatch: Colors.yellow,
    radioTheme: RadioThemeData(fillColor: MaterialStateProperty.all(darkBlue)),
    colorScheme: const ColorScheme.light(
      secondary: defaultYellow,
    ),
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
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        labelColor: defaultYellow,
        indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: defaultYellow))),
    scrollbarTheme: ScrollbarThemeData(
      crossAxisMargin: 4,
      interactive: true,
      showTrackOnHover: true,
      thickness: MaterialStateProperty.all(8),
      radius: const Radius.circular(16),
      thumbColor: MaterialStateProperty.all(defaultYellow),
    ));
