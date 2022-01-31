import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/message/otp_screen.dart';
import 'package:productive_families/presentation/screens/register/register_screen.dart';
import 'package:productive_families/presentation/screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/screens/start/start_screen.dart';
import 'package:productive_families/presentation/screens/terms_and_conditions/terms_and_conditions.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = StartScreen();
  }


  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_SCREEN:
        return MaterialPageRoute(builder: (_) => startWidget);
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );
      case SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) =>
              ShopLayout(),
        );
      case TERMS_AND_CONDITIONS:
        return MaterialPageRoute(
          builder: (_) =>
             TermsAndConditionsScreen(),
        );
      case ABOUT_US:
        return MaterialPageRoute(
          builder: (_) =>
              AboutUsScreen(),
        );
      default:
        return null;
    }
  }
}
