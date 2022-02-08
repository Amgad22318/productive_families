import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart' as endpoints;
import 'package:productive_families/presentation/screens/about_product/about_product.dart';
import 'package:productive_families/presentation/screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/basket/basket_screen.dart';
import 'package:productive_families/presentation/screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/chat/seller_chat_screen.dart';
import 'package:productive_families/presentation/screens/choose_account/choose_account.dart';
import 'package:productive_families/presentation/screens/chosen_market/chosen_market_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative/delivery_representative_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/Filtering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/ordering/chosen_market_ordering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/ordering/markets_ordering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/price_filtering/chosen_market_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/filter_screens/price_filtering/markets_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/location/delivery_representative_locator_screen.dart';
import 'package:productive_families/presentation/screens/location/guest_location_picker.dart';
import 'package:productive_families/presentation/screens/location/order_locatoin.dart';
import 'package:productive_families/presentation/screens/location/specify_location.dart';
import 'package:productive_families/presentation/screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/meal/meals_screen.dart';
import 'package:productive_families/presentation/screens/notifications/notifications_screen.dart';
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
import 'package:productive_families/presentation/screens/start/start_screen.dart';
import 'package:productive_families/presentation/screens/terms_and_conditions/terms_and_conditions.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = ChooseAccount();
    // startWidget = FilteringScreen();
    // startWidget = OrdersScreen();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startWidget);
      case endpoints.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case endpoints.REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case endpoints.OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(),
        );
      case endpoints.SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => ShopLayout(),
        );
      case endpoints.TERMS_AND_CONDITIONS:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsScreen(),
        );
      case endpoints.ABOUT_US:
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(),
        );
      case endpoints.ABOUT_PRODUCT:
        return MaterialPageRoute(
          builder: (_) => AboutProduct(),
        );
      case endpoints.ORDERED_MEALS:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
        );
      case endpoints.MEALS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MealsScreen(),
        );
      case endpoints.CHOSEN_MARKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ChosenMarketScreen(),
        );
      case endpoints.FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => FilteringScreen(),
        );
      case endpoints.CHOSEN_MARKET_PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ChosenMarketPriceFilteringScreen(),
        );
      case endpoints.MARKETS_PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketsPriceFilteringScreen(),
        );
      case endpoints.MARKETS_ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketsOrderingScreen(),
        );
      case endpoints.CHOSEN_MARKET_ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ChosenMarketOrderingScreen(),
        );
      case endpoints.CUSTOMER_SERVICES_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => CustomerServicesChatScreen(),
        );
      case endpoints.SELLER_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SellerChatScreen(),
        );
      case endpoints.ORDER_CONFIRMATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderConfirmationScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLocatorScreen(),
        );
      case endpoints.SPECIFY_LOCATION:
        return MaterialPageRoute(
          builder: (_) => SpecifyLocation(),
        );
      case endpoints.BASKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => BasketScreen(),
        );
      case endpoints.ORDER_LOCATION:
        return MaterialPageRoute(
          builder: (_) => OrderLocation(),
        );
      case endpoints.ORDER_DETAILS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(),
        );
      case endpoints.ORDER_DETAILS_SECOND_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsSecondScreen(),
        );
      case endpoints.QUOTATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => QuotationsScreen(),
        );
      case endpoints.SEARCH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );

      case endpoints.NOTIFICATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => NotificationsScreen(),
        );
      case endpoints.ORDER_ADDRESS_CONFIRMATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderAddressConfirmationScreen(
            paypalRadioValue: 'shopPay',
            shopPayRadioValue: 'paypal',
          ),
        );
      case endpoints.START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => StartScreen()
        );
      case endpoints.GUEST_LOCATION_PICKER:
        return MaterialPageRoute(
            builder: (_) => GuestLocationPicker()
        );
      default:
        return null;
    }
  }
}
