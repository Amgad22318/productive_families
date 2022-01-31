import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/location/location_picker.dart';
import 'package:productive_families/presentation/screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/meal/meals_screen.dart';
import 'package:productive_families/presentation/screens/orders/orders_screen.dart';
import 'package:productive_families/presentation/screens/otp/otp_screen.dart';
import 'package:productive_families/presentation/screens/register/register_screen.dart';
import 'package:productive_families/presentation/screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/screens/start/start_screen.dart';
import 'package:productive_families/presentation/screens/terms_and_conditions/terms_and_conditions.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = StartScreen();
    // startWidget = LocationPicker();
    // startWidget = OrdersScreen();
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
        case ORDERED_MEALS:
        return MaterialPageRoute(
          builder: (_) =>
              OrdersScreen(),
        );
        case MEALS_SCREEN:
        return MaterialPageRoute(
          builder: (_) =>
              MealsScreen(),
        );
      default:
        return null;
    }
  }
}
