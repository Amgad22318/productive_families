import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/chat/seller_chat_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative/delivery_representative_screen.dart';
import 'package:productive_families/presentation/screens/location/delivery_representative_locator_screen.dart';
import 'package:productive_families/presentation/screens/location/location_picker.dart';
import 'package:productive_families/presentation/screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/meal/meals_screen.dart';
import 'package:productive_families/presentation/screens/order_confirmation/OrderConfirmation.dart';
import 'package:productive_families/presentation/screens/orders/orders_screen.dart';
import 'package:productive_families/presentation/screens/otp/otp_screen.dart';
import 'package:productive_families/presentation/screens/register/register_screen.dart';
import 'package:productive_families/presentation/screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/screens/start/start_screen.dart';
import 'package:productive_families/presentation/screens/terms_and_conditions/terms_and_conditions.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    // startWidget = StartScreen();
    startWidget = LocationPicker();

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
        case CUSTOMER_SERVICES_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) =>
              CustomerServicesChatScreen(),
        );
        case SELLER_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) =>
              SellerChatScreen(),
        );
        case ORDER_CONFIRMATION:
        return MaterialPageRoute(
          builder: (_) =>
              OrderConfirmation(),
        );
        case DELIVERY_REPRESENTATIVE_SCREEN:
        return MaterialPageRoute(
          builder: (_) =>
              DeliveryRepresentativeScreen(),
        );
        case DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN:
        return MaterialPageRoute(
          builder: (_) =>
              DeliveryRepresentativeLocatorScreen(),
        );
      default:
        return null;
    }
  }
}
