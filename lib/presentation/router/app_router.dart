import 'package:flutter/material.dart';
import 'package:productive_families/business_logic/user/request_driver/user_request_driver_cubit.dart';
import 'package:productive_families/business_logic/user/start_order_process_and_order_location/user_start_order_process_and__order_location_cubit.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/end_points.dart' as endpoints;
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/delivery_orders/dr_delivery_orders.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/location/dr_choose_order_location.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/location/dr_location_picker.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/location/dr_order_delivering.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/location/dr_receiving_order.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/login/dr_login_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/near_by_orders/dr_near_by_orders.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/notifications/dr_notifications_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/offer_price/dr_offer_price.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/order_details/dr_order_details_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/order_details/dr_order_notification_details_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/otp/dr_otp_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/register/dr_register_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/shop_layout/dr_shop_layout.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/start/dr_start_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/about_product/guest_about_product.dart';
import 'package:productive_families/presentation/screens/guest_screens/chosen_market/guest_chosen_market_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/filter_screens/guest_filtering_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/filter_screens/ordering/guest_chosen_market_ordering_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/filter_screens/ordering/guest_markets_ordering_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/filter_screens/price_filtering/guest_chosen_market_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/filter_screens/price_filtering/guest_markets_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/location/guest_location_picker.dart';
import 'package:productive_families/presentation/screens/guest_screens/shop_layout/guest_shop_layout.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/about_product/mo_about_us.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/add_offer/mo_add_offer.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/chat/mo_chat_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/conversation/mo_conversation.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/current_orders/mo_current_orders.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/edit_product/mo_edit_product.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/filter_screen/mo_Filtering_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/login/mo_login_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/new_product/mo_add_new_product_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/notifications/mo_notifications_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/order_details/mo_order_details_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/order_follow_up/mo_order_follow_up_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/otp/mo_otp_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/register/mo_register_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/shop_layout/mo_shop_layout.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/start/mo_start_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/terms_and_conditions/mo_terms_and_conditions.dart';
import 'package:productive_families/presentation/screens/shared_screens/search/user_reviews_search_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/about_product/about_product.dart';
import 'package:productive_families/presentation/screens/user_screens/about_us/about_us.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/customer_services_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/chat/seller_chat_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/choose_account/choose_account.dart';
import 'package:productive_families/presentation/screens/user_screens/delivery_representative/request_driver_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/ordering/chosen_market_ordering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/ordering/markets_ordering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/price_filtering/chosen_market_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/filter_screens/price_filtering/markets_price_filtering_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/location/request_driver_from_location_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/location/first_time_location_picker.dart';
import 'package:productive_families/presentation/screens/user_screens/location/order_location_picking_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/location/update_user_location.dart';
import 'package:productive_families/presentation/screens/user_screens/login/user_login_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/notifications/notifications_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_address_confirmation/order_address_confirmation_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_details/order_products_checkout_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_details/show_order_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/order_tracks/user_order_tracks_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/otp/user_otp_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/product_all_reviews/user_product_all_reviews_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/quotations/quotations_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/register/user_register_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/search/user_product_search_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/shop_layout/user_shop_layout.dart';
import 'package:productive_families/presentation/screens/user_screens/start/user_start_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/sub_category_product/sub_category_product_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/terms_and_conditions/terms_and_conditions.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/notification/display_representative_price_item.dart';

import '../../business_logic/user/profile/user_profile_cubit.dart';
import '../../business_logic/user/sub_category_product/user_sub_category_product_cubit.dart';
import '../../constants/shared_preferences_keys.dart';
import '../../data/models/user_models/orders/user_start_order_process_model.dart';
import '../screens/user_screens/cart/cart_screen.dart';
import '../screens/user_screens/location/order_location_follow_up_screen.dart';
import '../screens/user_screens/location/request_driver_to_location_screen.dart';
import '../screens/user_screens/orders/all_orders_screen.dart';
import '../screens/user_screens/selected_favorite_group/selected_favorite_group_screen.dart';
import '../screens/user_screens/start_order_process/start_order_process_screen.dart';
import '../screens/user_screens/store_sub_category/store_sub_category_screen.dart';
import 'arguments/user_arguments/store_sub_category_args.dart';
import 'arguments/user_arguments/sub_category_product_args.dart';
import 'arguments/user_arguments/user_selected_favorite_group_args.dart';

