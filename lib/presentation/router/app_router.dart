import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart' as endpoints;
import 'package:productive_families/presentation/screens/delivery_representative_screen/location/dr_location_picker.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/login/dr_login_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/otp/dr_otp_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/register/dr_register_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/shop_layout/dr_shop_layout.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/start/dr_start_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/current_orders/mo_current_orders.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/login/mo_login_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/otp/mo_otp_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/register/mo_register_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/shop_layout/mo_shop_layout.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/start/mo_start_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/about_product/about_product.dart';
import 'package:productive_families/presentation/screens/user_screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/user_screens/basket/basket_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/seller_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/choose_account/choose_account.dart';
import 'package:productive_families/presentation/screens/user_screens/chosen_market/chosen_market_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/delivery_representative/delivery_representative_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/Filtering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/ordering/chosen_market_ordering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/ordering/markets_ordering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/price_filtering/chosen_market_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/price_filtering/markets_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/location/delivery_representative_locator_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/location/guest_location_picker.dart';
import 'package:productive_families/presentation/screens/user_screens/location/order_location.dart';
import 'package:productive_families/presentation/screens/user_screens/location/specify_location.dart';
import 'package:productive_families/presentation/screens/user_screens/login/login_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/notifications/notifications_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_address_confirmation/order_address_confirmation_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_confirmation/order_confirmation_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_details/order_details_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_details/order_details_second_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_follow_up/OrderFollowUp.dart';
import 'package:productive_families/presentation/screens/user_screens/orders/orders_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/otp/otp_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/quotations/quotations_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/register/register_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/search/search_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/selected_favorite/selected_favorite_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/shop_layout.dart';
import 'package:productive_families/presentation/screens/user_screens/start/start_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/display_representative_price_item.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    startWidget = ChooseAccount();
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startWidget);
      case endpoints.START_SCREEN:
        return MaterialPageRoute(builder: (_) => StartScreen());
      case endpoints.LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case endpoints.REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      case endpoints.DISPLAY_REPRESENTATIVE_PRICE_ITEM:
        return MaterialPageRoute(
          builder: (_) => DisplayRepresentativePriceItem(),
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
      case endpoints.ORDERES_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
        );
      case endpoints.SELECTED_FAVORITE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SelectedFavoriteScreen(),
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
          builder: (_) => OrderAddressConfirmationScreen(),
        );
      case endpoints.ORDER_FOLLOW_UP:
        return MaterialPageRoute(
          builder: (_) => OrderFollowUp(),
        );
      case endpoints.GUEST_LOCATION_PICKER:
        return MaterialPageRoute(
          builder: (_) => GuestLocationPicker(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeStartScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLoginScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeRegisterScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeOtpScreen(),
        );
        case endpoints.DELIVERY_REPRESENTATIVE_LOCATION_PICKER:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLocationPicker(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeShopLayout(),
        );
        case endpoints.MARKET_OWNER_START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerStartScreen(),
        );
        case endpoints.MARKET_OWNER_LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerLoginScreen(),
        );
        case endpoints.MARKET_OWNER_REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerRegisterScreen(),
        );
        case endpoints.MARKET_OWNER_OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerOtpScreen(),
        );
        case endpoints.MARKET_OWNER_SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerShopLayout(),
        );
        case endpoints.MARKET_OWNER_CURRENT_ORDERS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerCurrentOrdersScreen(),
        );


      default:
        return null;
    }
  }
}
