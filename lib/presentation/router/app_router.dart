import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/about_product/about_product.dart';
import 'package:productive_families/presentation/screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/basket/basket_screen.dart';
import 'package:productive_families/presentation/screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/chat/seller_chat_screen.dart';
import 'package:productive_families/presentation/screens/chosen_market/chosen_market_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative/delivery_representative_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/Filtering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/ordering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/location/delivery_representative_locator_screen.dart';
import 'package:productive_families/presentation/screens/location/order_locatoin.dart';
import 'package:productive_families/presentation/screens/location/specify_location.dart';
import 'package:productive_families/presentation/screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/meal/meals_screen.dart';
import 'package:productive_families/presentation/screens/order_address_confirmation/order_address_confirmation_screen.dart';
import 'package:productive_families/presentation/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:productive_families/presentation/screens/order_details/order_details_screen.dart';
import 'package:productive_families/presentation/screens/order_details/order_details_second_screen.dart';
import 'package:productive_families/presentation/screens/orders/orders_screen.dart';
import 'package:productive_families/presentation/screens/otp/otp_screen.dart';
import 'package:productive_families/presentation/screens/quotations/quotations_screen.dart';
import 'package:productive_families/presentation/screens/register/register_screen.dart';
import 'package:productive_families/presentation/screens/search/search_screen.dart';
import 'package:productive_families/presentation/screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/screens/terms_and_conditions/terms_and_conditions.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = SearchScreen();
    // startWidget = FilteringScreen();
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
          builder: (_) => ShopLayout(),
        );
      case TERMS_AND_CONDITIONS:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsScreen(),
        );
      case ABOUT_US:
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(),
        );
      case ABOUT_PRODUCT:
        return MaterialPageRoute(
          builder: (_) => AboutProduct(),
        );
      case ORDERED_MEALS:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
        );
      case MEALS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MealsScreen(),
        );
      case CHOSEN_MARKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ChosenMarketScreen(),
        );
      case FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => FilteringScreen(),
        );
      case PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => PriceFilteringScreen(),
        );
      case ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderingScreen(),
        );
      case CUSTOMER_SERVICES_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => CustomerServicesChatScreen(),
        );
      case SELLER_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SellerChatScreen(),
        );
      case ORDER_CONFIRMATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderConfirmationScreen(),
        );
      case DELIVERY_REPRESENTATIVE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeScreen(),
        );
      case DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLocatorScreen(),
        );
      case SPECIFY_LOCATION:
        return MaterialPageRoute(
          builder: (_) => SpecifyLocation(),
        );
      case BASKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => BasketScreen(),
        );
      case ORDER_LOCATION:
        return MaterialPageRoute(
          builder: (_) => OrderLocation(),
        );
      case ORDER_DETAILS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(),
        );
      case ORDER_DETAILS_SECOND_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsSecondScreen(),
        );
      case QUOTATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => QuotationsScreen(),
        );
        case SEARCH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );
      case ORDER_ADDRESS_CONFIRMATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderAddressConfirmationScreen(
            paypalRadioValue: 'shopPay',
            shopPayRadioValue: 'paypal',
          ),
        );
      default:
        return null;
    }
  }
}
