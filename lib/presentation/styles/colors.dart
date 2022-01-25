import 'package:flutter/material.dart';

const defaultYellow = Color(0xFFFFE97B);
const backGroundWhite = Color(0xffffffff);
const darkBlue = Color(0xff0F1F41);
const aboutGrey = Color(0xffEEEEEE);
const formFieldBackGround = Color(0xff2A3B5E);






class Palette {
  static const MaterialColor lightMainColor = MaterialColor(
    0xFF56639C, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE0E7F3 ),//10%
      100: Color(0xFFD9E2F8),//20%
      200: Color(0xFF7B89DC),//30%
      300: Color(0xFF56639C),//40%
      400: Color(0xff4d598c),//50%
      500: Color(0xff454f7d),//60%
      600: Color(0xff3c456d),//70%
      700: Color(0xff343b5e),//80%
      800: Color(0xff2b324e),//90%
      900: Color(0xff22283e),//100%
    },
  );
  static const MaterialColor darkMainColor = MaterialColor(
    0xFFD9E2F8, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE0E7F3 ),//10%
      100: Color(0xFFD9E2F8),//20%
      200: Color(0xFF7B89DC),//30%
      300: Color(0xFF56639C),//40%
      400: Color(0xff4d598c),//50%
      500: Color(0xff454f7d),//60%
      600: Color(0xff3c456d),//70%
      700: Color(0xff343b5e),//80%
      800: Color(0xff2b324e),//90%
      900: Color(0xff22283e),//100%
    },
  );
}