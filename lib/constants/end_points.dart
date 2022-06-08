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
const EP_USER_PROFILE_UPDATE_ADDRESS = 'profile/update/address';
const EP_USER_PROFILE_SHOW = 'profile/show';
const EP_USER_PROFILE_UPDATE = 'profile/update';
const EP_USER_PROFILE_CHANGE_ACCOUNT = 'profile/change_account';
const EP_USER_TOP_RATED_PRODUCT = 'products/top_rated';
const EP_USER_SHOW_PRODUCT = 'product/show';
const EP_USER_SEARCH_HOME = 'search/home';
const EP_USER_ALL_CATEGORIES = 'categories/all';
const EP_USER_ALL_CATEGORY_STORES = 'stores/all';
const EP_USER_SINGLE_CATEGORY_STORES = 'category/stores';
const EP_USER_STORE_SUBCATEGORY = 'store/show';
const EP_USER_STORE_SUBCATEGORY_PRODUCT = 'store/sub_category/products';
const EP_USER_ADD_PRODUCT_TO_CART = 'order/add/product';
const EP_USER_CANCEL_ORDER_PROCESS = 'cancel/order/process';
const EP_USER_START_ORDER_PROCESS = 'start/order/process';
const EP_USER_UPDATE_ORDER_TO_LOCATION = 'update/order/to_location';
const EP_USER_ORDER_SHOW_CHECKOUT_PRODUCTS = 'order/show/check_out/products';
const EP_USER_ORDER_TRACKS = 'order/tracks';
const EP_USER_RECEIVED_ORDER = 'received/order';
const EP_USER_ALL_ORDERS = 'all/orders';
const EP_USER_SHOW_ORDER = 'show/order';
const EP_USER_FINISH_ORDER_PROCESS = 'finishe/order/process';
const EP_USER_DELETE_PRODUCT_FROM_CART = 'order/delete/cart';
const EP_USER_SHOW_CART_PRODUCTS = 'order/show/carts/products';
const EP_USER_MODIFY_CART_PRODUCT_QUANTITY =
    'order/modify/cart/product/quantity';
const EP_USER_PROMO_CODE_DETAILS = 'promocodeDetail';
const EP_USER_FAVORITE_GROUP_PRODUCTS = 'favorites/group/products';
const EP_USER_ADD_FAVORITE_GROUP = 'add/favorites/group';
const EP_USER_ALL_FAVORITE_GROUPS = 'favorites/groups/all';
const EP_USER_SEARCH_FAVORITE_GROUP = 'search/favorites';
const EP_USER_RATE_PRODUCT = 'arate/product';
const EP_USER_ADD_PRODUCT_TO_FAVORITE = 'add/favorites/group/product';
const EP_USER_PRODUCT_RATES = 'product/rates';
const EP_USER_REQUEST_DRIVER = 'make/ask_for_driver';
////// MO Api
const EP_DR_LOGIN = 'drivers/login';

////// DR Api

///////////////////////////////// Screens PushNamed Names/////////////////////////////////////////////

//USER
const USER_START_SCREEN = 'USER_START_SCREEN';
const USER_LOGIN_SCREEN = '/USER_LOGIN_SCREEN';
const REGISTER_SCREEN = '/register';
const TERMS_AND_CONDITIONS = '/terms_and_conditions';
const ABOUT_US_SCREEN = '/ABOUT_US_SCREEN';
const USER_ABOUT_PRODUCT = '/about_product';
const OTP_SCREEN = '/otp';
const SHOP_LAYOUT = '/shop_layout';
const USER_ALL_ORDERS_SCREEN = '/ORDERS_SCREEN';
const SELECTED_FAVORITE_GROUP_SCREEN = '/SELECTED_FAVORITE_GROUP_SCREEN';
const CUSTOMER_SERVICES_CHAT_SCREEN = '/customer_services_chat_screen';
const SELLER_CHAT_SCREEN = '/seller_chat_screen';
const USER_START_ORDER_PROCESS_SCREEN = '/USER_START_ORDER_PROCESS_SCREEN';
const REQUEST_DRIVER_SCREEN = '/REQUEST_DRIVER_SCREEN';
const REQUEST_DRIVER_FROM_LOCATION_SCREEN =
    '/REQUEST_DRIVER_FROM_LOCATION_SCREEN';
const REQUEST_DRIVER_TO_LOCATION_SCREEN = '/REQUEST_DRIVER_TO_LOCATION_SCREEN';
const UPDATE_USER_LOCATION = '/UPDATE_USER_LOCATION';
const BASKET_SCREEN = '/basket_screen';
const ORDER_LOCATION_PICKING_SCREEN = '/ORDER_LOCATION_PICKING_SCREEN';
const ORDER_LOCATION_FOLLOW_UP_SCREEN = '/ORDER_LOCATION_FOLLOW_UP_SCREEN';
const FIRST_TIME_LOCATION_PICKER = '/FIRST_TIME_LOCATION_PICKER';
const ORDER_PRODUCTS_CHECKOUT_SCREEN = '/ORDER_PRODUCTS_CHECKOUT_SCREEN';
const USER_SHOW_ORDER_SCREEN = '/USER_SHOW_ORDER_SCREEN';
const ORDER_ADDRESS_CONFIRMATION_SCREEN = '/order_address_confirmation_screen';
const QUOTATIONS_SCREEN = '/quotations_screen';
const STORE_SUB_CATEGORY_SCREEN = '/STORE_SUB_CATEGORY_SCREEN';
const NOTIFICATIONS_SCREEN = '/notifications_screen';
const SUB_CATEGORY_PRODUCT_SCREEN = '/SUB_CATEGORY_PRODUCT_SCREEN';
const CHOSEN_MARKET_PRICE_FILTERING_SCREEN =
    '/CHOSEN_MARKET_PRICE_FILTERING_SCREEN';
const MARKETS_PRICE_FILTERING_SCREEN = '/MARKETS_PRICE_FILTERING_SCREEN';
const CHOSEN_MARKET_ORDERING_SCREEN = '/CHOSEN_MARKET_ORDERING_SCREEN';
const MARKETS_ORDERING_SCREEN = '/MARKETS_ORDERING_SCREEN';
const USER_PRODUCT_SEARCH_SCREEN = '/USER_PRODUCT_SEARCH_SCREEN';
const USER_REVIEWS_SEARCH_SCREEN = '/USER_REVIEWS_SEARCH_SCREEN';
const DISPLAY_REPRESENTATIVE_PRICE_ITEM = '/DISPLAY_REPRESENTATIVE_PRICE_ITEM';
const CHOOSE_ACCOUNT_SCREEN = '/CHOOSE_ACCOUNT_SCREEN';
const USER_ORDER_TRACKS_SCREEN = '/USER_ORDER_TRACKS_SCREEN';
const USER_PRODUCT_ALL_REVIEWS_SCREEN = '/USER_PRODUCT_ALL_REVIEWS_SCREEN';

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
const MARKET_OWNER_CONVERSATION_SCREEN = '/MARKET_OWNER_CONVERSATION_SCREEN';

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
