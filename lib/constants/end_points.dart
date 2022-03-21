// ignore_for_file: constant_identifier_names, non_constant_identifier_names

//////////////////////////////// API ENDPOINTS Names ////////////////////////////////////////////////
///// Shared API
const EP_TERMS = 'terms';
const EP_ABOUT_US = 'about_us';
const EP_APP_SETTING = 'app_settings';

////// User Api
const EP_USER_LOGIN = 'login';
const EP_USER_REGISTER = 'register';
const EP_USER_REGISTER_CONFIRM_PHONE = 'account/verification';
const EP_USER_REGISTER_RESEND_CONFIRMATION_CODE = 'resend/code';
const EP_USER_LOGOUT = 'logout';
const EP_USER_PROFILE_UPDATE_ADDRESS= 'profile/update/address';

////// MO Api

////// DR Api

///////////////////////////////// sharedPreferences Keys /////////////////////////////////////////////
const String SP_ACCESS_TOKEN_KEY='SP_ACCESS_TOKEN';
const String SP_ACCOUNT_TYPE_KEY='SP_ACCOUNT_TYPE_KEY';
const String SP_ACCOUNT_NAME_KEY='SP_ACCOUNT_Name_KEY';
const String SP_ACCOUNT_PHONE_KEY='SP_ACCOUNT_PHONE_KEY';
const String SP_ACCOUNT_BALANCE_KEY='SP_ACCOUNT_BALANCE_KEY';

const String SP_ACCOUNT_POINTS_KEY='SP_ACCOUNT_POINTS_KEY';
const String SP_ACCOUNT_IMAGE_KEY='SP_ACCOUNT_IMAGE_KEY';
const String SP_ACCOUNT_TOTAL_ORDERS_KEY='SP_ACCOUNT_TOTAL_ORDERS_KEY';



///////////////////////////////// Screens PushNamed Names/////////////////////////////////////////////

//USER
const USER_START_SCREEN = 'USER_START_SCREEN';
const USER_LOGIN_SCREEN = '/USER_LOGIN_SCREEN';
const REGISTER_SCREEN = '/register';
const TERMS_AND_CONDITIONS = '/terms_and_conditions';
const ABOUT_US_SCREEN = '/ABOUT_US_SCREEN';
const ABOUT_PRODUCT = '/about_product';
const OTP_SCREEN = '/otp';
const SHOP_LAYOUT = '/shop_layout';
const ORDERS_SCREEN = '/ORDERS_SCREEN';
const SELECTED_FAVORITE_SCREEN = '/SELECTED_FAVORITE_SCREEN';
const CUSTOMER_SERVICES_CHAT_SCREEN = '/customer_services_chat_screen';
const SELLER_CHAT_SCREEN = '/seller_chat_screen';
const ORDER_CONFIRMATION_SCREEN = '/order_confirmation_screen';
const DELIVERY_REPRESENTATIVE_SCREEN = '/delivery_representative_screen';
const DELIVERY_REPRESENTATIVE_LOCATOR_SCREEN =
    '/delivery_representative_locator_screen';
const SPECIFY_LOCATION = '/specify_location';
const BASKET_SCREEN = '/basket_screen';
const ORDER_LOCATION = '/order_location';
const FIRST_TIME_LOCATION_PICKER = '/FIRST_TIME_LOCATION_PICKER';
const ORDER_DETAILS_SCREEN = '/order_details_screen';
const ORDER_DETAILS_SECOND_SCREEN = '/order_details_second_screen';
const ORDER_ADDRESS_CONFIRMATION_SCREEN = '/order_address_confirmation_screen';
const QUOTATIONS_SCREEN = '/quotations_screen';
const CHOSEN_MARKET_SCREEN = '/chosen_market_screen';
const NOTIFICATIONS_SCREEN = '/notifications_screen';
const FILTERING_SCREEN = '/FILTERING_SCREEN';
const CHOSEN_MARKET_PRICE_FILTERING_SCREEN =
    '/CHOSEN_MARKET_PRICE_FILTERING_SCREEN';
const MARKETS_PRICE_FILTERING_SCREEN = '/MARKETS_PRICE_FILTERING_SCREEN';
const CHOSEN_MARKET_ORDERING_SCREEN = '/CHOSEN_MARKET_ORDERING_SCREEN';
const MARKETS_ORDERING_SCREEN = '/MARKETS_ORDERING_SCREEN';
const SEARCH_SCREEN = '/SEARCH_SCREEN';
const DISPLAY_REPRESENTATIVE_PRICE_ITEM = '/DISPLAY_REPRESENTATIVE_PRICE_ITEM';
const CHOOSE_ACCOUNT_SCREEN = '/CHOOSE_ACCOUNT_SCREEN';
const ORDER_FOLLOW_UP = '/ORDER_FOLLOW_UP';
const ABOUT_ORDERED_PRODUCT_SCREEN = '/ABOUT_ORDERED_PRODUCT_SCREEN';

//DELIVERY_REPRESENTATIVE
const DELIVERY_REPRESENTATIVE_START_SCREEN =
    '/DELIVERY_REPRESENTATIVE_START_SCREEN';
const DELIVERY_REPRESENTATIVE_LOGIN_SCREEN =
    '/DELIVERY_REPRESENTATIVE_LOGIN_SCREEN';
const DELIVERY_REPRESENTATIVE_REGISTER_SCREEN =
    '/DELIVERY_REPRESENTATIVE_REGISTER_SCREEN';
const DELIVERY_REPRESENTATIVE_OTP_SCREEN =
    '/DELIVERY_REPRESENTATIVE_OTP_SCREEN';