class AppRouter {
  late Widget startWidget;

  AppRouter() {
    accessToken = CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_ACCESS_TOKEN_KEY);
    accountType = CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_ACCOUNT_TYPE_KEY);
    userId = CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_ACCOUNT_USERID_KEY);
    bool locationPicked = CacheHelper.getDataFromSP(
            key: SharedPreferencesKeys.SP_LOCATION_PICKED) ??
        false;

    if (accessToken != null) {
      if (accountType == 'users') {
        if (locationPicked) {
          startWidget = const UserShopLayout();
        } else {
          startWidget = const FirstTimeLocationPicker();
        }
      } else if (accountType == 'drivers') {
        startWidget = const DeliveryRepresentativeShopLayout();
      } else if (accountType == 'providers') {
        startWidget = const MarketOwnerShopLayout();
      }
    } else {
      startWidget = const ChooseAccount();
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startWidget);
      case endpoints.CHOOSE_ACCOUNT_SCREEN:
        return MaterialPageRoute(builder: (_) => ChooseAccount());
      case endpoints.USER_START_SCREEN:
        return MaterialPageRoute(builder: (_) => const UserStartScreen());
      case endpoints.USER_LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case endpoints.REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const UserRegisterScreen(),
        );
      case endpoints.USER_PRODUCT_ALL_REVIEWS_SCREEN:
        final int productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => UserProductAllReviewsScreen(productId: productId),
        );
      case endpoints.DISPLAY_REPRESENTATIVE_PRICE_ITEM:
        return MaterialPageRoute(
          builder: (_) => const DisplayRepresentativePriceItem(),
        );
      case endpoints.OTP_SCREEN:
        final String phoneNum = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => UserOtpScreen(phone: phoneNum),
        );
      case endpoints.SHOP_LAYOUT:
        final int index = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => UserShopLayout(index: index),
        );
      case endpoints.TERMS_AND_CONDITIONS:
        return MaterialPageRoute(
          builder: (_) => TermsAndConditionsScreen(),
        );
      case endpoints.ABOUT_US_SCREEN:
        return MaterialPageRoute(
          builder: (_) => AboutUsScreen(),
        );
      case endpoints.USER_ABOUT_PRODUCT:
        final int productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => AboutProduct(productId: productId),
        );
      case endpoints.USER_ALL_ORDERS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const UserAllOrdersScreen(),
        );
      case endpoints.SELECTED_FAVORITE_GROUP_SCREEN:
        final UserSelectedFavoriteGroupArgs args =
            settings.arguments as UserSelectedFavoriteGroupArgs;

        return MaterialPageRoute(
          builder: (_) =>
              SelectedFavoriteGroupScreen(userSelectedFavoriteGroupArgs: args),
        );
      case endpoints.STORE_SUB_CATEGORY_SCREEN:
        final StoreSubCategoryArgs args =
            settings.arguments as StoreSubCategoryArgs;
        return MaterialPageRoute(
          builder: (_) => StoreSubCategoryScreen(
            storeSubCategoryArgs: args,
          ),
        );
      case endpoints.SUB_CATEGORY_PRODUCT_SCREEN:
        final SubCategoryProductArgs args =
            settings.arguments as SubCategoryProductArgs;

        return MaterialPageRoute(
          builder: (_) =>
              SubCategoryProductScreen(subCategoryProductArgs: args),
        );
      case endpoints.CHOSEN_MARKET_PRICE_FILTERING_SCREEN:
        UserSubCategoryProductCubit cubit =
            settings.arguments as UserSubCategoryProductCubit;
        return MaterialPageRoute(
          builder: (_) => ChosenMarketPriceFilteringScreen(
              userSubCategoryProductCubit: cubit),
        );
      case endpoints.MARKETS_PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketsPriceFilteringScreen(),
        );
      case endpoints.MARKETS_ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketsOrderingScreen(),
        );
      case endpoints.CHOSEN_MARKET_ORDERING_SCREEN:
        UserSubCategoryProductCubit cubit =
            settings.arguments as UserSubCategoryProductCubit;
        return MaterialPageRoute(
          builder: (_) =>
              ChosenMarketOrderingScreen(userSubCategoryProductCubit: cubit),
        );
      case endpoints.CUSTOMER_SERVICES_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => CustomerServicesChatScreen(),
        );
      case endpoints.SELLER_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => SellerChatScreen(),
        );
      case endpoints.USER_START_ORDER_PROCESS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => UserStartOrderProcessScreen(),
        );
      case endpoints.REQUEST_DRIVER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RequestDriverScreen(),
        );
      case endpoints.REQUEST_DRIVER_FROM_LOCATION_SCREEN:
        final UserRequestDriverCubit cubit =
            settings.arguments as UserRequestDriverCubit;

        return MaterialPageRoute(
          builder: (_) =>
              RequestDriverFromLocationScreen(userRequestDriverCubit: cubit),
        );
      case endpoints.REQUEST_DRIVER_TO_LOCATION_SCREEN:
        final UserRequestDriverCubit cubit =
            settings.arguments as UserRequestDriverCubit;

        return MaterialPageRoute(
          builder: (_) =>
              RequestDriverToLocationScreen(userRequestDriverCubit: cubit),
        );
      case endpoints.UPDATE_USER_LOCATION:
        final UserProfileCubit cubit = settings.arguments as UserProfileCubit;
        return MaterialPageRoute(
          builder: (_) => UpdateUserLocation(userProfileCubit: cubit),
        );
      case endpoints.BASKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
      case endpoints.ORDER_LOCATION_PICKING_SCREEN:
        final UserStartOrderProcessAndOrderLocationCubit cubit =
            settings.arguments as UserStartOrderProcessAndOrderLocationCubit;

        return MaterialPageRoute(
          builder: (_) => OrderLocationPickingScreen(
              userStartOrderProcessAndOrderLocationCubit: cubit),
        );
      case endpoints.ORDER_LOCATION_FOLLOW_UP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => OrderLocationFollowUpScreen(),
        );
      case endpoints.ORDER_PRODUCTS_CHECKOUT_SCREEN:
        final int orderId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => OrderProductsCheckOutScreen(orderId: orderId),
        );
      case endpoints.USER_SHOW_ORDER_SCREEN:
        final int orderId = settings.arguments as int;

        return MaterialPageRoute(
          builder: (_) => UserShowOrderScreen(
            orderId: orderId,
          ),
        );
      case endpoints.QUOTATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const QuotationsScreen(),
        );
      case endpoints.USER_PRODUCT_SEARCH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => UserProductSearchScreen(),
        );
      case endpoints.USER_REVIEWS_SEARCH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const UserReviewsSearchScreen(),
        );

      case endpoints.NOTIFICATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      case endpoints.ORDER_ADDRESS_CONFIRMATION_SCREEN:
        final OrderDetails orderDetails = settings.arguments as OrderDetails;
        return MaterialPageRoute(
          builder: (_) =>
              OrderAddressConfirmationScreen(orderDetails: orderDetails),
        );
      case endpoints.USER_ORDER_TRACKS_SCREEN:
        final int orderId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => UserOrderTracksScreen(orderId: orderId),
        );
      case endpoints.FIRST_TIME_LOCATION_PICKER:
        return MaterialPageRoute(
          builder: (_) => const FirstTimeLocationPicker(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeStartScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLoginScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeRegisterScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeOtpScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_LOCATION_PICKER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeLocationPicker(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeShopLayout(),
        );
      case endpoints.MARKET_OWNER_START_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerStartScreen(),
        );
      case endpoints.MARKET_OWNER_LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerLoginScreen(),
        );
      case endpoints.MARKET_OWNER_REGISTER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerRegisterScreen(),
        );
      case endpoints.MARKET_OWNER_OTP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerOtpScreen(),
        );
      case endpoints.MARKET_OWNER_SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerShopLayout(),
        );
      case endpoints.MARKET_OWNER_CURRENT_ORDERS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerCurrentOrdersScreen(),
        );
      case endpoints.MARKET_OWNER_EDIT_PRODUCT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerEditProductScreen(),
        );
      case endpoints.MARKET_OWNER_ABOUT_US_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerAboutUsScreen(),
        );
      case endpoints.MARKET_OWNER_TERMS_AND_CONDITIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerTermsAndConditionsScreen(),
        );
      case endpoints.MARKET_OWNER_ADD_OFFER_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerAddOfferScreen(),
        );
      case endpoints.MARKET_OWNER_ORDER_DETAILS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerOrderDetailsScreen(),
        );
      case endpoints.MARKET_OWNER_NOTIFICATIONS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerNotificationsScreen(),
        );
      case endpoints.MARKET_OWNER_ORDER_FOLLOW_UP_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerOrderFollowUp(),
        );
      case endpoints.MARKET_OWNER_FILTERING_SCREEN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwnerFilteringScreen(),
        );
      case endpoints.MARKET_OWNER_ADD_NEW_PRODUCT_SCREEN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerAddNewProductScreen(),
        );

      case endpoints.DELIVERY_REPRESENTATIVE_DELIVERY_ORDERS_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeDeliveryOrders(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_NEAR_BY_ORDERS:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeNearByOrders(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_OFFER_PRICE:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeOfferPrice(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION:
        return MaterialPageRoute(
          builder: (_) => DeliveryRepresentativeChooseOrderLocation(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_RECEIVING_ORDER:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeReceivingOrder(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_ORDER_DELIVERING:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeOrderDelivering(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_NOTIFICATION:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeNotificationsScreen(),
        );
      case endpoints.GUEST_LOCATION_PICKER:
        return MaterialPageRoute(
          builder: (_) => GuestLocationPicker(),
        );
      case endpoints.GUEST_SHOP_LAYOUT:
        return MaterialPageRoute(
          builder: (_) => const GuestShopLayout(),
        );
      case endpoints.GUEST_ABOUT_PRODUCT:
        return MaterialPageRoute(
          builder: (_) => const GuestAboutProduct(),
        );
      case endpoints.GUEST_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestFilteringScreen(),
        );
      case endpoints.GUEST_CHOSEN_MARKET_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestChosenMarketScreen(),
        );
      case endpoints.GUEST_MARKETS_PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestMarketsPriceFilteringScreen(),
        );
      case endpoints.GUEST_MARKETS_ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestMarketsOrderingScreen(),
        );
      case endpoints.GUEST_CHOSEN_MARKET_ORDERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestChosenMarketOrderingScreen(),
        );
      case endpoints.GUEST_CHOSEN_MARKET_PRICE_FILTERING_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const GuestChosenMarketPriceFilteringScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_ORDER_NOTIFICATION_DETAILS:
        return MaterialPageRoute(
          builder: (_) =>
              const DeliveryRepresentativeOrderNotificationDetailsScreen(),
        );
      case endpoints.DELIVERY_REPRESENTATIVE_ORDER_DETAILS:
        return MaterialPageRoute(
          builder: (_) => const DeliveryRepresentativeOrderDetailsScreen(),
        );
      case endpoints.MARKET_OWNER_CHAT_SCREEN:
        return MaterialPageRoute(
          builder: (_) => MarketOwnerChatScreen(),
        );
      case endpoints.MARKET_OWNER_CONVERSATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const MarketOwenrConversationScreen(),
        );
      default:
        return null;
    }
  }
}