const DELIVERY_REPRESENTATIVE_LOCATION_PICKER_SCREEN =
    '/DELIVERY_REPRESENTATIVE_LOCATION_PICKER_SCREEN';
const DELIVERY_REPRESENTATIVE_SHOP_LAYOUT =
    '/DELIVERY_REPRESENTATIVE_SHOP_LAYOUT';
const DELIVERY_REPRESENTATIVE_HOME_SCREEN =
    '/DELIVERY_REPRESENTATIVE_HOME_SCREEN';
const DELIVERY_REPRESENTATIVE_PROFILE_SCREEN =
    '/DELIVERY_REPRESENTATIVE_PROFILE_SCREEN';
const DELIVERY_REPRESENTATIVE_DELIVERY_ORDERS_SCREEN =
    '/DELIVERY_REPRESENTATIVE_DELIVERY_ORDERS_SCREEN';
const DELIVERY_REPRESENTATIVE_NEAR_BY_ORDERS =
    '/DELIVERY_REPRESENTATIVE_HOME_SCREEN';
const DELIVERY_REPRESENTATIVE_OFFER_PRICE =
    '/DELIVERY_REPRESENTATIVE_OFFER_PRICE';
const DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION =
    '/DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION';
const DELIVERY_REPRESENTATIVE_RECEIVING_ORDER =
    '/DELIVERY_REPRESENTATIVE_RECEIVING_ORDER';
const DELIVERY_REPRESENTATIVE_ORDER_DELIVERING =
    '/DELIVERY_REPRESENTATIVE_ORDER_DELIVERING';
const DELIVERY_REPRESENTATIVE_NOTIFICATION =
    '/DELIVERY_REPRESENTATIVE_NOTIFICATION';
const DELIVERY_REPRESENTATIVE_ORDER_NOTIFICATION_DETAILS =
    '/DELIVERY_REPRESENTATIVE_ORDER_NOTIFICATION_DETAILS';
const DELIVERY_REPRESENTATIVE_ORDER_DETAILS =
    '/DELIVERY_REPRESENTATIVE_ORDER_DETAILS';

//MARKET_OWNER
const MARKET_OWNER_START_SCREEN = '/MARKET_OWNER_START_SCREEN';
const MARKET_OWNER_LOGIN_SCREEN = '/MARKET_OWNER_LOGIN_SCREEN';
const MARKET_OWNER_REGISTER_SCREEN = '/MARKET_OWNER_REGISTER_SCREEN';
const MARKET_OWNER_OTP_SCREEN = '/MARKET_OWNER_OTP_SCREEN';
const MARKET_OWNER_SHOP_LAYOUT = '/MARKET_OWNER_SHOP_LAYOUT';
const MARKET_OWNER_CURRENT_ORDERS_SCREEN =
    '/MARKET_OWNER_CURRENT_ORDERS_SCREEN';
const MARKET_OWNER_EDIT_PRODUCT_SCREEN = '/MARKET_OWNER_EDIT_PRODUCT_SCREEN';
const MARKET_OWNER_ABOUT_US_SCREEN = '/MARKET_OWNER_ABOUT_US_SCREEN';
const MARKET_OWNER_TERMS_AND_CONDITIONS_SCREEN =
    '/MARKET_OWNER_TERMS_AND_CONDITIONS_SCREEN';
const MARKET_OWNER_ADD_OFFER_SCREEN = '/MARKET_OWNER_ADD_OFFER_SCREEN';
const MARKET_OWNER_ORDER_DETAILS_SCREEN = '/MARKET_OWNER_ORDER_DETAILS_SCREEN';
const MARKET_OWNER_NOTIFICATIONS_SCREEN = '/MARKET_OWNER_NOTIFICATIONS_SCREEN';
const MARKET_OWNER_ORDER_FOLLOW_UP_SCREEN =
    '/MARKET_OWNER_ORDER_FOLLOW_UP_SCREEN';
const MARKET_OWNER_FILTERING_SCREEN_SCREEN =
    '/MARKET_OWNER_FILTERING_SCREEN_SCREEN';
const MARKET_OWNER_ADD_NEW_PRODUCT_SCREEN_SCREEN =
    '/MARKET_OWNER_ADD_NEW_PRODUCT_SCREEN_SCREEN';
const MARKET_OWNER_CHAT_SCREEN = '/MARKET_OWNER_CHAT_SCREEN';
const MARKET_OWENR_CONVERSATION_SCREEN = '/MARKET_OWENR_CONVERSATION_SCREEN';

//Guest
const GUEST_LOCATION_PICKER = '/GUEST_LOCATION_PICKER';
const GUEST_SHOP_LAYOUT = '/GUEST_SHOP_LAYOUT';
const GUEST_ABOUT_PRODUCT = '/GUEST_ABOUT_PRODUCT';
const GUEST_FILTERING_SCREEN = '/GUEST_FILTERING_SCREEN';
const GUEST_CHOSEN_MARKET_SCREEN = '/GUEST_CHOSEN_MARKET_SCREEN';
const GUEST_MARKETS_PRICE_FILTERING_SCREEN =
    '/GUEST_MARKETS_PRICE_FILTERING_SCREEN';
const GUEST_MARKETS_ORDERING_SCREEN = '/GUEST_MARKETS_ORDERING_SCREEN';
const GUEST_CHOSEN_MARKET_ORDERING_SCREEN =
    '/GUEST_CHOSEN_MARKET_ORDERING_SCREEN';
const GUEST_CHOSEN_MARKET_PRICE_FILTERING_SCREEN =
    '/GUEST_CHOSEN_MARKET_PRICE_FILTERING_SCREEN';
